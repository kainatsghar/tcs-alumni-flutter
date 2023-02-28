import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:iobm/Views/news_feeds/stories/upload_story.dart';

import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/strings.dart';

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
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: ScreenUtil().setSp(18),
          ),
          centerTitle: true,
          title: const Text(Strings.createStory),
          actions: const [
            Icon(Icons.check),
          ],
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
              _showCameraPicker();
              //_imgFromCamera();
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 250.h,
                  width: 160.w,
                  color: AppColor.black,
                ),
                const Icon(
                  Icons.camera_alt,
                  color: AppColor.white,
                ),
                const Positioned(
                  bottom: 5,
                  left: 5,
                  child: Text(
                    Strings.camera,
                    style: TextStyle(color: AppColor.white),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              _showGalleryPicker();
              //_imgFromGallery();
            },
            child: Stack(
              children: [
                Container(
                  height: 250.h,
                  width: 160.w,
                  color: AppColor.grey,
                  child: Image.asset(AppImages.gallerypng),
                ),
                const Positioned(
                  bottom: 5,
                  left: 5,
                  child: Text(
                    Strings.viewGallery,
                    style: TextStyle(color: AppColor.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showGalleryPicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.video_camera_back),
                    title: const Text('Video'),
                    onTap: () {
                      _videoFromGallery();
                      Navigator.of(context).pop(); //dismiss the dialog
                    }),
                ListTile(
                  leading: const Icon(Icons.photo),
                  title: const Text('Image'),
                  onTap: () {
                    _imgFromGallery();
                    Navigator.of(context).pop(); //dismiss the dialog
                  },
                ),
              ],
            ),
          );
        });
  }

  void _showCameraPicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.video_camera_back),
                    title: const Text('Video'),
                    onTap: () {
                      _videoFromCamera();
                      Navigator.of(context).pop(); //dismiss the dialog
                    }),
                ListTile(
                  leading: const Icon(Icons.photo),
                  title: const Text('Image'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop(); //dismiss the dialog
                  },
                ),
              ],
            ),
          );
        });
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

  _videoFromGallery() async {
    XFile? file = await picker.pickVideo(
      source: ImageSource.gallery,
      maxDuration: const Duration(seconds: 10),
    );
    if (file != null) {
      // _controller = VideoPlayerController.network(file.path)..initialize();
      setState(() {
        image = File(file.path);
      });
      Get.to(() => UploadStory(file: image));
    }
  }

  _videoFromCamera() async {
    XFile? file = await picker.pickVideo(
      source: ImageSource.camera,
      maxDuration: const Duration(seconds: 10),
    );
    if (file != null) {
      // _controller = VideoPlayerController.network(file.path)..initialize();
      setState(() {
        image = File(file.path);
      });
      Get.to(() => UploadStory(file: image));
    }
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
