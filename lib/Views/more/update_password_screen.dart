import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/more/porile_options.dart';
import 'package:iobm/Widgets/app_bar.dart';
import 'package:iobm/Widgets/custom_widgets.dart';
import 'package:iobm/Widgets/sec_appbar.dart';
import 'package:iobm/Widgets/widget_styles.dart';
import 'package:iobm/helper_classes/ui_helper.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/response_models/change_password_entity.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/text_styles.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({Key? key}) : super(key: key);

  @override
  _UpdatePasswordState createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  bool _show1 = true;
  bool _show2 = true;
  bool _show3 = true;

  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  GlobalKey<FormState> fKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: SecAppBar(
          title: const Text('Update Password'),
          context: context,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Form(
              key: fKey,
              child: Column(
                children: [
                  oldPasswordTextField(),
                  SizedBox(
                    height: 20.h,
                  ),
                  newPasswordTextField(),
                  SizedBox(
                    height: 20.h,
                  ),
                  confirmPasswordTextField(),
                  SizedBox(
                    height: 20.h,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(100.w, 30.h)),
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
                      // minimumSize: MaterialStateProperty.all<Size>(
                      //   Size(20.w, 20.h),
                      // ),
                    ),
                    onPressed: () {
                      if (fKey.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                        if(_passwordController.text == _confirmPasswordController.text){
                          updatePassword();
                        }
                        else{
                          print("Passwords don't match. Please retry.");
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(3.r)), //this right here
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30),
                                    child: Container(
                                      height: 170.h,
                                      width: double.infinity,

                                      decoration: BoxDecoration(
                                        color: AppColor.white,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Failed",
                                            style: CustomTextStyles.text16SemiBoldW600,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "The 'New Password' and 'Confirm Password' doest not match",
                                            style: CustomTextStyles.text14SemiBoldW600,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: Text(
                                              "OK",
                                              style: CustomTextStyles.text14SemiBoldW600.copyWith(color: AppColor.primaryColor,),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }
                      }
                    },
                    child: Text(
                      'Update',
                      style: CustomTextStyles.text16SemiBoldW600,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget title({title}) {
    return Text(
      title,
      style: CustomTextStyles.text14SemiBoldW600,
    );
  }

  oldPasswordTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title(title: 'Old Password'),
        TextFormField(
          style: CustomTextStyles.text12RegularW400,
          // onEditingComplete: () => FocusScope.of(context).nextFocus(),
          textInputAction: TextInputAction.next,
          cursorHeight: 20,
          obscureText: _show1,
          controller: _oldPasswordController,
          validator: (value) {
            return value!.isEmpty ? 'Enter Old Password' : null;
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 15),
            isDense: true,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _show1 = !_show1;
                });
              },
              icon: Icon(_show1 ? Icons.visibility : Icons.visibility_off),
            ),
            hintText: 'Old Password',
            hintStyle: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.greyshade400),
          ),
          // decoration: WidgetStyle.nameTextFieldDecoration(hint: "Old Password"),
        )
      ],
    );
  }

  newPasswordTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title(title: 'New Password'),
        TextFormField(
          style: CustomTextStyles.text12RegularW400,
          // onEditingComplete:() => FocusScope.of(context).nextFocus(),
          textInputAction: TextInputAction.next,
          cursorHeight: 20,
          validator: (value) {
            return value!.isEmpty ? 'Enter New Password' : null;
          },
          obscureText: _show2,
          controller: _passwordController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 15),
            isDense: true,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _show2 = !_show2;
                });
              },
              icon: Icon(_show2 ? Icons.visibility : Icons.visibility_off),
            ),
            hintText: 'New Password',
            hintStyle: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.greyshade400),
          ),
        )
      ],
    );
  }

  confirmPasswordTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title(title: 'Confirm New Password'),
        TextFormField(
          style: CustomTextStyles.text12RegularW400,
          cursorHeight: 20,
          controller: _confirmPasswordController,
          validator: (value) {
            return value!.isEmpty ? 'Confirm Password' : null;
          },
          obscureText: _show3,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 15),
            isDense: true,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _show3 = !_show3;
                });
              },
              icon: Icon(_show3 ? Icons.visibility : Icons.visibility_off),
            ),
            hintText: 'Confirm New Password',
            hintStyle: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.greyshade400),
          ),
        ),
      ],
    );
  }

  Future<void> updatePassword() async {
    UIHelper.apiCallingAlert(context);
    var response = await ApiCalls.changePassword(
      userId: AppConstants.myId,
      currentPass: _oldPasswordController.text,
      newPass: _passwordController.text,
    );
    UIHelper.hideApiCallingAlert(context);
    if (response is ErrorEntity) {
      UIHelper.showErrorAlert(context, response.message);
    } else {
      ChangePasswordEntity passwordEntity =
          ChangePasswordEntity.fromJson(jsonEncode(response));
      if (passwordEntity.success == 1) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('password', _passwordController.text);
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
                    style: CustomTextStyles.text14SemiBoldW600,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    passwordEntity.message ?? '',
                    style: CustomTextStyles.text12SemiBoldW600,
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
                            style: CustomTextStyles.text14SemiBoldW600.copyWith(color: AppColor.primaryColor,)
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
