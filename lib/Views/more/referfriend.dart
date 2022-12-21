import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iobm/Widgets/custom_widgets.dart';
import 'package:iobm/Widgets/widget_styles.dart';
import 'package:iobm/helper_classes/ui_helper.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/response_models/refer_friend_response.dart';
import 'package:iobm/utils/app_color.dart';

import 'package:iobm/utils/app_constants.dart';

class ReferFriend extends StatefulWidget {
  final String email;
  const ReferFriend({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  _ReferFriendState createState() => _ReferFriendState();
}

class _ReferFriendState extends State<ReferFriend> {
  final TextEditingController _referController = TextEditingController();
  final GlobalKey<FormState> fkey = GlobalKey<FormState>();
  bool wait = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Refer a Friend',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(16),
          ),
        ),
        shape: Border(
          bottom: BorderSide(color: AppColor.secAppBar, width: 4.w),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: fkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      'Please enter the Email ID of your friend whom you want to refer',
                      style: WidgetStyle.primaryTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(16),
                      ),
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(fontSize: 13.sp),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Email Address';
                      }
                    },
                    controller: _referController,
                    decoration: WidgetStyle.emailTextFieldDecoration(),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomWidget.myButton(
                    isBorder: false,
                    name: AppConstants.submit,
                    onClicked: () async {
                      if (fkey.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                        referFriend();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          wait
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Future<void> referFriend() async {
    setState(() {
      wait = true;
    });
    var response = await ApiCalls.referFriend(
      userId: AppConstants.myId,
      email: widget.email,
      referEmail: _referController.text,
      status: 'pending',
    );
    setState(() {
      wait = false;
    });
    if (response is ErrorEntity) {
    } else {
      ReferEntity referEntity = ReferEntity.fromJson(jsonEncode(response));
      if (referEntity.success == 1) {
        showDialog(
          context: context,
          builder: (builder) => Dialog(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alert',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(16),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    referEntity.message ?? '',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                    width: 50,
                    child: TextButton(
                        onPressed: () {
                          Get.back();
                        },
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
        ).then((value) => Get.back());
        // UIHelper.showSuccessAlert(
        //   context,
        //   referEntity.message,
        //   () {
        //     Get.back();
        //   },
        // );
      }
    }
  }
}
