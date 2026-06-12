import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_images.dart';

class AlumniCard extends StatefulWidget {
  @override
  _AlumniCardState createState() => _AlumniCardState();
}

class _AlumniCardState extends State<AlumniCard> {
  String mail = 'example@mail.com';
  TextStyle ts =
      TextStyle(
          // //Family: 'Nunito',
          fontSize: 13.sp, color: AppColor.black);
  TextStyle ts1 = TextStyle(
      // //Family: 'Nunito',
      fontSize: 13.sp, color: AppColor.redshade900);
  TextStyle ts2 = TextStyle(
      // //Family: 'Nunito',
      fontSize: 13.sp,
      color: AppColor.redshade900,
      decoration: TextDecoration.underline);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(
          shape: Border(
            bottom: BorderSide(color: AppColor.black, width: 4.w),
          ),
          elevation: 4,
          backgroundColor: AppColor.primaryColor,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              //profile image
              backgroundImage: AssetImage(AppImages.profile),
              radius: 5.r,
            ),
          ),
          title: Text('Alumni Card',
              style: TextStyle(
                  // //Family: 'Nunito',
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp)),
          actions: <Widget>[
            Padding(padding: EdgeInsets.all(15.0), child: _button()),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.sp),
            color: AppColor.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'IoBM Alumni Card Form (Responses)',
                  style: TextStyle(
                      // //Family: 'Nunito',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Welcome back to IoBM!',
                  style: ts,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'Your Alumni Card will give you access to:',
                  style: ts,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  '1. IoBM facilities including Alumni Office, Library, Sports, Student Center, and other facilities',
                  style: ts,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text:
                          '2. IoBM Alumni Brand Partners discount e.g. Avari Golden Card (15%), FHS(15%), Liberty Books Online Store (15%) and many more, for details visit: ',
                      style: TextStyle(
                          // //Family: 'Nunito',
                          fontSize: 13.sp,
                          color: AppColor.black)),
                  TextSpan(text: 'alumni.iobm.edu.pk', style: ts2)
                ])),
                Text(
                  '3. Vouch365 App with 1200+ brands offer',
                  style: ts,
                ),
                Text(
                  '4. Exclusive event and other activities invite',
                  style: ts,
                ),
                Text(
                  '5. Volunteer Groups such as Cycling, Social Work, etc.',
                  style: ts,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'Before filling this form please make sure that:',
                  style: ts,
                ),
                Text(
                  '1. You are a graduate of any degree/ academic program of the Institute of Business Management (IoBM), Karachi.',
                  style: ts,
                ),
                Text(
                  '2. You have scanned your passport size photo with a white or blue background.',
                  style: ts,
                ),
                Text(
                  '3. You have scanned copy of your valid CNIC',
                  style: ts,
                ),
                Text(
                  '4. You have scanned copy of payment (Alumni Card Fee: PKR 650/-) in either of the following forms:',
                  style: ts,
                ),
                Text(
                  'a. to Alumni Office, IoBM, Korangi Creek, Karachi.',
                  style: ts,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'b. Bank Deposit - email receipt to ',
                      style: TextStyle(
                          // //Family: 'Nunito',
                          fontSize: 13.sp,
                          color: AppColor.black)),
                  TextSpan(text: 'alumni.office@iobm.edu.pk', style: ts2),
                  TextSpan(
                      text: ' (with your name and student ID)',
                      style: TextStyle(
                          // //Family: 'Nunito',
                          fontSize: 13.sp,
                          color: AppColor.black)),
                ])),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'Bank: Standard Chartered Bank',
                  style: ts,
                ),
                Text(
                  'Account Title: Institute of Business Management',
                  style: ts,
                ),
                Text(
                  'Account No: 18326020801',
                  style: ts,
                ),
                Text(
                  'Al Tijarah Islamic Center Branch',
                  style: ts,
                ),
                Text(
                  'Branch Code 182',
                  style: ts,
                ),
                SizedBox(
                  height: 12.h,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text:
                          'If you choose to pay online, kindly send the screenshot once payment is made to ',
                      style: TextStyle(
                          // //Family: 'Nunito',
                          fontSize: 13.sp,
                          color: AppColor.black)),
                  TextSpan(text: 'alumni.office@iobm.edu.pk', style: ts2),
                  TextSpan(
                      text: ' (with your name and student ID)',
                      style: TextStyle(
                          // //Family: 'Nunito',
                          fontSize: 13.sp,
                          color: AppColor.black)),
                ])),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'If you want us to courier your alumni card on your postal address, kindly pay Rs. 100/- extra for courier service.',
                  style: ts,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'To find out more:',
                  style: ts,
                ),
                Text(
                  'IoBM Alumni Office',
                  style: ts,
                ),
                Text(
                  'Korangi Creek, Karachi',
                  style: ts,
                ),
                Text(
                  'P: (+92-21) 35090961-67 (Ext. 703 & 221)',
                  style: ts1,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'drop an email to ',
                      style: TextStyle(
                          // //Family: 'Nunito',
                          fontSize: 13.sp,
                          color: AppColor.black)),
                  TextSpan(text: 'alumni.office@iobm.edu.pk', style: ts2),
                  TextSpan(
                      text: ' or visit ',
                      style: TextStyle(
                          // //Family: 'Nunito',
                          fontSize: 13.sp,
                          color: AppColor.black)),
                  TextSpan(text: 'alumni.iobm.edu.pk', style: ts2),
                ])),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text:
                          'The name and photo associated with your Google account will be recorded when you upload files and submit this form. ',
                      style: TextStyle(
                          // //Family: 'Nunito',
                          fontSize: 13.sp,
                          color: AppColor.black)),
                  TextSpan(
                      text: 'Not $mail? ',
                      style: TextStyle(
                          // //Family: 'Nunito',
                          fontSize: 13.sp,
                          color: AppColor.black,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: 'Switch',
                      style: TextStyle(
                          // //Family: 'Nunito',
                          fontSize: 13.sp,
                          color: AppColor.black))
                ])),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _button() {
    return ElevatedButton(
        onPressed: () {},
        child: Text(
          'Apply for Card',
          style: TextStyle(
              // //Family: 'Nunito',
              color: AppColor.white, fontSize: 13.sp),
        ),
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(horizontal: 8.0)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: AppColor.white))),
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColor.redshade900),
            minimumSize: MaterialStateProperty.all<Size>(Size(20.w, 20.h))));
  }
}
