import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:iobm/Views/news_feeds/video_player_view.dart';

import 'package:iobm/utils/app_images.dart';
import 'package:photo_view/photo_view.dart';

class FullViewImage extends StatefulWidget {
  final String image;

  const FullViewImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  State<FullViewImage> createState() => _FullViewImageState();
}

class _FullViewImageState extends State<FullViewImage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
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
            heroAttributes: const PhotoViewHeroAttributes(tag: 'fullImage'),
            imageProvider: imageProvider,
          );
        },
        errorWidget: (context, url, error) => const Image(
          image: AssetImage(
            AppImages.noImage,
          ),
        ),
      ),
    );
  }
}
