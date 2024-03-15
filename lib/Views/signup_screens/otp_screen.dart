import 'dart:convert';
import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as fb;
import 'package:iobm/Views/signup_screens/sign_up_boss/signup_search_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widgets/custom_widgets.dart';
import '../../Widgets/widget_styles.dart';
import '../../controllers/profile_controller.dart';
import '../../helper_classes/ui_helper.dart';
import '../../local_db/local_db.dart';
import '../../models/error_entity.dart';
import '../../networkcalls/api_calls.dart';
import '../../networkcalls/api_path.dart';
import '../../networkcalls/network_config.dart';
import '../../networkcalls/response_models/login_entity_entity.dart';
import '../../networkcalls/response_models/verify_phone_entity.dart';
import '../../utils/app_color.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';
import '../../utils/device_data.dart';
import '../bottom_navigationbar.dart';

class OtpScreen extends StatefulWidget {
  final String check;
  const OtpScreen({Key? key, required this.check}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _countryCodeController = TextEditingController();
  GlobalKey<FormState> fKey = GlobalKey<FormState>();
  final ProfileController _controller = Get.put(ProfileController());

  String number = '';

  @override
  void initState() {
    _countryCodeController.text = '+92';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme:  IconThemeData(
          color: AppColor.primaryColor, //change your color here
        ),
        backgroundColor: AppColor.transparent,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100.h,
                ),
                widget.check ==  'forget' ? SvgPicture.asset(AppImages.forgotPassword) : SvgPicture.asset(AppImages.signupOtp),
                SizedBox(
                  height: 35.h,
                ),
                Text(
                  'Enter your registered email address to verify its you',
                  style: WidgetStyle.forgotTExtStyle(
                      fontSize: 14.0, color: AppColor.greyshade800),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.h),
                otpTextEmailField(),
                SizedBox(height: 40.h),
                CustomWidget.myButton(
                    isBorder: false,
                    name: AppConstants.sendcode,
                    // size: Size(110.w, 30.h),
                    onClicked: () {
                      if (fKey.currentState!.validate()) {
                        sendEmailCode();
                      }

                    }),
                SizedBox(height: 40.h),
                backToLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget backToLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Back to',
          style: WidgetStyle.forgotTExtStyle(
              fontSize: ScreenUtil().setSp(13), color: AppColor.greyshade800),
        ),
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Text(
              'Sign In',
              style: WidgetStyle.underLineTextStyle(
                color: AppColor.primaryColor,
                fontSize: ScreenUtil().setSp(13),
              ),
            )),
      ],
    );
  }

  Widget otpTextField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: 40,
          child: TextFormField(
            readOnly: true,
            onTap: () {
              showCountryPicker(
                exclude: <String>['IR', 'SY', 'KP', 'CU', 'VE'],
                context: context,
                onSelect: (Country country) {
                  setState(
                    () {
                      _countryCodeController.text = "+${country.phoneCode}";
                    },
                  );
                },
              );
            },
            controller: _countryCodeController,
            decoration: InputDecoration(
              hintStyle: const TextStyle(),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.redshade900)),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Enter Phone Number',
              hintStyle: const TextStyle(),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.redshade900)),
            ),
          ),
        )
      ],
    );
  }

  Widget otpTextEmailField() {
    return Form(
      key: fKey,
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Enter Your Email',
          hintStyle: const TextStyle(),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.redshade900)),
        ),
        validator: (value) {
          return value!.isEmpty ? 'Email is required' : null;
        },
      ),
    );
  }

  Future<void> verifyPhoneNumber() async {
    if (_phoneController.text[0] == "0") {
      _phoneController.text = _phoneController.text.substring(1);
    }
    setState(() {
      number = _countryCodeController.text + _phoneController.text;
    });
    UIHelper.apiCallingAlert(context);
    var response = await ApiCalls.verifyPhone(
      phone: number,
    );
    print(number);
    UIHelper.hideApiCallingAlert(context);
    if (response is ErrorEntity) {
      if (widget.check == 'forget') {
        CustomWidget.otpDialog(
            context: context, phone: number, check: widget.check);
      } else {
        UIHelper.showErrorAlert(context, response.message);
      }
    } else {
      VerifyPhoneEntity phoneEntity = VerifyPhoneEntity.fromJson(
        jsonEncode(response),
      );
      if (phoneEntity.success == 1) {
        if (widget.check == "forget") {
          UIHelper.showErrorAlert(context, "The phone number does not exist");
        } else {
          CustomWidget.otpDialog(
              context: context, phone: number, check: widget.check);
        }
      }
    }
  }

  Future<void> sendEmailCode() async{
    UIHelper.apiCallingAlert(context);
    String url = AppConstants.baseUrl + apiSendEmailVerifyCode;
    Map map = {
      "email": _emailController.text,
      "forgot": widget.check == "forget" ? "1" : "0"
    };
    ApiResponse apiResponse = await NetworkConfig.postWebCall(url, map);
    UIHelper.hideApiCallingAlert(context);
    if(apiResponse.done ?? false){
      dynamic otpStatus = jsonDecode(apiResponse.responseString??"")["otp"] ?? "";
      if(otpStatus == "active"){
        CustomWidget.otpDialog(context: context, phone: _emailController.text, check: widget.check);
      }
      else{
        UIHelper.showErrorAlert(context, jsonDecode(apiResponse.responseString??"")["message"]);
      }
    } else{
      UIHelper.showErrorAlert(context, apiResponse.errorMsg);
    }
  }

}

