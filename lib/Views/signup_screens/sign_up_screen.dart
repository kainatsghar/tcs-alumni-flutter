import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:iobm/Views/login_screen.dart';

import 'package:iobm/Widgets/custom_widgets.dart';
import 'package:iobm/Widgets/widget_styles.dart';
import 'package:iobm/controllers/profile_controller.dart';
import 'package:iobm/helper_classes/ui_helper.dart';
import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/response_models/login_entity_entity.dart';

import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/device_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../bottom_navigationbar.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  final String? phone;
  final String? email;
  final String? loginWith;
  final String? password;
  final String? name;
  const SignUpScreen({
    Key? key,
    this.phone,
    this.email,
    required this.loginWith,
    required this.password,
    required this.name,
  }) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _cnicController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final ProfileController _controller = Get.put(ProfileController());
  final TextEditingController _phoneController = TextEditingController();
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

  bool showValue = false;
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

  String? toLaunch = '${AppConstants.privacyUrl}';

  late List<DBDegree> _programList;

  List graduationYearList = [];
  addingYear() {
    for (var i = 0; i <= 40; i++) {
      int year = DateTime.now().year;
      setState(() {
        year = year - i;
        graduationYearList.add(
          year.toString(),
        );
      });
    }
  }

  String? _degreeId;
  String? _passingYearValue;
  late Future _fetchData;

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

  @override
  void initState() {
    print(widget.loginWith);
    _programList = [];
    _nameController.text = widget.name ?? '';
    _phoneController.text = widget.phone ?? '';
    _emailController.text = widget.email ?? '';
    _passwordController.text = widget.password ?? '';
    _confirmPasswordController.text = widget.password ?? '';
    _fetchData = getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(_programList.length);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.transparent,
          iconTheme: const IconThemeData(
            color: AppColor.black,
          ),
        ),
        body: FutureBuilder(
          future: _fetchData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return _bodyColumn();
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _bodyColumn() {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
          child: Form(
            key: fKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  height: 20,
                ),
                WidgetStyle.signUpName(title: 'Full Name*'),
                nameTextField(),
                const SizedBox(
                  height: 10,
                ),
                dateOfBirthTextField(),
                const SizedBox(
                  height: 10,
                ),
                widget.password == "" ? emailTextField() : const SizedBox(),
                const SizedBox(
                  height: 10,
                ),
                phoneTextField(),
                const SizedBox(
                  height: 10,
                ),
                WidgetStyle.signUpName(title: "Program Name*"),
                _programName(),
                const SizedBox(
                  height: 10,
                ),
                WidgetStyle.signUpName(title: "Graduation Year*"),
                _passingYear(),
                const SizedBox(
                  height: 10,
                ),
                cnicTextField(),
                const SizedBox(
                  height: 10,
                ),
                widget.password == ""
                    ? Column(
                        children: [
                          passwordTextField(),
                          const SizedBox(
                            height: 10,
                          ),
                          confirmPasswordTextField(),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      )
                    : const SizedBox(
                        height: 15,
                      ),

                _checkbox(),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: CustomWidget.myButton(
                      isBorder: false,
                      name: AppConstants.signup,
                      // size: Size(120.w, 35.h),
                      onClicked: () {
                        if (fKey.currentState!.validate()) {
                          if (showValue == false) {
                            UIHelper.showErrorAlert(
                                context, "Please agree to privacy policy");
                          } else {
                            signUpCall();
                          }
                        }
                      }),
                ),
                // Center(
                //   child: CustomWidget.myButton(
                //     name: "Sign Up",
                //     size: const Size(100, 30),
                //     isBorder: false,
                //     onClicked: () {},
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                _signInText(),
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ));
  }

  Widget nameTextField() {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      controller: _nameController,
      textInputAction: TextInputAction.next,
      validator: (value) {
        return value!.isEmpty ? 'Name is required' : null;
      },
      decoration: InputDecoration(
        helperText: 'Kindly use your official name registered at school',
        helperStyle: TextStyle(
          fontSize: ScreenUtil().setSp(13),
        ),
        contentPadding: const EdgeInsets.only(right: 20, bottom: 0),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor),
        ),
      ),
      style: TextStyle(
        fontSize: ScreenUtil().setSp(14),
      ),
    );
  }

  _programName() {
    return SizedBox(
      child: DropdownButtonFormField(
        validator: (value) {
          return value == null ? 'Please select program' : null;
        },
        items: _programList.map((itemValue) {
          return DropdownMenuItem(
            value: itemValue.degreeId,
            child: Text(
              itemValue.degreeName ?? '',
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            _degreeId = newValue.toString();
          });
        },
        isExpanded: true,
        value: _degreeId,
        hint: Text(
          'BBA',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(14),
            color: AppColor.greyshade400,
          ),
        ),
        iconEnabledColor: AppColor.primaryColor,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(14),
          color: AppColor.black,
        ),
      ),
    );
  }

  _passingYear() {
    return DropdownButtonFormField(
      validator: (value) {
        return value == null ? 'Please select graduation year' : null;
      },
      items: graduationYearList.map((itemValue) {
        return DropdownMenuItem(
          value: itemValue,
          child: Text(itemValue),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          _passingYearValue = newValue.toString();
        });
      },
      hint: Text(
        '2021',
        style: TextStyle(
          fontSize: ScreenUtil().setSp(14),
          color: AppColor.greyshade400,
        ),
      ),
      style: TextStyle(
        fontSize: ScreenUtil().setSp(14),
        color: AppColor.black,
      ),
      value: _passingYearValue,
      iconEnabledColor: AppColor.primaryColor,
    );
  }

  _signInText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: WidgetStyle.forgotTExtStyle(
            fontSize: ScreenUtil().setSp(13),
            color: AppColor.greyshade800,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
            onTap: () {
              Get.offUntil(GetPageRoute(page: () => const LoginScreen()),
                  (route) => false);
            },
            child: Text(
              'Sign In',
              style: WidgetStyle.underLineTextStyle(
                  color: AppColor.primaryColor,
                  fontSize: ScreenUtil().setSp(13)),
            )),
      ],
    );
  }

  dateOfBirthTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetStyle.signUpName(title: 'Date Of Birth*'),
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
          decoration: WidgetStyle.nameTextFieldDecoration(),
        ),
      ],
    );
  }

  cnicTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetStyle.signUpName(title: 'CNIC*'),
        TextFormField(
          maxLength: 16,
          validator: (value) {
            return value!.isEmpty ? 'CNIC is required' : null;
          },
          keyboardType: TextInputType.phone,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(14),
          ),
          controller: _cnicController,
          decoration:
              WidgetStyle.nameTextFieldDecoration(hint: "Enter Your CNIC"),
        )
      ],
    );
  }

  emailTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetStyle.signUpName(title: 'Email*'),
        TextFormField(
          validator: (value) {
            return value!.isEmpty ? 'Email is required' : null;
          },
          style: TextStyle(
            fontSize: ScreenUtil().setSp(14),
          ),
          readOnly: widget.email == "" ? false : true,
          textInputAction: TextInputAction.next,
          controller: _emailController,
          decoration:
              WidgetStyle.nameTextFieldDecoration(hint: "example@mail.com"),
        )
      ],
    );
  }

  phoneTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetStyle.signUpName(title: 'Phone*'),
        TextFormField(
          readOnly: widget.phone != "" ? true : false,
          validator: (value) {
            return value!.isEmpty ? 'Phone is required' : null;
          },
          style: TextStyle(
            fontSize: ScreenUtil().setSp(14),
          ),
          keyboardType: TextInputType.phone,
          maxLength: 16,
          controller: _phoneController,
          decoration:
              WidgetStyle.nameTextFieldDecoration(hint: "+923212345678"),
        )
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
          validator: (value) {
            return value!.isEmpty ? 'Password is required' : null;
          },
          style: TextStyle(
            fontSize: ScreenUtil().setSp(14),
          ),
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

  Future<void> getData() async {
    _programList = await database.getAllDegrees();
    addingYear();
  }

  signUpCall() async {
    UIHelper.apiCallingAlert(context);
    DeviceData device = DeviceData();
    await device.init();
    var response = await ApiCalls.signup(
      email: _emailController.text,
      name: _nameController.text,
      cnic: _cnicController.text,
      dob: _dateOfBirthController.text,
      phone: _phoneController.text,
      program: _degreeId,
      loginWith: widget.loginWith,
      graduationYear: _passingYearValue,
      password: _passwordController.text,
      confirmPassword: _confirmPasswordController.text,
      manufacturer: device.manufacturer,
      model: device.model,
      platform: device.platform,
      osVersion: device.osVersion,
      token: device.token,
      serial: device.serial,
      appVersion: device.appVersion,
    );
    UIHelper.hideApiCallingAlert(context);

    if (response is ErrorEntity) {
      UIHelper.showErrorAlert(context, response.message);
    } else {
      LoginEntityEntity loginEntity = LoginEntityEntity().fromJson(response);
      if (loginEntity.success == 1) {
        if (loginEntity.result!.isVerified == "1") {
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
            loginEntity.unreadCount ?? '0',
          );
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
}
