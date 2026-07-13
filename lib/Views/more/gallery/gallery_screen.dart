import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/more/gallery/show_images_screen.dart';

import 'package:iobm/Widgets/sec_appbar.dart';
import 'package:iobm/Widgets/widget_styles.dart';
import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/data_fetched.dart';
import 'package:iobm/networkcalls/api_helper.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/app_utils.dart';
import 'package:iobm/utils/strings.dart';

import '../../../utils/text_styles.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  late Future _fetchData;

  late List<DBGallerie> _galleries;
  bool dataFetched = false;

  @override
  void initState() {
    _galleries = [];
    setDataFromDB();
    _fetchData = getGalleryList();
    super.initState();
  }

  @override
  Widget build(BuildContext buildContext) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        appBar: SecAppBar(
          title: const Text(Strings.gallery),
          context: context,
        ),
        body: dataFetched
            ? FutureBuilder(
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
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _bodyContainer() {
    return Container(
      color: AppColor.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
            child: _galleries.isNotEmpty ? ListView.builder(
                itemCount: _galleries.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final reverseIndex = _galleries.length - 1 - index;
                  return Column(
                    children: [
                      _event(
                          img: '${_galleries[reverseIndex].image}',
                          title: '${_galleries[reverseIndex].title}',
                          date: AppUtils().convertDateTimeDisplay(
                              _galleries[reverseIndex].createdDAte ?? ''),
                          onTap: () {
                            Get.to(
                              () => ShowImagesScreen(
                                galleryId: _galleries[reverseIndex].id,
                                galleryTitle: _galleries[reverseIndex].title,
                              ),
                            );
                          }),
                      Divider(
                        thickness: 2.w,
                      ),
                    ],
                  );
                }) : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.galleryImg,height: 250.h,width: 250.w,),
                    SizedBox(height: 20.h,),
                    Text('No Galleries Available!',style: CustomTextStyles.text14SemiBoldW600.copyWith(color: AppColor.grey)),
                  ],
                ),
          )
        ],
      ),
    );
  }

  _event({
    img,
    title,
    date,
    onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppColor.white,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 12.w,
            ),
            SizedBox(
              height: 60.h,
              width: 60.w,
              // decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              child: ClipOval(
                // backgroundImage: AssetImage(AppImages.noImage),
                child: img == ''
                    ? Image(
                        image: const AssetImage(AppImages.gallerypng),
                        width: 60.w,
                        height: 60.h,
                        fit: BoxFit.cover,
                      )
                    : CachedNetworkImage(
                        imageUrl: img,
                        imageBuilder: (context, imageProvider) => Container(
                          height: 60.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => const Image(
                          image: AssetImage(
                            AppImages.noImage,
                          ),
                        ),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                            strokeWidth: 2.0,
                          ),
                        ),
                      ),
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: CustomTextStyles.text14SemiBoldW600.copyWith(color: AppColor.black,),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    date,
                    style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.greyshade600,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> setDataFromDB() async {
    _galleries = await database.getGalleries();
    setState(() {
      dataFetched = true;
    });
  }

  Future<void> getGalleryList() async {
    setDataFromDB();
    DataFetched dataFetched = await ApiHelper.getGallery();
    if (dataFetched.done) {
      setDataFromDB();
    }
  }
}
