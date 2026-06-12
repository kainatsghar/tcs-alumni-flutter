import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iobm/utils/app_color.dart';

class SuccessAlert extends StatefulWidget {
  final String errorMsg;
  final VoidCallback? action;
  SuccessAlert(this.errorMsg, this.action);

  @override
  _SuccessAlertState createState() => _SuccessAlertState();
}

class _SuccessAlertState extends State<SuccessAlert>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Material(
            color: AppColor.transparent,
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
                          "Success",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.errorMsg,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(16),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 40,
                          width: 50,
                          child: TextButton(
                              onPressed: widget.action,
                              child: Center(
                                child: Text(
                                  "OK",
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(14),
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
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
    );
  }
}

class SuccessAlertWithAction extends StatefulWidget {
  final String errorMsg;
  final Function action;
  SuccessAlertWithAction(this.errorMsg, this.action);
  @override
  _SuccessAlertWithActionState createState() => _SuccessAlertWithActionState();
}

class _SuccessAlertWithActionState extends State<SuccessAlertWithAction> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
      backgroundColor: AppColor.transparent,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          widget.action();
        },
        child: Center(
          child: Material(
            color: AppColor.transparent,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 300,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Expanded(
                            child: Container(
                                width: 320.0.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColor.white),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),

                                    const SizedBox(
                                      height: 15,
                                    ),

                                    Text(
                                      widget.errorMsg,
                                      style: const TextStyle(
                                          color: AppColor.black54,
                                          fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                    Expanded(child: Container()),
                                    // ignore: deprecated_member_use
                                    ElevatedButton(
                                      // padding: EdgeInsets.all(0),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        widget.action();
                                      },
                                      child: Container(
                                        width: 320.0.w,
                                        height: 50,
                                        color: AppColor.primaryColor,
                                        child: const Center(
                                            child: Text(
                                          "OK",
                                          style: TextStyle(
                                            color: AppColor.white,
                                            fontSize: 14,
                                          ),
                                        )),
                                      ),
                                    )
                                  ],
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      ));
  }
}
