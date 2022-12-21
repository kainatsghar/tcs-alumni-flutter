import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/forget_password_screen.dart';
import 'package:iobm/Views/signup_screens/sign_up_screen.dart';
import 'package:iobm/helper_classes/ui_helper.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:pinput/pin_put/pin_put.dart';

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

  @override
  void initState() {
    _sendOtp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
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
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "We have sent you a six digit verification code. Please enter below",
                      style: TextStyle(
                        // fontFamily: 'Nunito',
                        fontSize: ScreenUtil().setSp(12),
                        color: AppColor.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  inputField(),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.symmetric(horizontal: 20.0)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: const BorderSide(
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          verifyCode();
                        },
                        child: Text(
                          'Verify',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
              Positioned(
                right: 0,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.close),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding inputField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: PinPut(
        fieldsCount: 6,
        textStyle: TextStyle(
          fontSize: ScreenUtil().setSp(24),
        ),
        pinAnimationType: PinAnimationType.slide,
        focusNode: _pinPutFocusNode,
        controller: _otpController,
        submittedFieldDecoration: pinPutDecoration,
        selectedFieldDecoration: pinUnSubmitDecoration,
        followingFieldDecoration: pinUnSubmitDecoration,
        inputDecoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
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

  Future<void> _sendOtp() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '${widget.phone}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) async {
          if (value.user != null) {
            // Navigator.pushAndRemoveUntil(
            //     context,
            //     MaterialPageRoute(builder: (context) => HomeScreen()),
            //     (route) => false);
          }
        });
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

  Future<void> verifyCode() async {
    UIHelper.apiCallingAlert(context);
    FirebaseAuth auth = FirebaseAuth.instance;
    String smsCode = _otpController.text;

    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: _verificationCode ?? '',
      smsCode: smsCode,
    );

    // Sign the user in (or link) with the credential
    await auth.signInWithCredential(phoneAuthCredential).then(
      (value) {
        if (value.user != null) {
          UIHelper.hideApiCallingAlert(context);
          if (widget.check == 'signup') {
            Get.off(
              () => SignUpScreen(
                phone: widget.phone,
                email: "",
                name: "",
                loginWith: 'email',
                password: "",
              ),
            );
          } else {
            Get.off(
              () => ForgetPasswordScreen(
                phone: widget.phone ?? '',
              ),
            );
          }
        } else {
          UIHelper.showErrorAlert(context, "Code is not correct");
        }
      },
    ).catchError(
      (error) {
        UIHelper.hideApiCallingAlert(context);
        UIHelper.showErrorAlert(context, "Code is not correct");
      },
    );
  }
}
