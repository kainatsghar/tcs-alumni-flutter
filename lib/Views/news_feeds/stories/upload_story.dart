import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:iobm/Views/buy_and_sell_tle/video_player_page.dart';
import 'package:iobm/Widgets/custom_widgets.dart';
import 'package:iobm/helper_classes/ui_helper.dart';

import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/api_params.dart';
import 'package:iobm/networkcalls/response_models/add_story_entity.dart';
import 'package:iobm/utils/app_color.dart';

import '../../../Widgets/widget_styles.dart';
import '../../bottom_navigationbar.dart';

class UploadStory extends StatefulWidget {
  final File file;
  const UploadStory({Key? key, required this.file}) : super(key: key);

  @override
  _UploadStoryState createState() => _UploadStoryState();
}

class _UploadStoryState extends State<UploadStory> {

  TextEditingController _linkController = TextEditingController();

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
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  // const SizedBox(
                  //   height: 22,
                  // ),
                  if (widget.file.path.endsWith('mp4'))
                    VideoPlayerPage(url: widget.file.path)
                  else
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
            ),
          ),
          Positioned(
              bottom: 40.h,
              // left: 20.w,
              child: CustomWidget.myButton(
                  name: 'Add Link',
                  size: const Size(50, 30),
                  isBorder: true,
                  onClicked: () {
                    _popAddLink();
                  })),
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
    Map map={
      Params.LINK: _linkController.text,
    };
    var response = await ApiCalls.addTimelineStory(imagePath: widget.file.path,map: map);
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

  _popAddLink() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Dialog(
              insetAnimationCurve: Curves.bounceIn,
              alignment: Alignment.center,
              backgroundColor: AppColor.white,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Add Link',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(height: 15.h,),
                    TextFormField(
                      controller: _linkController,
                      decoration: WidgetStyle.nameTextFieldDecoration(hint: "Paste Link Here"),
                    ),
                    SizedBox(height: 15.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomWidget.dialogButton(
                            isBorderColor: false,
                            onClicked: () {
                              _getClipboardText();
                            },
                            name: 'Paste'),
                        SizedBox(width: 10.w,),
                        CustomWidget.dialogButton(
                            isBorderColor: true,
                            onClicked: () {
                              _linkController.clear();
                              Get.back();
                            },
                            name: 'Cancel'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
  void _getClipboardText() async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    String? clipboardText = clipboardData?.text;
    print(clipboardText);
    _linkController.text = clipboardText ?? '';
    Get.back();
  }

}
