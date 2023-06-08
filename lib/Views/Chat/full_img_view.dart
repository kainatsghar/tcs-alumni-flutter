import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/news_feeds/video_player_view.dart';

import 'package:iobm/utils/app_images.dart';
import 'package:photo_view/photo_view.dart';

class FullFileView extends StatefulWidget {
  final String image;
  final String type;

  const FullFileView({Key? key, required this.image, required this.type})
      : super(key: key);

  @override
  State<FullFileView> createState() => _FullFileViewState();
}

class _FullFileViewState extends State<FullFileView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 20.w,top: 20.h),
              child: GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back, color: Colors.white,size: 25.r,)),
            ),
          ],
        ),
        Spacer(),
        Container(
          height: 500,
          width: 500,
          child: Center(
            child: widget.type == 'image'
                ? CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: widget.image,
              placeholder: (context, url) {
                return const Center(
                  child: SizedBox(
                    width: 36,
                    height: 36,
                    child: CircularProgressIndicator(),
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
                : widget.type == 'jobImage' ? CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: widget.image,
              placeholder: (context, url) {
                return const Center(
                  child: SizedBox(
                    width: 36,
                    height: 36,
                    child: CircularProgressIndicator(),
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
            ) : VideoPlayerRemote(url: widget.image, height: 300),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
