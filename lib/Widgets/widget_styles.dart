import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:iobm/utils/app_color.dart';

import '../utils/text_styles.dart';

class WidgetStyle {
  static semiBoldText({color, fontSize}) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      color: color,
      fontSize: fontSize,
    );
  }

  static TextStyle forgotTExtStyle({color, fontSize}) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
    );
  }

  static InputDecoration emailTextFieldDecoration() {
    return InputDecoration(
      errorStyle: TextStyle(fontSize: 12.sp),
      prefixIconConstraints: const BoxConstraints(
        minWidth: 23,
        maxHeight: 25,
      ),
      prefixIcon: Padding(
        padding: EdgeInsets.only(right: 10.0, bottom: 90.h),
        child: Icon(
          Icons.person_outline,
          color: AppColor.greyshade800,
          size: 20.h,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColor.primaryColor,
        ),
      ),
      hintStyle: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.greyshade400,),
      hintText: 'example@mail.com',
      isDense: true,
    );
  }

  static InputDecoration nameTextFieldDecoration({hint}) {
    return InputDecoration(
      errorStyle: TextStyle(fontSize: 13.sp),
      contentPadding: const EdgeInsets.only(bottom: 4.0, top: 15),
      counterText: "",
      prefixIconConstraints: const BoxConstraints(
        minWidth: 23,
        maxHeight: 25,
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColor.primaryColor),
      ),
      hintStyle: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.greyshade400,),
      hintText: hint,
      isDense: true,
    );
  }

  static InputDecoration suffixNameTextFieldDecoration({hint, sufIcon}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.only(top: 28),
      suffixIcon:
          Padding(padding: const EdgeInsets.only(top: 18), child: sufIcon),
      counterText: "",
      prefixIconConstraints: const BoxConstraints(
        minWidth: 23,
        maxHeight: 23,
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColor.primaryColor),
      ),
      hintStyle: CustomTextStyles.text14SemiBoldW600.copyWith(color: AppColor.greyshade400,),
      hintText: hint,
      isDense: true,
    );
  }

  static InputDecoration secNameTextFieldDecoration({hint}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.only(top: 30),
      suffixIcon: const Padding(
        padding: EdgeInsets.only(top: 22),
        child: Icon(
          Icons.arrow_drop_down_sharp,
          color: AppColor.primaryColor,
          size: 25,
        ),
      ),
      counterText: "",
      prefixIconConstraints: const BoxConstraints(
        minWidth: 23,
        maxHeight: 25,
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColor.primaryColor),
      ),
      hintStyle: TextStyle(
        fontSize: ScreenUtil().setSp(12),
        color: AppColor.greyshade400,
      ),
      hintText: hint,
      isDense: true,
    );
  }

  static InputDecoration thirnameTextFieldDecoration({hint}) {
    return InputDecoration(
      suffixIcon: const Padding(
        padding: EdgeInsets.only(top: 18),
        child: Icon(
          Icons.arrow_drop_down_sharp,
          size: 25,
          color: AppColor.primaryColor,
        ),
      ),
      contentPadding: const EdgeInsets.only(top: 30, bottom: 3),
      isDense: true,
      counterText: "",
      prefixIconConstraints: const BoxConstraints(
        minWidth: 23,
        maxHeight: 25,
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColor.primaryColor),
      ),
      hintStyle: TextStyle(
        fontSize: ScreenUtil().setSp(14),
        color: AppColor.greyshade400,
      ),
      hintText: hint,
    );
  }

  static InputDecoration passwordDecoration() {
    return InputDecoration(
      errorStyle: TextStyle(fontSize: 12.sp),
      prefixIconConstraints: const BoxConstraints(
        minWidth: 15,
        maxHeight: 30,
      ),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(
          right: 10.0,
        ),
        child: Icon(
          Icons.lock_outline,
          color: AppColor.greyshade800,
          size: 20.h,
        ),
      ),
      hintStyle: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.greyshade400,),
      hintText: '*******',
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColor.primaryColor),
      ),
      isDense: true,
    );
  }

  static Widget signUpName({title}) {
    return Text(
      title,
      style: TextStyle(
        fontSize: ScreenUtil().setSp(16),
        fontWeight: FontWeight.w600,
      ),
      // style: GoogleFonts.poppins(
      //   fontSize: ScreenUtil().setSp(14),
      //   fontWeight: FontWeight.bold,
      // ),
    );
  }

  static underLineTextStyle({color, fontSize}) {
    // return GoogleFonts.poppins(
    //   color: color,
    //   fontSize: fontSize,
    // );
    return TextStyle(
        // fontFamily: 'Nunito',
        color: color,
        fontSize: fontSize,
        decoration: TextDecoration.underline);
  }

  static underBoldLineTextStyle({color, fontSize, fontWeight}) {
    return TextStyle(
      // fontFamily: 'Nunito',
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: TextDecoration.underline,
    );
  }

  static containerDecoration({radius}) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: AppColor.greyshade600.withOpacity(.5)));
  }

  static postDecoration() {
    return BoxDecoration(
        border: Border(
            top: const BorderSide(
              width: 1,
              color: AppColor.grey,
            ),
            bottom: BorderSide(
              width: 1,
              color: AppColor.greyshade300,
            )));
  }

  static boldFont({fontsize}) {
    return TextStyle(
        // fontFamily: 'Nunito',
        fontWeight: FontWeight.w600,
        fontSize: fontsize);
  }

  static ts1() {
    return TextStyle(
        // fontFamily: 'Nunito',
        fontWeight: FontWeight.w600,
        fontSize: ScreenUtil().setSp(13));
  }

  static ts2() {
    return TextStyle(
        // fontFamily: 'Nunito',
        color: AppColor.black,
        fontSize: ScreenUtil().setSp(11));
  }

  static TextStyle ts3 = TextStyle(
    fontSize: ScreenUtil().setSp(14),
    fontWeight: FontWeight.bold,
  );

  static TextStyle ts4 = TextStyle(
    fontSize: ScreenUtil().setSp(11),
  );

  static TextStyle primaryTextStyle = TextStyle(
    fontSize: 15.sp,
    color: AppColor.primaryColor,
  );
}

dialogTitleText() {
  return const TextStyle(
      // fontFamily: 'Nunito',
      color: AppColor.white,
      fontSize: 15,
      fontWeight: FontWeight.w500);
}

boldTextStyle() {
  return TextStyle(
      // fontFamily: 'Nunito',
      fontSize: ScreenUtil().setSp(13),
      color: AppColor.greyshade500,
      fontWeight: FontWeight.w700);
}

TextStyle headingStyle2 = TextStyle(
    // fontFamily: 'Nunito',
    fontSize: ScreenUtil().setSp(15),
    fontWeight: FontWeight.w500,
    color: AppColor.white);
TextStyle profileText = TextStyle(
  // fontFamily: 'Nunito',
  fontSize: ScreenUtil().setSp(12),
  color: AppColor.white,
);
boldText() {
  return TextStyle(
    // fontFamily: 'Nunito',
    fontSize: 16.sp,
    // fontWeight: FontWeight.bold
  );
}

dvider() {
  return Column(
    children: [
      Container(
        height: 1,
        color: AppColor.greyshade500,
      ),
      SizedBox(
        height: 7.h,
      ),
    ],
  );
}

alumniAffairDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(10.r),
    border: Border.all(color: AppColor.primaryColor),
    color: AppColor.white,
  );
}

TextStyle filterTextstyle() {
  return TextStyle(
    fontSize: ScreenUtil().setSp(14),
    fontWeight: FontWeight.w600,
  );
  // return GoogleFonts.poppins(
  //   fontSize: ScreenUtil().setSp(14),
  //   fontWeight: FontWeight.w500,
  // );
}
snackBarRed(content) {
  return SnackBar(
    content: Text(content),
    backgroundColor: AppColor.redd,
  );
}