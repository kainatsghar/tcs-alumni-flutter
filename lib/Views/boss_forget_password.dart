import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iobm/Widgets/custom_widgets.dart';

import 'package:iobm/Widgets/widget_styles.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/response_models/boss_forget_entity.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:get/get.dart';

import 'login_screen.dart';

class BossForgetPassScreen extends StatefulWidget {
  const BossForgetPassScreen({Key? key}) : super(key: key);

  @override
  _BossForgetPassScreenState createState() => _BossForgetPassScreenState();
}

class _BossForgetPassScreenState extends State<BossForgetPassScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _fKey = GlobalKey<FormState>();
  bool wait = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0,
        title: const Text('Forgot Password'),
        shape: Border(
          bottom: BorderSide(color: AppColor.secAppBar, width: 3.w),
        ),
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: ScreenUtil().setSp(18),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: _fKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(16),
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      return value!.isEmpty
                          ? 'Email is required'
                          : validateEmail(value) == 1
                              ? 'Invalid email'
                              : null;
                    },
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(16),
                    ),
                    controller: _emailController,
                    decoration: WidgetStyle.emailTextFieldDecoration(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      'A new password will be sent to your registered email address.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomWidget.myButton(
                    isBorder: false,
                    name: AppConstants.submit,
                    onClicked: () async {
                      if (_fKey.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                        submitForget();
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
    ));
  }

  Future<void> submitForget() async {
    setState(() {
      wait = true;
    });
    var response = await ApiCalls.bossForget(
      email: _emailController.text,
    );
    setState(() {
      wait = false;
    });
    if (response is ErrorEntity) {
    } else {
      BossForgetEntity bossForgetEntity =
          BossForgetEntity.fromJson(jsonEncode(response));
      if (bossForgetEntity.success == 1) {
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
                    bossForgetEntity.message ?? '',
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
      }
    }
  }
}
