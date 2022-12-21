import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
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
    return Center(
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
          : VideoPlayerRemote(url: widget.image, height: 300),
    );
  }
}
