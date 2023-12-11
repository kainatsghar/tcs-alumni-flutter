import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/forget_password_screen.dart';
import 'package:iobm/helper_classes/ui_helper.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:pinput/pinput.dart';

import '../../Views/signup_screens/sign_up_boss/signup_search_screen.dart';
import '../../networkcalls/api_path.dart';
import '../../networkcalls/network_config.dart';
import '../../utils/app_constants.dart';

class OTPDialog extends StatefulWidget {
  final String? phone;
  final String check;
  const OTPDialog({
    Key? key,
    this.phone,
    required this.check,
  }) : super(key: key);

  @override
  _OTPDialogState createState() => _OTPDialogState();
}

class _OTPDialogState extends State<OTPDialog> {
  final TextEditingController _otpController = TextEditingController();

  String? _verificationCode;
  int resentTime = 60;
  bool showTimer = false;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      _fetchOtpCode();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SingleChildScrollView(
          child: Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 16,
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          "OTP Verification",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              color: AppColor.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "We have sent you a 4 digit verification code. Please enter below",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              // fontFamily: 'Nunito',
                              fontSize: ScreenUtil().setSp(12),
                              color: AppColor.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        inputField(),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text('Time Remaining',
                            style: TextStyle(color: AppColor.grey, fontSize: 12.sp)),
                        Text('00 : ${resentTime.toString().padLeft(2, '0')}s',
                            style:  TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.primaryColor)),
                        SizedBox(height: 15.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 50.h,
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    // padding:
                                    //     MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    //          EdgeInsets.symmetric(horizontal: 50.w)),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        side:  BorderSide(
                                          color: AppColor.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    verifyCode();
                                  },
                                  child: Text(
                                    widget.check == 'signup'
                                        ? 'Verify & Create Account'
                                        : 'Verify & Continue',
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: AppColor.black,
                              fontSize: 12.sp,
                            ),
                            text: 'Didn\'t receive code? ',
                            children: [
                              TextSpan(
                                  text: 'Request Again',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: resentTime == 0 ? AppColor.primaryColor : AppColor.primaryColor.withOpacity(0.4),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      if(resentTime == 0){
                                        reSendEmailCode();
                                        setState(() {
                                          resentTime = 60;
                                        });
                                      }
                                    }),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                    Positioned(
                      right: 0,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Padding inputField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Pinput(
        // androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
        controller: _otpController,
        length: 4,
        pinAnimationType: PinAnimationType.slide,
        followingPinTheme: PinTheme(
            width: 40.w,height: 40.w,
            textStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
            decoration: pinPutDecoration
        ),
        defaultPinTheme: PinTheme(
            width: 40.w,height: 40.w,
            textStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
            decoration: pinUnSubmitDecoration
        ),
        focusedPinTheme: PinTheme(
            width: 40.w,height: 40.w,
            textStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
            decoration: pinUnSubmitDecoration
        ),
      ),
    );
  }

  final FocusNode _pinPutFocusNode = FocusNode();

  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: AppColor.primaryColor.withOpacity(0.2),
    borderRadius: BorderRadius.circular(5),
    border: Border.all(
      color: AppColor.white,
    ),
  );
  final BoxDecoration pinUnSubmitDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    border: Border.all(
      color: AppColor.primaryColor,
    ),
  );

  Future<void> _fetchOtpCode() async {
    showTimer = true;
    resendTimer();

    UIHelper.apiCallingAlert(context);
    String url = AppConstants.baseUrl + apiOtpVerification;
    Map map = {
      "email": widget.phone
    };
    print("EmailCheck ${widget.phone}");
    ApiResponse apiResponse = await NetworkConfig.postWebCall(url, map);
    UIHelper.hideApiCallingAlert(context);
    if(apiResponse.done ?? false){
      dynamic otpStatus = jsonDecode(apiResponse.responseString??"")["otp"];
      if(otpStatus == "inactive"){
        UIHelper.showErrorAlert(context, jsonDecode(apiResponse.responseString??"")["message"]);
      }
      else{
        print("_verificationCode= $otpStatus");
        _verificationCode = otpStatus;
      }
    } else{
      UIHelper.showErrorAlert(context, apiResponse.errorMsg);
    }
  }

  Future<void> _sendOtp() async {
    showTimer = true;
    resendTimer();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '${widget.phone}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        // await FirebaseAuth.instance
        //     .signInWithCredential(credential)
        //     .then((value) async {
        //   if (value.user != null) {
        //     // Navigator.pushAndRemoveUntil(
        //     //     context,
        //     //     MaterialPageRoute(builder: (context) => HomeScreen()),
        //     //     (route) => false);
        //   }
        // });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verficationID, int? resendToken) {
        setState(() {
          _verificationCode = verficationID;
        });
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        setState(() {
          _verificationCode = verificationID;
        });
      },
      timeout: const Duration(seconds: 60),
    );
  }

  // Future<void> verifyCode() async {
  //   UIHelper.apiCallingAlert(context);
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   String smsCode = _otpController.text;
  //
  //   // Create a PhoneAuthCredential with the code
  //   PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
  //     verificationId: _verificationCode ?? '',
  //     smsCode: smsCode,
  //   );
  //
  //   // Sign the user in (or link) with the credential
  //   await auth.signInWithCredential(phoneAuthCredential).then(
  //         (value) {
  //       if (value.user != null) {
  //         UIHelper.hideApiCallingAlert(context);
  //         if (widget.check == 'signup') {
  //           Navigator.of(context).pop();
  //           Get.off(
  //                 () => BossSearchSignupView(
  //               phone: widget.phone,
  //               email: "",
  //               name: "",
  //               loginWith: 'email',
  //               password: "",
  //             ),
  //           );
  //         } else {
  //           Navigator.of(context).pop();
  //           Get.off(
  //                 () => ForgetPasswordScreen(
  //               phone: widget.phone ?? '',
  //             ),
  //           );
  //         }
  //       } else {
  //         UIHelper.showErrorAlert(context, "Code is not correct");
  //       }
  //     },
  //   ).catchError(
  //         (error) {
  //       UIHelper.hideApiCallingAlert(context);
  //       UIHelper.showErrorAlert(context, "Code is not correct");
  //     },
  //   );
  // }

  Future<void> verifyCode() async {
    if(_otpController.text == _verificationCode){
      if (widget.check == 'signup') {
        Navigator.of(context).pop();
        Get.off(
              () => BossSearchSignupView(
            phone: widget.phone,
            email: "",
            name: "",
            loginWith: 'email',
            password: "",
          ),
        );
      }
      else {
        Navigator.of(context).pop();
        Get.off(
              () => ForgetPasswordScreen(
            phone: widget.phone ?? '',
          ),
        );
      }
    }
    else{
      UIHelper.showErrorAlert(context, "OTP code is not correct");
    }
  }

  Future<void> reSendEmailCode() async{
    UIHelper.apiCallingAlert(context);
    String url = AppConstants.baseUrl + apiSendEmailVerifyCode;
    Map map = {
      "email": widget.phone,
      "forgot": widget.check == "forget" ? "1" : "0"
    };
    ApiResponse apiResponse = await NetworkConfig.postWebCall(url, map);
    UIHelper.hideApiCallingAlert(context);
    if(apiResponse.done ?? false){
      dynamic otpStatus = jsonDecode(apiResponse.responseString??"")["otp"] ?? "";
      if(otpStatus == "active"){
        _fetchOtpCode();
      }
      else{
        UIHelper.showErrorAlert(context, jsonDecode(apiResponse.responseString??"")["message"]);
      }
    }
    else{
      UIHelper.showErrorAlert(context, apiResponse.errorMsg);
    }
  }

  resendTimer() {
    print('timer called');
    Timer.periodic(const Duration(seconds: 1), (timer) {
      print(resentTime);
      if(mounted){setState(() {
        resentTime--;
      });}
      if (resentTime == 0) {
        timer.cancel();
      }
    });
  }

}
