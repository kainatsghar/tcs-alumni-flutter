import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
import '../../../networkcalls/response_models/boss_search_entity.dart';
import '../../../networkcalls/response_models/login_entity_entity.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/app_images.dart';
import '../../../utils/device_data.dart';
import '../../bottom_navigationbar.dart';
import '../../login_screen.dart';

class BossSearchSignupView extends StatefulWidget {
  final String? email;
  final String? loginWith;
  final String? password;
  final String? name;
  final String? phone;

  const BossSearchSignupView({
    Key? key,
    this.email,
    this.loginWith,
    this.password,
    this.name,
    this.phone,
  }) : super(key: key);

  @override
  _BossSearchSignupViewState createState() => _BossSearchSignupViewState();
}

class _BossSearchSignupViewState extends State<BossSearchSignupView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _fatherController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final ProfileController _controller = Get.put(ProfileController());
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

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

  String? toLaunch = AppConstants.privacyUrl;

  GlobalKey<FormState> fKey = GlobalKey<FormState>();
  bool wait = false;

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

  late List<DBBranche> _branchList;
  late List<Student> _students;
  late Future _fetchData;
  bool searched = false;

  List graduationYearList = [];
  String? _passingYearValue;
  String? _branchId;

  String? _studentId;

  addingYear() {
    for (var i = 0; i <= 47; i++) {
      int year = DateTime.now().year+1;
      setState(() {
        year = year - i;
        graduationYearList.add(
          year.toString(),
        );
      });
    }
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

  @override
  void initState() {
    print('this is email ${widget.email}');
    _branchList = [];
    _students = [];
    print(widget.loginWith);
    _nameController.text = widget.name ?? '';
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
        FocusScope.of(context).unfocus();
        print(_students.length);
      },
      child: Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(
          backgroundColor: AppColor.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColor.black),
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
    return Stack(
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Form(
              key: fKey,
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
                  WidgetStyle.signUpName(title: 'Name*'),
                  nameTextField(),
                  const SizedBox(
                    height: 15,
                  ),
                  WidgetStyle.signUpName(title: 'Father\'s/Guardian\'s Name*'),
                  fatherNameTextField(),
                  const SizedBox(
                    height: 15,
                  ),
                  dateOfBirthTextField(),
                  const SizedBox(
                    height: 15,
                  ),
                  WidgetStyle.signUpName(title: "Branch Name*"),
                  _programName(),
                  const SizedBox(
                    height: 15,
                  ),
                  WidgetStyle.signUpName(title: "Passing out year*"),
                  _passingYear(),
                  const SizedBox(
                    height: 15,
                  ),
                  searched
                      ? _extendedBody()
                      : const SizedBox(
                    height: 18,
                  ),
                  Center(
                    child: CustomWidget.myButton(
                        isBorder: false,
                        name: searched ? "Sign Up" : "Search",
                        size: Size(100.w, 25.h),
                        onClicked: () {
                          if (fKey.currentState!.validate()) {
                            if (searched) {
                              if (showValue) {
                                if (_students.isEmpty) {
                                  manualSignUpCall();
                                } else {
                                  autoSignUpCall();
                                }
                              } else {
                                UIHelper.showErrorAlert(
                                    context, 'Please check privacy policy');
                              }
                            } else {
                              signUpSearch();
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

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Not found $url';

  Widget nameTextField() {
    return TextFormField(
      // // 18.h,
      textCapitalization: TextCapitalization.words,
      controller: _nameController,
      readOnly: searched ? true : false,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Name is required';
        } else if (value.length < 2) {
          return 'Enter minimum 2 letters';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: 13.sp),
        contentPadding: const EdgeInsets.only(top: 13, bottom: 3),
        isDense: true,
        hintText: 'Enter Name',
        hintStyle: TextStyle(color: AppColor.greyshade400),
        helperText: 'Kindly use your official name registered at school',
        helperStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: ScreenUtil().setSp(13),
        ),
        focusedBorder:  UnderlineInputBorder(
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

  Widget fatherNameTextField() {
    return TextFormField(
      // // 18.h,
      textCapitalization: TextCapitalization.words,
      controller: _fatherController,
      // enabled: searched ? false : true,
      textInputAction: TextInputAction.next,
      validator: (value) {
        return value!.isEmpty ? 'Guardian Name is required' : null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: 13.sp),
        hintText: 'Father\'s/Guardian\'s Name*',
        hintStyle: TextStyle(color: AppColor.greyshade400),
        contentPadding: const EdgeInsets.only(top: 13, bottom: 3),
        isDense: true,
        focusedBorder:  UnderlineInputBorder(
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

  Widget _programName() {
    return SizedBox(
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          errorStyle: TextStyle(fontSize: 13.sp),
          contentPadding: const EdgeInsets.only(top: 10),
          isDense: true,
        ),
        validator: (value) {
          return value == null ? 'Please select branch' : null;
        },
        items: _branchList.map((itemValue) {
          return DropdownMenuItem(
            value: itemValue.id,
            child: Text(
              itemValue.title ?? '',
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            _branchId = newValue.toString();
          });
        },
        isExpanded: true,
        value: _branchId,
        hint: Text(
          'Select Branch',
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

  Widget _extendedBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _students.isNotEmpty
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetStyle.signUpName(title: 'Verify your name*'),
            _studentList(),
          ],
        )
            : const SizedBox(),
        const SizedBox(
          height: 5,
        ),
        widget.password == "" ? emailTextField() : const SizedBox(),
        const SizedBox(
          height: 15,
        ),
        phoneTextField(),
        const SizedBox(
          height: 15,
        ),
        widget.password == ""
            ? Column(
          children: [
            passwordTextField(),
            const SizedBox(
              height: 15,
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
        SizedBox(
          height: 10.w,
        ),
      ],
    );
  }

  Widget _studentList() {
    return SizedBox(
      child: DropdownButtonFormField(
        // decoration: const InputDecoration(contentPadding: EdgeInsets.only(top: 28)),
        validator: (value) {
          if (_students.isNotEmpty) {
            return value == null ? 'Please select Student' : null;
          } else {
            return null;
          }
        },
        items: _students.map(
              (itemValue) {
            return DropdownMenuItem(
              value: itemValue.id,
              child: Text(
                itemValue.name,
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
        ).toList(),
        onChanged: (newValue) {
          setState(() {
            _studentId = newValue as String?;
          });
        },
        isExpanded: true,
        value: _studentId,
        hint: Text(
          'Select',
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

  emailTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetStyle.signUpName(title: 'Email*'),
        TextFormField(
          // 18.h,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            return value!.isEmpty
                ? 'Email is required'
                : validateEmail(value) == 1
                ? 'Invalid email'
                : null;
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
          enabled: searched && widget.email == 'email' ? false : true,
          // 18.h,
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
          // 18.h,
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

  Widget _passingYear() {
    return IgnorePointer(
      ignoring: searched ? true : false,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          errorStyle: TextStyle(fontSize: 13.sp),
          contentPadding: const EdgeInsets.only(top: 10),
          isDense: true,
        ),
        isExpanded: true,
        validator: (value) {
          return value == null ? 'Please select passing out year' : null;
        },
        items: graduationYearList.map((itemValue) {
          return DropdownMenuItem(
            // enabled: false,
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
      ),
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
          enabled: searched ? false : true,
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
    _branchList = await database.getAllBranches();
    addingYear();
  }

  Future<void> signUpSearch() async {
    print('singupSearch called.....');
    setState(() {
      wait = true;
    });
    var response = await ApiCalls.searchSignUp(
      fullName: _nameController.text,
      fatherName: _fatherController.text,
      dob: _dateOfBirthController.text,
      loginWith: widget.loginWith ?? '',
      graduationYear: _passingYearValue,
      branchId: _branchId,
    );
    setState(() {
      wait = false;
    });
    if (response is ErrorEntity) {
      print(response.message);
    } else {
      BossSearchEntity searchEntity = BossSearchEntity().fromJson(response);
      if (searchEntity.success == 1) {
        if (searchEntity.result!.isEmpty) {
          setState(() {
            _phoneController.text = widget.phone ?? '';
          });
          return signUpSearchDialogue(context: context);
        } else {
          setState(() {
            searched = true;
            _phoneController.text = widget.phone ?? '';
            _nameController.text = searchEntity.result!.first.firstName ?? '';
            _emailController.text = searchEntity.result!.first.email ?? '';
            // _branchId = searchEntity.result!.first!.branchId;
            // print('This is branch id bro **** $_branchId');
            _passingYearValue = searchEntity.result!.first.graduationYear;
            print('hello');
          });
          for (var element in searchEntity.result!) {
            _students.add(
              Student(element.firstName ?? '', element.userId ?? '',
                  element.phone ?? '', element.email ?? ''),
            );
            print('Student first name ${element.firstName}');
          }
          _phoneController.text = _students.first.phone;
          print('This is list student ${_students.first.name}');
          print('This is list email ${_students.first.email}');
          print('This is list student ${_students.first.phone}');
          print('This is list student userID ${_students.first.id}');
          _fatherController.text =
          searchEntity.result!.first.fatherName == null ||
              searchEntity.result!.first.fatherName == '' ||
              searchEntity.result!.first.fatherName == 'N/A'
              ? _fatherController.text
              : searchEntity.result!.first.fatherName ?? '';
        }
      }
    }
  }

  signUpSearchDialogue({context}) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return _dialog(context);
      },
    );
  }

  Widget _dialog(context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 16,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.close)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(bottom: 20.h),
              child: Text(
                'User not found',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: ScreenUtil().setSp(18),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _buttonsRow(context),
            const SizedBox(
              height: 20,
            ),
            _trouble(),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonsRow(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 30.h,
          child: OutlinedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 20.0)),
              side: MaterialStateProperty.all<BorderSide>(
                 BorderSide(color: AppColor.primaryColor),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  side:  BorderSide(
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
              minimumSize: MaterialStateProperty.all<Size>(Size(75.w, 25.h)),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Modify Search',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: ScreenUtil().setSp(11),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        SizedBox(
          height: 30.h,
          child: ElevatedButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(horizontal: 8.0)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    side:  BorderSide(
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
                minimumSize: MaterialStateProperty.all<Size>(Size(75.w, 25.h))),
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                searched = true;
              });
            },
            child: Text(
              'Manual Verification',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: ScreenUtil().setSp(11),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _trouble() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Having trouble? ',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(14),
              color: AppColor.black,
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
              // decoration: TextDecoration.underline,
              fontSize: ScreenUtil().setSp(14),
              color: AppColor.primaryColor,
              // fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  autoSignUpCall() async {
    UIHelper.apiCallingAlert(context);
    DeviceData device = DeviceData();
    await device.init();
    print('student id ${_students.first.id}');
    // if(widget.email != '' || widget.email != 'email'){
    //   setState(() {
    //     _emailController.text = widget.email!;
    //   });
    // }
    print('_emailController.text   ${_emailController.text}');

    var response = await ApiCalls.autoSignupBoss(
      userId: _students.first.id,
      email: _emailController.text,
      fullName: _nameController.text,
      fatherName: _fatherController.text,
      dob: _dateOfBirthController.text,
      phone: _phoneController.text,
      loginWith: widget.loginWith,
      graduationYear: _passingYearValue,
      password: _passwordController.text,
      status: 'A',
      branchId: _branchId,
      studentId: _studentId,
      source: device.platform,
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
      print('This is success broo *** ${loginEntity.success}');
      print(loginEntity.result!.isDeleted);
      print(loginEntity.result!.isVerified);
      if (loginEntity.success == 1) {
        if (loginEntity.result!.isDeleted == "N" &&
            loginEntity.result!.isVerified == "1") {
          AppConstants.bearerToken = loginEntity.result!.token ?? '';
          print(AppConstants.bearerToken);
          AppConstants.myId = loginEntity.result!.userId ?? '';
          AppConstants.userName = loginEntity.result!.firstName ?? '';
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

  manualSignUpCall() async {
    UIHelper.apiCallingAlert(context);
    DeviceData device = DeviceData();
    await device.init();
    var response = await ApiCalls.manualSignupBoss(
      email: _emailController.text,
      fullName: _nameController.text,
      fatherName: _fatherController.text,
      dob: _dateOfBirthController.text,
      loginWith: widget.loginWith,
      graduationYear: _passingYearValue,
      password: _passwordController.text,
      phone: _phoneController.text,
      branchId: _branchId,
      source: device.platform,
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
      print(response.success);
      UIHelper.showErrorAlert(context, response.message);
    } else {
      LoginEntityEntity loginEntity = LoginEntityEntity().fromJson(response);
      if (loginEntity.success == 1) {
        if (loginEntity.result!.isUpdate == "1" &&
            loginEntity.result!.isVerified == "1") {
          AppConstants.myId = loginEntity.result!.userId ?? '';
          AppConstants.userName = loginEntity.result!.firstName ?? '';
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
          localStorage.setString(
              'sharingLoc', loginEntity.result!.isSharingLoc ?? '');
          localStorage.setString('user_id', loginEntity.result!.userId ?? '');
          localStorage.setBool('is_first', false);

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
          Get.offUntil(GetPageRoute(page: () => const BottomNavigationScreen()),
                  (route) => false);
        } else {
          UIHelper.showSuccessAlert(context, loginEntity.message, () {
            Get.offUntil(GetPageRoute(page: () => const LoginScreen()),
                    (route) => false);
            setState(() {
              fromLogout = true;
            });
          });
        }
      }
    }
  }
}

//Model for students dropdown
class Student {
  String name;
  String id;
  String phone;
  String email;
  Student(this.name, this.id, this.phone, this.email);
}
