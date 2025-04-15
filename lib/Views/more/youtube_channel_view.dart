import 'dart:async';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iobm/Views/news_feeds/youtube_full_screen.dart';
import 'package:iobm/Widgets/sec_appbar.dart';
import 'package:iobm/networkcalls/response_models/youtube_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iobm/utils/app_constants.dart';

import '../../utils/app_color.dart';
import '../../utils/app_images.dart';
import '../../utils/text_styles.dart';

class YoutubeChannelScreen extends StatefulWidget {
  const YoutubeChannelScreen({Key? key}) : super(key: key);

  @override
  _YoutubeChannelScreenState createState() => _YoutubeChannelScreenState();
}

class _YoutubeChannelScreenState extends State<YoutubeChannelScreen> {
  final ScrollController _scrollController = ScrollController();
  late List<YoutubeItem> _youtubeVideos;
  late Future _fetchData;
  String? nextPageToken;

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormatter = DateFormat('yyyy-MM-ddTHH:mm:ssZ');
    final DateFormat serverFormatter = DateFormat('dd/MM/yyyy HH:mm');
    final DateTime displayDate = displayFormatter.parse(date);
    final String formatted = serverFormatter.format(displayDate);
    return formatted;
  }

  @override
  void initState() {
    _youtubeVideos = [];
    _fetchData = getChannelVideos();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecAppBar(
        title: const Text('Youtube Channel'),
        context: context,
      ),
      body: FutureBuilder(
        future: _fetchData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return _bodyList();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _bodyList() {
    return ListView.separated(
      controller: _scrollController,
      itemCount: _youtubeVideos.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
          child: GestureDetector(
            onTap: () {
              Get.to(
                    () => YoutubeFullScreen(
                  videoId: _youtubeVideos[index].videoId,
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: AppColor.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.greyshade300.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: _youtubeVideos[index].thumbnail ?? '',
                          width: 120.w,
                          errorWidget: (context, url, error) => const Image(
                            image: AssetImage(
                              AppImages.noImage,
                            ),
                          ),
                        ),
                        Image.asset(AppImages.playButton, height: 30.h,width: 30.w,),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          _youtubeVideos[index].title ?? '',
                          style: CustomTextStyles.text14SemiBoldW600,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          convertDateTimeDisplay(
                              _youtubeVideos[index].publishedAt ?? ''),
                          style: CustomTextStyles.text12RegularW400,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }
  // Widget _bodyList() {
  //   return ListView.separated(
  //     controller: _scrollController,
  //     itemCount: _youtubeVideos.length,
  //     itemBuilder: (context, index) {
  //       return Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
  //         child: GestureDetector(
  //           onTap: () {
  //             Get.to(
  //               () => YoutubeFullScreen(
  //                 videoId: _youtubeVideos[index].videoId,
  //               ),
  //             );
  //           },
  //           child: Container(
  //             padding: const EdgeInsets.symmetric(horizontal: 10),
  //             child: Row(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 CachedNetworkImage(
  //                   imageUrl: _youtubeVideos[index].thumbnail ?? '',
  //                   width: 120.w,
  //                 ),
  //                 const SizedBox(
  //                   width: 10,
  //                 ),
  //                 Expanded(
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.start,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       const SizedBox(
  //                         height: 5,
  //                       ),
  //                       Text(
  //                         _youtubeVideos[index].title ?? '',
  //                         style: CustomTextStyles.text14SemiBoldW600,
  //                       ),
  //                       const SizedBox(
  //                         height: 3,
  //                       ),
  //                       Text(
  //                         convertDateTimeDisplay(
  //                             _youtubeVideos[index].publishedAt ?? ''),
  //                         style: CustomTextStyles.text12RegularW400,
  //                       )
  //                     ],
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //     separatorBuilder: (BuildContext context, int index) {
  //       return const Divider();
  //     },
  //   );
  // }

  Future<void> getChannelVideos() async {
    String url =
        "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=${AppConstants.channelId}&maxResults=10&key=AIzaSyCIyr0zcXkpw3UCF5eA8bD6dqgbYvhq5Ls";
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    Uri uri = Uri.parse(url);
    print(url);
    var response = await http.get(uri, headers: headers).timeout(
      const Duration(
        seconds: 45,
      ),
      onTimeout: () async {
        throw TimeoutException(
            'The connection has timed out, Please check your internet connection health and try again!');
      },
    );

    if (response.statusCode == 200) {
      // YoutubeEntity youtubeEntity = YoutubeEntity().fromJson(response);

      YoutubeEntity youtubeEntity =
          YoutubeEntity().fromJson(jsonDecode(response.body));
      setState(() {
        nextPageToken = youtubeEntity.nextPageToken;
      });

      for (var element in youtubeEntity.items!) {
        _youtubeVideos.add(
          YoutubeItem(
            id: element.id,
            thumbnail: element.snippet!.thumbnails!.high!.url,
            description: element.snippet!.description,
            channelTitle: element.snippet!.channelTitle,
            publishedAt: element.snippet!.publishedAt,
            videoId: element.snippet!.resourceId!.videoId,
            title: element.snippet!.title,
          ),
        );
      }
    }
  }

  Future<void> loadMoreData() async {
    String url =
        "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=${AppConstants.channelId}&maxResults=10&pageToken=$nextPageToken&key=AIzaSyCIyr0zcXkpw3UCF5eA8bD6dqgbYvhq5Ls";
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    Uri uri = Uri.parse(url);
    var response = await http.get(uri, headers: headers).timeout(
      const Duration(
        seconds: 45,
      ),
      onTimeout: () async {
        throw TimeoutException(
            'The connection has timed out, Please check your internet connection health and try again!');
      },
    );
    if (response.statusCode == 200) {
      YoutubeEntity youtubeEntity =
          YoutubeEntity().fromJson(jsonDecode(response.body));
      setState(() {
        nextPageToken = youtubeEntity.nextPageToken;
      });

      for (var element in youtubeEntity.items!) {
        _youtubeVideos.add(
          YoutubeItem(
            id: element.id,
            thumbnail: element.snippet!.thumbnails!.high!.url,
            description: element.snippet!.description,
            channelTitle: element.snippet!.channelTitle,
            publishedAt: element.snippet!.publishedAt,
            videoId: element.snippet!.resourceId!.videoId,
            title: element.snippet!.title,
          ),
        );
      }
    }
  }

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      //    message = "reach the bottom";
      loadMoreData();
    }
    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      //  message = "reach the top";
    }
  }
}

//ModelClass For playListItem

class YoutubeItem {
  String? id;
  String? thumbnail;
  String? publishedAt;
  String? title;
  String? description;
  String? channelTitle;
  String? videoId;

  YoutubeItem({
    this.id,
    this.title,
    this.thumbnail,
    this.description,
    this.channelTitle,
    this.publishedAt,
    this.videoId,
  });
}
