import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iobm/Views/login_screen.dart';
import 'package:iobm/Widgets/custom_widgets.dart';
import 'package:iobm/Widgets/widget_styles.dart';
import 'package:iobm/helper_classes/ui_helper.dart';

import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/response_models/forget_password_entity.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatefulWidget {
  final String phone;
  const ForgetPasswordScreen({Key? key, required this.phone}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  GlobalKey<FormState> fKey = GlobalKey<FormState>();

  bool showPass = true;
  void toggle() {
    setState(
      () {
        showPass = !showPass;
      },
    );
  }

  bool showPass2 = true;
  void toggle2() {
    setState(
      () {
        showPass2 = !showPass2;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.transparent,
        iconTheme: const IconThemeData(
          color: AppColor.black,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: _bodyColumn(),
      ),
    );
  }

  Widget _bodyColumn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: fKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: Image(
                image: const AssetImage(
                  AppImages.alumniLogo,
                ),
                height: 120.w,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Create New Password',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(18),
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Your new password must be different previous used password',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                  color: AppColor.black,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _passwordTextField(),
            const SizedBox(
              height: 20,
            ),
            _confirmPasswordTextField(),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: CustomWidget.myButton(
                  isBorder: false,
                  name: AppConstants.update,
                  size: Size(110.w, 30.h),
                  onClicked: () {
                    if (fKey.currentState!.validate()) {
                      changePassword();
                    } else {}
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  // Widget _bodyColumn() {
  //   return CustomScrollView(
  //     slivers: [
  //       SliverFillRemaining(
  //         hasScrollBody: false,
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 20),
  //           child: Form(
  //             key: fKey,
  //             child: Column(
  //               children: [
  //                 Center(
  //                   child: Image(
  //                     image: const AssetImage(
  //                       AppImages.alumniLogo,
  //                     ),
  //                     height: 120.w,
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   height: 50,
  //                 ),
  //                 Align(
  //                   alignment: Alignment.topLeft,
  //                   child: Text(
  //                     'Create New Password',
  //                     style: TextStyle(
  //                       fontSize: ScreenUtil().setSp(18),
  //                       color: AppColor.black,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   height: 10,
  //                 ),
  //                 Align(
  //                   alignment: Alignment.topLeft,
  //                   child: Text(
  //                     'Your new password must be different previous used password',
  //                     style: TextStyle(
  //                       fontSize: ScreenUtil().setSp(14),
  //                       color: AppColor.black,
  //                     ),
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   height: 20,
  //                 ),
  //                 _passwordTextField(),
  //                 const SizedBox(
  //                   height: 20,
  //                 ),
  //                 _confirmPasswordTextField(),
  //                 const SizedBox(
  //                   height: 20,
  //                 ),
  //                 Center(
  //                   child: CustomWidget.myButton(
  //                       isBorder: false,
  //                       name: "Update",
  //                       size: Size(120.w, 35.h),
  //                       onClicked: () {
  //                         if (fKey.currentState!.validate()) {
  //                           changePassword();
  //                         } else {}
  //                       }),
  //                 ),
  //                 Expanded(child: Container()),
  //               ],
  //             ),
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // return SingleChildScrollView(
  //   physics: const ClampingScrollPhysics(
  //       //  parent: NeverScrollableScrollPhysics(),
  //       ),
  //   child: ConstrainedBox(
  //     constraints: BoxConstraints(minHeight: constraint.maxHeight),
  //     child: IntrinsicHeight(
  //       child: Form(
  //         key: fKey,
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 20),
  //           child: Column(
  //             children: [
  //               Center(
  //                 child: Image(
  //                   image: const AssetImage(
  //                     AppImages.alumniLogo,
  //                   ),
  //                   height: 120.w,
  //                 ),
  //               ),
  //               const SizedBox(
  //                 height: 50,
  //               ),
  //               Align(
  //                 alignment: Alignment.topLeft,
  //                 child: Text(
  //                   'Create New Password',
  //                   style: TextStyle(
  //                     fontSize: ScreenUtil().setSp(18),
  //                     color: AppColor.black,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //               ),
  //               const SizedBox(
  //                 height: 10,
  //               ),
  //               Align(
  //                 alignment: Alignment.topLeft,
  //                 child: Text(
  //                   'Your new password must be different previous used password',
  //                   style: TextStyle(
  //                     fontSize: ScreenUtil().setSp(14),
  //                     color: AppColor.black,
  //                   ),
  //                 ),
  //               ),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               _passwordTextField(),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               _confirmPasswordTextField(),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               Center(
  //                 child: CustomWidget.myButton(
  //                     isBorder: false,
  //                     name: "Update",
  //                     size: Size(120.w, 35.h),
  //                     onClicked: () {
  //                       if (fKey.currentState!.validate()) {
  //                         changePassword();
  //                       } else {}
  //                     }),
  //               ),
  //               const Spacer(),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   ),
  // );
  // }

  Widget _passwordTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetStyle.signUpName(title: 'Password*'),
        Stack(
          children: [
            TextFormField(
              validator: (value) {
                return value!.isEmpty ? 'Password is required' : null;
              },
              style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
              ),
              controller: _passwordController,
              obscureText: showPass,
              obscuringCharacter: '*',
              decoration: WidgetStyle.passwordDecoration(),
            ),
            Positioned(
              right: 10,
              top: 5,
              child: GestureDetector(
                onTap: toggle,
                child: Icon(
                  Icons.remove_red_eye,
                  color: showPass ? AppColor.black26 : AppColor.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _confirmPasswordTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetStyle.signUpName(title: 'Confirm Password*'),
        Stack(
          children: [
            TextFormField(
              validator: (value) {
                return value!.isEmpty
                    ? 'Please confirm password'
                    : value != _passwordController.text
                        ? "Password does not match"
                        : null;
              },
              style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
              ),
              controller: _confirmPasswordController,
              obscureText: showPass2,
              obscuringCharacter: '*',
              decoration: WidgetStyle.passwordDecoration(),
            ),
            Positioned(
              right: 10,
              top: 5,
              child: GestureDetector(
                onTap: toggle2,
                child: Icon(
                  Icons.remove_red_eye,
                  color: showPass2 ? AppColor.black26 : AppColor.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> changePassword() async {
    UIHelper.apiCallingAlert(context);
    var response = await ApiCalls.forgetPassword(
        phone: widget.phone, password: _passwordController.text);
    UIHelper.hideApiCallingAlert(context);
    if (response is ErrorEntity) {
      print(response.message);
    } else {
      ForgetPasswordEntity passwordEntity =
          ForgetPasswordEntity.fromJson(jsonEncode(response));
      if (passwordEntity.success == 1) {
        UIHelper.showSuccessAlert(context, passwordEntity.message, () {
          Get.offUntil(
              GetPageRoute(page: () => const LoginScreen()), (route) => false);
        });
      }
    }
  }
}
