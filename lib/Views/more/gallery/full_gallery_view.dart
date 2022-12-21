import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:photo_view/photo_view.dart';

class FullImageView extends StatefulWidget {
  final List<DBGalleryImage> images;
  final int imageIndex;
  const FullImageView(
      {Key? key, required this.imageIndex, required this.images})
      : super(key: key);

  @override
  State<FullImageView> createState() => _FullImageViewState();
}

class _FullImageViewState extends State<FullImageView> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: widget.imageIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      itemCount: widget.images.length,
      itemBuilder: (context, index) {
        return Center(
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: widget.images[index].image ?? '',
            placeholder: (context, url) {
              return const Center(
                child: SizedBox(
                  width: 36,
                  height: 36,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
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
          ),
        );
      },
    );
  }
}
