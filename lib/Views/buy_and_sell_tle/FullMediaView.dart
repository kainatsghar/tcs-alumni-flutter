import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/buy_and_sell_tle/video_player_page.dart';

import 'package:iobm/local_db/local_db.dart';
import 'package:photo_view/photo_view.dart';

import '../../utils/app_images.dart';

class FullMediaView extends StatefulWidget {
  final int imageIndex;
  final List<DBProductImage> productImages;
  const FullMediaView(
      {Key? key, required this.productImages, required this.imageIndex})
      : super(key: key);
  @override
  _FullMediaViewState createState() => _FullMediaViewState();
}

class _FullMediaViewState extends State<FullMediaView> {
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: widget.imageIndex);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 10,
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: widget.productImages.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: widget.productImages[index].type == "jpg" ||
                                widget.productImages[index].type == "jpeg" ||
                                widget.productImages[index].type == "png"
                            ? CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl:
                                    widget.productImages[index].productMedia ??
                                        '',
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
                            : VideoPlayerPage(
                                url: widget.productImages[index].productMedia ??
                                    '',
                              ),
                      );
                    },
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
      ),
    );
  }
}
