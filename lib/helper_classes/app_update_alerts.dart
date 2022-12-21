import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iobm/Views/bottom_navigationbar.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

class OptionalUpdateAlertScreen extends StatefulWidget {
  final String msg;
  OptionalUpdateAlertScreen(this.msg);

  @override
  _OptionalUpdateAlertScreenState createState() =>
      _OptionalUpdateAlertScreenState();
}

class _OptionalUpdateAlertScreenState extends State<OptionalUpdateAlertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.transparent,
      body: GestureDetector(
        onTap: () {},
        child: Center(
          child: Material(
            color: AppColor.transparent,
            child: Center(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Update Available",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(18),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.msg,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(16),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {
                                  if (Platform.isAndroid) {
                                    launch(AppConstants.androidUrl);
                                  } else if (Platform.isIOS) {
                                    launch(AppConstants.iosUrl);
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    "Update",
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.offUntil(
                                      GetPageRoute(
                                          page: () =>
                                              const BottomNavigationScreen()),
                                      (route) => false);
                                },
                                child: Center(
                                  child: Text(
                                    "Continue",
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}

class ForceUpdateScreen extends StatefulWidget {
  const ForceUpdateScreen({Key? key}) : super(key: key);

  @override
  _ForceUpdateScreenState createState() => _ForceUpdateScreenState();
}

class _ForceUpdateScreenState extends State<ForceUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.transparent,
      body: GestureDetector(
        onTap: () {},
        child: Center(
          child: Material(
            color: AppColor.transparent,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Update Available",
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(18),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Please update your app to the latest version",
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(16),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    if (Platform.isAndroid) {
                                      launch(AppConstants.androidUrl);
                                    } else if (Platform.isIOS) {
                                      launch(AppConstants.iosUrl);
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      "Update",
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(14),
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
