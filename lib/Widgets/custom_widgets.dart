import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:iobm/Widgets/dialogues/app_bar_checkin.dart';
import 'package:iobm/Widgets/dialogues/feelings_dialog.dart';
import 'package:iobm/Widgets/dialogues/otp_dialog.dart';

import 'package:iobm/Widgets/widget_styles.dart';

import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/text_styles.dart';

import 'dialogues/add_education_dialog.dart';
import 'dialogues/add_experience_dialog.dart';
import 'dialogues/facebookurl.dart';
import 'dialogues/linkedin_url_dialog.dart';
import 'dialogues/success_dialog.dart';
import 'gps_dialogue.dart';

class CustomWidget {
  static Widget myButton(
      {String? name, Size? size, bool? isBorder, Function()? onClicked}) {
    return SizedBox(
      height: 30.h,
      child: ElevatedButton(
        onPressed: onClicked!,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            name!,
            style: CustomTextStyles.text14SemiBoldW600.copyWith(color: isBorder! ? AppColor.primaryColor : AppColor.white,),
            // style: GoogleFonts.poppins(
            //   color: isBorder! ? AppColor.primaryColor : AppColor.white,
            //   fontSize: ScreenUtil().setSp(14),
            // ),
          ),
        ),
        style: ButtonStyle(
          padding:
              MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.r),
                  side: const BorderSide(color: AppColor.primaryColor))),
          backgroundColor: MaterialStateProperty.all<Color>(
              isBorder ? AppColor.white : AppColor.primaryColor),
          minimumSize: MaterialStateProperty.all<Size>(Size(120.w, 30.h)),
        ),
      ),
    );
  }

  static Widget linkBtn({String? title, VoidCallback? onclick}) {
    return GestureDetector(
      onTap: onclick,
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
            child: Text(
              title!,
              style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.white,),
            ),
          ),
        ),
      ),
    );
  }

  static reportAppBar(
      {context, title, actionText, Function()? onSubmitPressed}) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.keyboard_backspace,
          color: AppColor.white,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            // //Family: 'Nunito',
            fontWeight: FontWeight.w600,
            fontSize: 20.sp),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
          child: GestureDetector(
            onTap: onSubmitPressed,
            child: Text(
              actionText,
              style: const TextStyle(
                  // //Family: 'Nunito',
                  color: AppColor.white),
            ),
          ),
        )
      ],
    );
  }

  static Widget dialogButton(
      {String? name, Function()? onClicked, bool? isBorderColor}) {
    return Container(
      child: ElevatedButton(
          onPressed: onClicked!,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Text(
              name!,
              style: CustomTextStyles.text12RegularW400.copyWith(color: isBorderColor! ? AppColor.primaryColor : AppColor.white,),
            ),
          ),
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.zero),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: AppColor.primaryColor))),
              backgroundColor: MaterialStateProperty.all<Color>(
                  isBorderColor ? AppColor.white : AppColor.primaryColor),
              minimumSize: MaterialStateProperty.all<Size>(Size(65.w, 20.h)))),
    );
  }

  static Widget secDialogButton(
      {String? name, Function()? onClicked, bool? isBorderColor}) {
    return Container(
      child: ElevatedButton(
          onPressed: onClicked!,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: Text(
              name!,
              style: CustomTextStyles.text12RegularW400.copyWith(color: isBorderColor! ? AppColor.primaryColor : AppColor.white,),
            ),
          ),
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.zero),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: AppColor.primaryColor))),
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColor.backGroundColor),
              minimumSize: MaterialStateProperty.all<Size>(Size(65.w, 20.h)))),
    );
  }

  static deleteDialogue({context}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return const DeleteDialogue();
        });
  }

  static linkedInDialogue({context, url}) {
    print("Dialog LinkedIn Url= $url");
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return LinkedInDialog(
            linkedInUrl: url,
          );
        });
  }

  static facebookDialogue({context, url}) {
    print("Dialog Facebook Url= $url");
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return FacebookUrl(
            facebookUrl: url,
          );
        });
  }

  static applyForCardDialog({context, img, name, id, email}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return ApplyForCard(
            img: img,
            name: name,
            email: email,
            id: id,
          );
        });
  }

  static addExperienceDialogue(
      {context,
      check,
      experienceId,
      designation,
      company,
      startYear,
      endYear,
      logoChange,
      industry}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddExperienceDialog(
          check,
          experienceId,
          designation,
          company,
          startYear,
          endYear,
          logoChange,
          industry,
        );
      },
    );
  }

  static addEducationDialogue({
    context,
    check,
    educationId,
    institute,
    degree,
    startYear,
    endYear,
  }) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AddEducationDialog(
            check,
            educationId.toString(),
            degree,
            institute,
            startYear,
            endYear,
          );
        });
  }

  static checkInDialog({context}) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const CheckInDialog();
        });
  }

  static otpDialog({context, phone, check}) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return OTPDialog(
            phone: phone,
            check: check,
          );
        });
  }

  static editPostAppbar({context, Function()? onPressed}) {
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const ImageIcon(
          AssetImage(AppImages.arrowbackwhite),
        ),
      ),
      centerTitle: true,
      title: Text(
        "Post",
        style: TextStyle(
            // fontFamily: 'Nunito',
            fontWeight: FontWeight.w600,
            fontSize: 20.sp),
      ),
      actions: [
        IconButton(
            onPressed: onPressed!,
            icon: const Icon(
              Icons.check,
              color: AppColor.white,
            )),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }

  static profilePicture({imgUrl, Function()? onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            child: CachedNetworkImage(
              imageUrl: imgUrl ?? '',
              imageBuilder: (context, imageProvider) => Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.white,
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => CircleAvatar(
                //profile image
                backgroundColor: AppColor.white,
                backgroundImage: const AssetImage(AppImages.profile),
                radius: 25.r,
              ),
            ),
            radius: 33.r,
            backgroundColor: AppColor.black,
          ),
          // Positioned(
          //     //position for button background
          //     top: 41.h,
          //     left: 41.h,
          //     child: //Gesture Detector
          //         CircleAvatar(
          //       backgroundColor: AppColor.white,
          //       radius: 9.r,
          //     )),
          // Positioned(
          //     //position for button
          //     top: 26.5.h,
          //     left: 26.5.h,
          //     child: Center(
          //       child: IconButton(
          //         onPressed: null,
          //         icon: const Icon(Icons.camera_enhance, color: AppColor.black),
          //         iconSize: 12.h,
          //       ),
          //     ))
        ],
      ),
    );
  }

  static personalInfo({
    String? fname,
    String? lname,
    String? email,
    String? designation,
    String? userID,
    String? organization,
    String? city,
    String? graduationYear,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0.h),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Name
            Text('$fname $lname', style: headingStyle2),
            SizedBox(height: 4.h),
            //Email
            Text(email ?? '-', style: profileText),
            SizedBox(height: 4.h),
            //Employee ID
            Text('Alumni ID. $userID', style: profileText),
            SizedBox(height: 4.h),
            //Employee rank
            Text(designation ?? '-', style: profileText),
            SizedBox(height: 4.h),
            //Company name
            Text(organization ?? '-', style: profileText),
            SizedBox(height: 4.h),
            //Address
            Text(city ?? '-', style: profileText),
            SizedBox(height: 4.h),
            //Address
            Text(graduationYear ?? '-', style: profileText),
            SizedBox(
              height: 4.h,
            ),
            // userID == '1'
            //     ? CustomWidget.myButton(
            //         size: Size(60.w, 20.h),
            //         isBorder: true,
            //         name: 'connect',
            //         onClicked: () {})
            //     : Row(
            //         children: [
            //           CustomWidget.myButton(
            //               size: Size(60.w, 20.h),
            //               isBorder: true,
            //               name: 'accept',
            //               onClicked: () {}),
            //           CustomWidget.myButton(
            //               size: Size(60.w, 20.h),
            //               isBorder: true,
            //               name: 'reject',
            //               onClicked: () {}),
            //         ],
            //       )
          ]),
    );
  }

  static Widget addTitle({title, icon, userID, onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: CustomTextStyles.text14SemiBoldW600,
          ),
          userID == AppConstants.myId
              ? IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    icon,
                    color: AppColor.black,
                    size: 20.w,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  static experienceImage({String? logoImage, bool? isEducation}) {
    return CachedNetworkImage(
      imageUrl: logoImage ?? '',
      imageBuilder: (context, imageProvider) => Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: imageProvider, fit: BoxFit.contain),
        ),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => Container(
        width: 40.0,
        height: 40.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Image.asset(
            isEducation! ? AppImages.education : AppImages.experience),
      ),
    );
  }

  static successDialogue({context, icon, title, dText, btnText, workId}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SucessDialog(
            icon: icon,
            title: title,
            dText: dText,
            btnText: btnText,
            id: workId,
          );
        });
  }

  /// Feelings Dialog
  static feelingsDialog({context}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return const FeelingsDialog();
        });
  }
}
