import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/response_models/edit_linkedin_entity.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_utils.dart';

class LinkedInDialog extends StatefulWidget {
  final String? linkedInUrl;
  const LinkedInDialog({Key? key, this.linkedInUrl}) : super(key: key);

  @override
  _LinkedInDialogState createState() => _LinkedInDialogState();
}

class _LinkedInDialogState extends State<LinkedInDialog> {
  final TextEditingController _urlController = TextEditingController();

  @override
  void initState() {
    _urlController.text = widget.linkedInUrl ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 16,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              "Paste Your LinkedIn Profile URL",
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColor.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Member will be able to view profile by clicking that button",
                style: TextStyle(
                  // fontFamily: 'Nunito',
                  fontSize: 12.sp,
                  color: AppColor.black54,
                ),
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
                    style: TextStyle(fontSize: 13.sp,color: AppColor.black54),
                    controller: _urlController,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: "www.LinkedIn.com"),
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
                            '${widget.linkedInUrl}');
                      }
                    },
                    child: Text(
                      'View',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
                      ),
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
                      await addLinkedInUrl();
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addLinkedInUrl() async {
    String url = '';
    if (_urlController.text.startsWith('http')) {
      url = _urlController.text;
    }
    else {
      url = "https://" + _urlController.text;
    }
    var response = await ApiCalls.editLinkedInUrl(
      url: _urlController.text == "" ? "" : url,
      userId: AppConstants.myId,
    );
    if (response is ErrorEntity) {
      print(response.message);
    } else {
      EditLinkedInEntity linkedInEntity =
          EditLinkedInEntity.fromJson(jsonEncode(response));
      if (linkedInEntity.success == 1) {
        database.editLinkedinUrl(
          AppConstants.myId,
          url,
        );
        Get.back();
      }
    }
  }

}
