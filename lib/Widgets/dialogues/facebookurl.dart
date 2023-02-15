import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../local_db/local_db.dart';
import '../../models/error_entity.dart';
import '../../networkcalls/api_calls.dart';
import '../../networkcalls/response_models/edit_linkedin_entity.dart';
import '../../utils/app_color.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_utils.dart';
import '../../utils/text_styles.dart';

class FacebookUrl extends StatefulWidget {
  final String? facebookUrl;
  const FacebookUrl({Key? key, this.facebookUrl}) : super(key: key);

  @override
  _FacebookUrlState createState() => _FacebookUrlState();
}

class _FacebookUrlState extends State<FacebookUrl> {
  final TextEditingController _urlController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _urlController.text = widget.facebookUrl ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 16,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.close,
                  )),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              "Paste Your Facebook Profile URL",
              style: CustomTextStyles.text14SemiBoldW600.copyWith(color: AppColor.black,),
            ),
            SizedBox(
              height: 15.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Member will be able to view profile by clicking that button",
                style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.black54,),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              height: 40.h,
              decoration: BoxDecoration(
                  border: Border.all(width: .7, color: AppColor.grey),
                  borderRadius: BorderRadius.circular(40)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextField(
                    style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.black54),
                    controller: _urlController,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: "www.facebook.com"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 28.h,
                  child: OutlinedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(horizontal: 20.0)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          side: const BorderSide(
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (_urlController.text != "") {
                        AppUtils().launchSocial('fb://profile/104342767870346',
                            '${widget.facebookUrl}');
                      }
                    },
                    child: Text(
                      'View',
                      style: CustomTextStyles.text12RegularW400,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 28.h,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(horizontal: 20.0)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          side: const BorderSide(
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      await addFacebookUrl();
                    },
                    child: Text(
                      'Save',
                      style: CustomTextStyles.text12RegularW400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addFacebookUrl() async {
    print("Called");
    String url = '';
    // String fbUrl = '';

    if (_urlController.text.startsWith('http')) {
      url = _urlController.text;
    } else {
      url = "https://" + _urlController.text;
    }
    var response = await ApiCalls.editFacebookUrl(
      fbUrl: _urlController.text == "" ? "" : url,
      userId: AppConstants.myId,
    );
    if (response is ErrorEntity) {
      print(response.message);
    } else {
      EditLinkedInEntity linkedInEntity =
          EditLinkedInEntity.fromJson(jsonEncode(response));
      print(linkedInEntity.success);
      if (linkedInEntity.success == 1) {
        database.editFacebookUrl(
          AppConstants.myId,
          url,
        );
        Get.back();
      }
    }
  }
}
