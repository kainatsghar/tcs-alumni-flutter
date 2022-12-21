import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/news_feeds/video_player_view.dart';
import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/app_utils.dart';
import 'package:photo_view/photo_view.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SizedBox(
                height: 200.h,
                child: PageView.builder(
                  itemCount: widget.postImages.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: widget.postImages[index].mediaType == "IMAGE"
                          ? CachedNetworkImage(
                              fit: BoxFit.cover,
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
                              errorWidget: (context, url, error) => const Image(
                                image: AssetImage(
                                  AppImages.noImage,
                                ),
                              ),
                            )
                          : VideoPlayerRemote(
                              height: 200,
                              url: widget.postImages[index].postMedia ?? '',
                            ),
                    );
                  },
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: HtmlWidget(
                  AppUtils().htmlString(widget.text),
                  textStyle: TextStyle(
                    fontSize: ScreenUtil().setSp(13),
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
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
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          Positioned(
            top: 50,
            right: 20,
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
        ],
      ),
    );
  }
}
