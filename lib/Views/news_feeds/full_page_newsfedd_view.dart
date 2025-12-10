import 'dart:io';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/news_feeds/video_player_view.dart';
import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/app_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:readmore/readmore.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../utils/text_styles.dart';

class FullPostScreen extends StatefulWidget {
  final String text;
  final List<DBPostImage> postImages;
  final String likes;
  final String comments;

  const FullPostScreen({
    Key? key,
    required this.text,
    required this.postImages,
    required this.likes,
    required this.comments,
  }) : super(key: key);

  @override
  _FullPostScreenState createState() => _FullPostScreenState();
}

class _FullPostScreenState extends State<FullPostScreen> {
  int currentIndex = 0;
  bool isLoading = false;
  late VideoPlayerController _controllers;
  // final YoutubePlayerController _controller = YoutubePlayerController(
  //   initialVideoId: 'iLnmTe5Q2Qw',
  //   flags: const YoutubePlayerFlags(
  //     autoPlay: true,
  //     mute: true,
  //   ),
  // );

  @override
  void initState() {
    _controllers = VideoPlayerController.network('');
    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controllers.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     const Spacer(),
          //     SizedBox(
          //       height: 200.h,
          //       child: PageView.builder(
          //         itemCount: widget.postImages.length,
          //         itemBuilder: (context, index) {
          //           currentIndex = index;
          //           return Center(
          //               child: widget.postImages[index].mediaType == "IMAGE"
          //                   ? CachedNetworkImage(
          //                       fit: BoxFit.cover,
          //                       imageUrl:
          //                           widget.postImages[index].postMedia ?? '',
          //                       placeholder: (context, url) {
          //                         return const Center(
          //                           child: SizedBox(
          //                             width: 25,
          //                             height: 25,
          //                             child: CircularProgressIndicator(
          //                               strokeWidth: 1,
          //                             ),
          //                           ),
          //                         );
          //                       },
          //                       imageBuilder: (context, imageProvider) {
          //                         return PhotoView(
          //                           imageProvider: imageProvider,
          //                         );
          //                       },
          //                       errorWidget: (context, url, error) =>
          //                           const Image(
          //                         image: AssetImage(
          //                           AppImages.noImage,
          //                         ),
          //                       ),
          //                     )
          //                   : FlickVideoPlayer(
          //                       flickManager: FlickManager(
          //                       videoPlayerController:
          //                           VideoPlayerController.network(
          //                               widget.postImages[index].postMedia ??
          //                                   ''),
          //                     )));
          //         },
          //       ),
          //     ),
          //     const Spacer(),
          //     Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 25),
          //       child: HtmlWidget(
          //         AppUtils().htmlString(widget.text),
          //         textStyle: TextStyle(
          //           fontSize: ScreenUtil().setSp(13),
          //           color: Colors.white,
          //           overflow: TextOverflow.ellipsis,
          //         ),
          //       ),
          //     ),
          //     const SizedBox(
          //       height: 25,
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 25),
          //       child: Row(
          //         children: [
          //           Text(
          //             "${widget.likes} Likes",
          //             style: TextStyle(
          //               fontSize: ScreenUtil().setSp(15),
          //               color: Colors.white,
          //             ),
          //           ),
          //           const SizedBox(
          //             width: 15,
          //           ),
          //           Text("${widget.comments} Comments",
          //               style: TextStyle(
          //                 fontSize: ScreenUtil().setSp(15),
          //                 color: Colors.white,
          //               )),
          //           const Spacer(),
          //           Visibility(
          //             visible: isLoading,
          //             replacement: GestureDetector(
          //               onTap: () async {
          //                 setState(() {
          //                   isLoading = true;
          //                 });
          //                 final url = Uri.parse(
          //                     widget.postImages[currentIndex].postMedia ?? "");
          //                 final response = await http.get(url);
          //                 final bytes = response.bodyBytes;
          //                 final temp = await getTemporaryDirectory();
          //                 final path = '${temp.path}/images.jpg';
          //                 File(path).writeAsBytesSync(bytes);
          //                 setState(() {
          //                   isLoading = false;
          //                 });
          //                 await Share.shareFiles([path]);
          //               },
          //               child: Container(
          //                 color: Colors.transparent,
          //                 height: 20.h,
          //                 child: Text("Share",
          //                     style: TextStyle(
          //                       fontSize: ScreenUtil().setSp(15),
          //                       color: Colors.white,
          //                     )),
          //               ),
          //             ),
          //             child: const CircularProgressIndicator(),
          //           ),
          //         ],
          //       ),
          //     ),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //   ],
          // ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: PageView.builder(
              itemCount: widget.postImages.length,
              onPageChanged: (element){
                _controllers.pause();
              },
              itemBuilder: (context, index) {
                currentIndex = index;
                return widget.postImages[index].mediaType == "IMAGE"
                    ? CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl:
                  widget.postImages[index].postMedia ?? '',
                  placeholder: (context, url) {
                    return const Center(
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          strokeWidth: 1,
                        ),
                      ),
                    );
                  },
                  imageBuilder: (context, imageProvider) {
                    return PhotoView(
                      imageProvider: imageProvider,
                    );
                  },
                  errorWidget: (context, url, error) =>
                  const Image(
                    image: AssetImage(
                      AppImages.noImage,
                    ),
                  ),
                )
                    : Padding(
                      padding: EdgeInsets.symmetric(vertical: 50.h),
                      child: Center(child:
                      FlickVideoPlayer(
                          flickManager: FlickManager(
                            videoPlayerController: _controllers = VideoPlayerController.network(
                                widget.postImages[index].postMedia ??
                                    ''),
                          ))
                      )
                    );
              },
            ),
          ),
          Positioned(
            top: 50.h,
            right: 20.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 22.w,
              ),
            ),
          ),
          Positioned(
            bottom: 10.h,
            left: 15.w,
            right: 15.w,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 300.h,
                  child: SingleChildScrollView(
                    child: ReadMoreText(
                      widget.text,
                      style: CustomTextStyles.text12RegularW400.copyWith(color: Colors.white, wordSpacing: 1,),
                      trimMode: TrimMode.Line,
                      trimLines: 2,
                      colorClickableText: Colors.blue,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      moreStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      lessStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                Row(
                  children: [
                    Text(
                      "${widget.likes} Likes",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(15),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text("${widget.comments} Comments",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                          color: Colors.white,
                        )),
                    const Spacer(),
                    Visibility(
                      visible: isLoading,
                      replacement: GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          final url = Uri.parse(
                              widget.postImages[currentIndex].postMedia ?? "");
                          final response = await http.get(url);
                          final bytes = response.bodyBytes;
                          final temp = await getTemporaryDirectory();
                          final path = '${temp.path}/images.jpg';
                          File(path).writeAsBytesSync(bytes);
                          setState(() {
                            isLoading = false;
                          });
                          // await Share.shareFiles([path]);
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: 20.h,
                          child: Text("Share",
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(15),
                                color: Colors.white,
                              )),
                        ),
                      ),
                      child: const CircularProgressIndicator(),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}
