import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Widgets/custom_widgets.dart';
import '../../Widgets/widget_styles.dart';
import '../../utils/app_color.dart';
import '../../utils/app_images.dart';
import '../login_screen.dart';

class SignUpScreenSearch extends StatefulWidget {
  const SignUpScreenSearch({Key? key}) : super(key: key);

  @override
  _SignUpScreenSearchState createState() => _SignUpScreenSearchState();
}

class _SignUpScreenSearchState extends State<SignUpScreenSearch> {
  List programNameList = ['BSAP', 'BSSE', 'BSIT', 'BSCS'];
  String programName = 'BSAP';
  List passingYearList = ['FA2015', 'SP2016', 'FA2016', 'SP2017', 'FA2017'];
  String passingYear = 'FA2015';

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(
          backgroundColor: AppColor.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColor.black),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image(
                  image: const AssetImage(AppImages.alumniLogo),
                  height: 120.w,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              WidgetStyle.signUpName(title: 'Full Name*'),
              nameTextField(),
              const SizedBox(
                height: 25,
              ),
              WidgetStyle.signUpName(title: 'Father/Guardian Name*'),
              const SizedBox(
                height: 25,
              ),
              WidgetStyle.signUpName(title: "Program Name*"),
              _programName(),
              const SizedBox(
                height: 25,
              ),
              WidgetStyle.signUpName(title: "Passing Year*"),
              _passingYear(),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: CustomWidget.myButton(
                  isBorder: false,
                  name: "Search",
                  size: const Size(100, 30),
                  onClicked: () {},
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              _signInText(),
              const SizedBox(
                height: 8,
              ),
              _contactUsText(),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        )),
      ),
    );
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
        //  contentPadding: const EdgeInsets.only(right: 20, bottom: 0),
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

  _programName() {
    return SizedBox(
      height: 40,
      child: DropdownButtonFormField(
        items: programNameList.map((itemValue) {
          return DropdownMenuItem(
            value: itemValue,
            child: Text(itemValue),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            programName = newValue.toString();
          });
        },
        hint: Text(programName),
        iconEnabledColor: AppColor.redshade900,
        style: const TextStyle(
          // //Family: 'Nunito',
          color: AppColor.black,
        ),
      ),
    );
  }

  _passingYear() {
    return SizedBox(
        height: 40,
        child: DropdownButtonFormField(
          items: passingYearList.map((itemValue) {
            return DropdownMenuItem(
              value: itemValue,
              child: Text(itemValue),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              passingYear = newValue.toString();
            });
          },
          hint: Text(passingYear),
          iconEnabledColor: AppColor.redshade900,
          style: const TextStyle(
              // //Family: 'Nunito',
              color: AppColor.black),
        ));
  }

  _signInText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Already have an account?',
            style: WidgetStyle.forgotTExtStyle(
                fontSize: 13.0, color: AppColor.greyshade800)),
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => const LoginScreen()));
            },
            child: Text(
              'Sign In',
              style: WidgetStyle.underLineTextStyle(
                  color: AppColor.primaryColor, fontSize: 13.0),
            )),
      ],
    );
  }

  _contactUsText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Having trouble?',
            style: WidgetStyle.forgotTExtStyle(
                color: AppColor.greyshade800, fontSize: 13.0)),
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
          onTap: null,
          child: Text(
            'Contact Us',
            style: WidgetStyle.forgotTExtStyle(
                color: AppColor.primaryColor, fontSize: 13.0),
          ),
        ),
      ],
    );
  }
}
