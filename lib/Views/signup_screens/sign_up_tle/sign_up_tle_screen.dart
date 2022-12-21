import 'package:country_picker/country_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Widgets/custom_widgets.dart';
import '../../../Widgets/widget_styles.dart';
import '../../../controllers/profile_controller.dart';
import '../../../helper_classes/ui_helper.dart';
import '../../../local_db/local_db.dart';
import '../../../models/error_entity.dart';
import '../../../networkcalls/api_calls.dart';
import '../../../networkcalls/response_models/login_entity_entity.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/app_images.dart';
import '../../../utils/device_data.dart';
import '../../bottom_navigationbar.dart';
import '../../login_screen.dart';

class SignUpTLE extends StatefulWidget {
  final String name;
  final String email;
  final String loginWith;
  final String password;

  const SignUpTLE(
      {Key? key,
      required this.name,
      required this.email,
      required this.loginWith,
      required this.password})
      : super(key: key);

  @override
  _SignUpTLEState createState() => _SignUpTLEState();
}

class _SignUpTLEState extends State<SignUpTLE> {
  final ProfileController _controller = Get.put(ProfileController());
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _countryCodeController = TextEditingController();
  GlobalKey<FormState> foKey = GlobalKey<FormState>();
  bool showValue = false;
  String? toLaunch = AppConstants.privacyUrl;

  bool wait = false;
  bool showPass = true;
  bool showPass2 = true;
  bool valid = false;

  Future<void>? _launched;
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    print(widget.loginWith);
    _nameController.text = widget.name;
    _emailController.text = widget.email;
    _countryCodeController.text = '+92';
    _passwordController.text = widget.password;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        // print(_students.length);
      },
      child: Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(
          backgroundColor: AppColor.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColor.black),
        ),
        body: _bodyColumn(),
        // FutureBuilder(
        //   future: _fetchData,
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.done) {
        //       return _bodyColumn();
        //     } else {
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //   },
        // ),
      ),
    );
  }

  Widget _bodyColumn() {
    return Stack(
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Form(
              key: foKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image(
                      image: const AssetImage(AppImages.alumniLogo),
                      height: 70.w,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  WidgetStyle.signUpName(title: 'Full Name*'),
                  nameTextField(),
                  const SizedBox(
                    height: 15,
                  ),
                  dateOfBirthTextField(),
                  const SizedBox(
                    height: 15,
                  ),
                  WidgetStyle.signUpName(title: "Email*"),
                  emailTextField(),
                  const SizedBox(
                    height: 15,
                  ),
                  phoneTextField(),
                  const SizedBox(
                    height: 15,
                  ),
                  widget.loginWith == 'email'
                      ? Column(
                          children: [
                            passwordTextField(),
                            const SizedBox(
                              height: 15,
                            ),
                            confirmPasswordTextField(),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        )
                      : const SizedBox(),
                  _checkbox(),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: CustomWidget.myButton(
                        isBorder: false,
                        name: "Sign Up",
                        size: Size(100.w, 25.h),
                        onClicked: () {
                          if (_phoneController.text.isEmpty) {
                            setState(() {
                              valid = true;
                            });
                            // if (foKey.currentState!.validate()) {
                            //   if (showValue) {
                            //     autoSignUpCall();
                            //   } else {
                            //     UIHelper.showErrorAlert(
                            //         context, 'Please accept privacy policy');
                            //   }
                            // }
                          }
                          else {
                            setState(() {
                              valid = false;
                            });
                            if (foKey.currentState!.validate()) {
                              if (showValue) {
                                autoSignUpCall();
                              } else {
                                UIHelper.showErrorAlert(
                                    context, 'Please accept privacy policy');
                              }
                            }
                          }
                        }),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  _signInText(),
                  const SizedBox(
                    height: 14,
                  ),
                  GestureDetector(
                      onTap: () {
                        _launchURL(
                            'https://api.whatsapp.com/send?phone=${AppConstants.whatsAppNumber}');
                      },
                      child: _contactUsText()),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
        ),
        wait
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const SizedBox()
      ],
    );
  }

  Widget nameTextField() {
    return TextFormField(
      // // 18.h,
      textCapitalization: TextCapitalization.words,
      controller: _nameController,
      // readOnly: searched ? true : false,
      textInputAction: TextInputAction.next,
      validator: (value) {
        return value!.isEmpty ? 'Name is required' : null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: 13.sp),
        contentPadding: const EdgeInsets.only(top: 13, bottom: 3),
        isDense: true,
        hintText: 'Full Name',
        hintStyle: TextStyle(color: AppColor.greyshade400,fontSize: 12.sp),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.primaryColor,
          ),
        ),
      ),
      style: TextStyle(
        fontSize: ScreenUtil().setSp(14),
      ),
    );
  }

  dateOfBirthTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetStyle.signUpName(title: 'Date Of Birth*'),
        SizedBox(
          height: 5.h,
        ),
        TextFormField(
          validator: (value) {
            return value!.isEmpty ? 'DOB is required' : null;
          },
          readOnly: true,
          onTap: () async {
            await _selectBirthDate(context);
          },
          style: TextStyle(
            fontSize: ScreenUtil().setSp(14),
          ),
          controller: _dateOfBirthController,
          decoration: WidgetStyle.nameTextFieldDecoration(hint: '24/12/2019'),
        ),
      ],
    );
  }

  DateTime? selectedDate;
  Future<void> _selectBirthDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1930, 8),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) selectedDate = picked;

    setDate();
  }

  void setDate() {
    setState(() {
      if (selectedDate == null) {
      } else {
        _dateOfBirthController.text =
            DateFormat("dd/MM/yyyy").format(selectedDate!).toString();
      }
    });
  }

  Widget emailTextField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: (value) {
        return value!.isEmpty
            ? 'Email is required'
            : validateEmail(value) == 1
                ? 'Invalid email'
                : null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: 13.sp),
        contentPadding: const EdgeInsets.only(top: 13, bottom: 3),
        isDense: true,
        hintText: 'example@mail.com',
        hintStyle: TextStyle(color: AppColor.greyshade400,fontSize: 12.sp),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.primaryColor,
          ),
        ),
      ),
      style: TextStyle(
        fontSize: ScreenUtil().setSp(14),
      ),
    );
  }

  phoneTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetStyle.signUpName(title: 'Phone*'),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: 40,
              child: TextFormField(
                style: TextStyle(fontSize: 14.sp),
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
                // validator: (value) {
                //   return value!.isEmpty
                //       ? 'Number is required' : null;
                // },
                controller: _phoneController,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 14.sp),
                decoration: InputDecoration(
                  hintText: 'Enter Phone Number',
                  hintStyle: TextStyle(fontSize: 12.sp, color: AppColor.greyshade400),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.redshade900)),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        valid
            ? Text(
                'Phone number is required',
                style: TextStyle(color: AppColor.redshade900, fontSize: 13.sp),
              )
            : const SizedBox(),
      ],
    );
  }

  passwordTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetStyle.signUpName(title: 'Password*'),
        TextFormField(
          // 18.h,
          validator: (value) {
            return value!.isEmpty ? 'Password is required' : null;
          },
          style: TextStyle(
            fontSize: ScreenUtil().setSp(14),
          ),
          textInputAction: TextInputAction.next,
          obscureText: showPass,
          controller: _passwordController,
          decoration: WidgetStyle.nameTextFieldDecoration(hint: "**********"),
        )
      ],
    );
  }

  confirmPasswordTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetStyle.signUpName(title: 'Confirm Password*'),
        TextFormField(
          // 18.h,
          validator: (value) {
            return value!.isEmpty
                ? 'Please confirm Password'
                : value != _passwordController.text
                    ? 'Password does not match'
                    : null;
          },
          style: TextStyle(
            fontSize: ScreenUtil().setSp(14),
          ),
          obscureText: showPass2,
          controller: _confirmPasswordController,
          decoration: WidgetStyle.nameTextFieldDecoration(hint: "**********"),
        )
      ],
    );
  }

  Widget _checkbox() {
    return Row(
      children: [
        SizedBox(
          width: 15,
          height: 15,
          child: Checkbox(
              activeColor: AppColor.primaryColor,
              value: showValue,
              onChanged: (value) {
                setState(() {
                  showValue = value!;
                });
              }),
        ),
        const SizedBox(width: 15),
        Text(
          'By signing up you agree to our ',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(13),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(
              () {
                _launched = _launchInBrowser(toLaunch!);
              },
            );
          },
          child: Text(
            'Privacy Policy',
            style: TextStyle(
              color: AppColor.primaryColor,
              fontSize: ScreenUtil().setSp(13),
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }

  Widget _contactUsText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Having trouble? ',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(16),
                  color: AppColor.greyshade500,
                ),
              ),
              TextSpan(
                text: 'Contact Us',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _launchURL(
                        'https://api.whatsapp.com/send?phone=${AppConstants.whatsAppNumber}');
                  },
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: ScreenUtil().setSp(17),
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _signInText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Already have an account? ',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(16),
                    color: AppColor.greyshade500),
              ),
              TextSpan(
                text: 'Sign In',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.back();
                  },
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: ScreenUtil().setSp(17),
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  autoSignUpCall() async {
    UIHelper.apiCallingAlert(context);
    DeviceData device = DeviceData();
    await device.init();
    var response = await ApiCalls.signupTle(
      email: _emailController.text,
      fullName: _nameController.text,
      dob: _dateOfBirthController.text,
      phone: _countryCodeController.text + _phoneController.text,
      loginWith: widget.loginWith,
      password: _passwordController.text,
      status: 'A',
      source: device.platform,
      manufacturer: device.manufacturer,
      model: device.model,
      platform: device.platform,
      osVersion: device.osVersion,
      token: device.token,
      serial: device.serial,
      appVersion: device.appVersion,
    );
    print(widget.loginWith);

    UIHelper.hideApiCallingAlert(context);

    if (response is ErrorEntity) {
      print("Hello");
      UIHelper.showErrorAlert(context, response.message);
    } else {
      LoginEntityEntity loginEntity = LoginEntityEntity().fromJson(response);
      if (loginEntity.success == 1) {
        if (loginEntity.result!.isUpdate == "1" &&
            loginEntity.result!.isVerified == "1") {
          AppConstants.myId = loginEntity.result!.userId ?? '';
          AppConstants.userName = loginEntity.result!.firstName ?? '';
          AppConstants.bearerToken = loginEntity.result!.token ?? '';
          AppConstants.chapterId = loginEntity.result!.chapterId ?? '';
          SharedPreferences localStorage =
              await SharedPreferences.getInstance();
          localStorage.setString('email', loginEntity.result!.email ?? '');
          localStorage.setString('password', _passwordController.text);
          localStorage.setString('loginWith', "email");
          localStorage.setString(
              'firstName', loginEntity.result!.firstName ?? '');
          localStorage.setString(
              'lastName', loginEntity.result!.lastName ?? '');
          localStorage.setString(
              'selectedIndustry', loginEntity.result!.industryName ?? '');
          localStorage.setString(
            'userImage',
            loginEntity.result!.image ?? '',
          );
          localStorage.setString(
            'count',
            loginEntity.unreadCount ?? '',
          );
          localStorage.setString(
              'sharingLoc', loginEntity.result!.isSharingLoc ?? '');
          localStorage.setString('user_id', loginEntity.result!.userId ?? '');
          localStorage.setBool('is_first', false);
          localStorage.setString('loginStatus', '1');
          localStorage.setString('token', loginEntity.result!.token ?? '');
          DBAllUser allUser = DBAllUser(
            userId: loginEntity.result!.userId,
            firstName: loginEntity.result!.firstName,
            lastName: loginEntity.result!.lastName,
            description: loginEntity.result!.description,
            designation: loginEntity.result!.designation,
            branchName: loginEntity.result!.branchName,
            organizationName: loginEntity.result!.organizationName,
            email: loginEntity.result!.email,
            currentCityName: loginEntity.result!.currentCityName,
            isMentor: loginEntity.result!.isMentor,
            isVerified: loginEntity.result!.isVerified,
            connectionStatus: loginEntity.result!.connectionStatus,
            image: loginEntity.result!.image,
            graduationYear: loginEntity.result!.graduationYear,
            chatStatus: loginEntity.result!.chatInvitationStatus,
            linkedinUrl: loginEntity.result!.userLinkedinUrl,
            sharingLoc: loginEntity.result!.isSharingLoc,
            industryName: loginEntity.result!.industryName,
            companyId: loginEntity.result!.companyId,
            branchId: loginEntity.result!.branchId,
          );
          await database.insertUser(allUser);
          _controller.getInfo();
          Get.offUntil(GetPageRoute(page: () => const BottomNavigationScreen()),
              (route) => false);
        } else {
          UIHelper.showErrorAlert(context, loginEntity.message);
        }
      }
    }
  }

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Not found $url';
}
