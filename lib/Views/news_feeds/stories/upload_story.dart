import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:iobm/helper_classes/ui_helper.dart';

import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/response_models/add_story_entity.dart';
import 'package:iobm/utils/app_color.dart';

import '../../bottom_navigationbar.dart';

class UploadStory extends StatefulWidget {
  final File file;
  const UploadStory({Key? key, required this.file}) : super(key: key);

  @override
  _UploadStoryState createState() => _UploadStoryState();
}

class _UploadStoryState extends State<UploadStory> {
  @override
  void initState() {
    print(widget.file.path);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: AppColor.black),
        elevation: 0,
        backgroundColor: AppColor.transparent,
      ),
      body: Column(
        children: [
          // const SizedBox(
          //   height: 22,
          // ),
          Image.file(
            widget.file,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          // const Spacer(),
          // CustomWidget.myButton(
          //     isBorder: false,
          //     name: Strings.upload,
          //     onClicked: () {
          //       print('upload image');
          //       Get.to(() => const ViewStory());
          //     }),
          // SizedBox(height: 10.h),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addStory();
        },
        child: const Icon(Icons.send_rounded),
      ),
    );
  }

  Future<void> addStory() async {
    UIHelper.apiCallingAlert(context);
    var response = await ApiCalls.addTimelineStory(imagePath: widget.file.path);
    UIHelper.hideApiCallingAlert(context);
    if (response is ErrorEntity) {
      print(response.message);
    } else {
      AddStoryEntity storyEntity =
          AddStoryEntity.fromJson(jsonEncode(response));
      if (storyEntity.success == 1) {
        Get.offUntil(GetPageRoute(page: () => const BottomNavigationScreen()),
            (route) => false);
      }
    }
  }
}
