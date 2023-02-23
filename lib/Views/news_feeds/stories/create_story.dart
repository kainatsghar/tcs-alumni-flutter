import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:iobm/Views/news_feeds/stories/upload_story.dart';
import 'package:iobm/Widgets/sec_appbar.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/strings.dart';

import '../../../utils/text_styles.dart';

class CreateStory extends StatefulWidget {
  const CreateStory({Key? key}) : super(key: key);

  @override
  _CreateStoryState createState() => _CreateStoryState();
}

class _CreateStoryState extends State<CreateStory> {
  late File image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(()=> const UploadStory());
      },
      child: Scaffold(
        appBar: AppBar(
          titleTextStyle: CustomTextStyles.text16SemiBoldW600,
          centerTitle: true,
          title: const Text(Strings.createStory),
          // actions: const [
          //   Icon(Icons.check),
          // ],
        ),
        body: _bodyContainer(),
      ),
    );
  }

  Widget _bodyContainer() {
    return Padding(
      padding: const EdgeInsets.all(8.0).copyWith(top: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              _imgFromCamera();
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 250.h,
                  width: 160.w,
                  color: AppColor.black,
                ),
                const Icon(Icons.camera_alt, color: AppColor.white),
                 Positioned(
                    bottom: 5,
                    left: 5,
                    child: Text(
                      Strings.camera,
                      style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.white),
                    )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              _imgFromGallery();
            },
            child: Stack(
              children: [
                Container(
                  height: 250.h,
                  width: 160.w,
                  color: AppColor.grey,
                  child: Image.asset(AppImages.gallerypng),
                ),
                 Positioned(
                    bottom: 5,
                    left: 5,
                    child: Text(
                      Strings.viewGallery,
                      style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.white),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _imgFromGallery() async {
    PickedFile? pickedFile = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
      Get.to(() => UploadStory(file: image));
    } else {}
  }

  _imgFromCamera() async {
    PickedFile? pickedFile = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
      Get.to(() => UploadStory(file: image));
    } else {}
  }
}
