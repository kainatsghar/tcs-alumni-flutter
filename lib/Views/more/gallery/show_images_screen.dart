import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/more/gallery/full_gallery_view.dart';
import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/data_fetched.dart';
import 'package:iobm/networkcalls/api_helper.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/strings.dart';

import '../../../utils/text_styles.dart';

class ShowImagesScreen extends StatefulWidget {
  final String? galleryId;
  final String? galleryTitle;
  const ShowImagesScreen({this.galleryId, this.galleryTitle});

  @override
  _ShowImagesScreenState createState() => _ShowImagesScreenState();
}

class _ShowImagesScreenState extends State<ShowImagesScreen> {
  late Future _fetchData;
  late List<DBGalleryImage> _galleryImages;

  @override
  void initState() {
    // TODO: implement initState
    _galleryImages = [];
    _fetchData = getImages();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          Strings.gallery,
          style: CustomTextStyles.text16SemiBoldW600,
        ),
      ),
      body: FutureBuilder(
        future: _fetchData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return _bodyContainer();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _bodyContainer() {
    return Column(
      children: [
        _titleBar(),
        Expanded(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
              ),
              itemCount: _galleryImages.length,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(
                        () => FullImageView(
                          imageIndex:
                              _galleryImages.indexOf(_galleryImages[index]),
                          images: _galleryImages,
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      // decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                      child: Container(
                        child: _galleryImages[index].image == ''
                            ? const Image(
                                image: AssetImage(AppImages.gallerypng),
                                width: 50,
                                height: 50,
                              )
                            : CachedNetworkImage(
                                imageUrl: _galleryImages[index].image ?? '',
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Image(
                                  image: AssetImage(
                                    AppImages.noImage,
                                  ),
                                ),
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
                                  child: CircularProgressIndicator(
                                      value: downloadProgress.progress),
                                ),
                              ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget _titleBar() {
    return Card(
      elevation: 2,
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Text(
          widget.galleryTitle ?? "",
          style: CustomTextStyles.text14SemiBoldW600.copyWith(color: const Color(0xff1E398D)),
        ),
      )),
    );
  }

  Future<void> setDataFromDB() async {
    _galleryImages = await database.getGalleryImages(widget.galleryId ?? '1');
  }

  Future<void> getImages() async {
    setDataFromDB();
    DataFetched dataFetched =
        await ApiHelper.getGalleryImages(widget.galleryId);
    if (dataFetched.done) {
      setDataFromDB();
    }
  }
}
