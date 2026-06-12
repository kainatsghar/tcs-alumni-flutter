import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/strings.dart';

class BusinessCardScreen extends StatefulWidget {
  const BusinessCardScreen({Key? key}) : super(key: key);

  @override
  _BusinessCardScreenState createState() => _BusinessCardScreenState();
}

class _BusinessCardScreenState extends State<BusinessCardScreen> {
  @override
  Widget build(BuildContext buildContext) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.primaryColor,
            titleSpacing: 0,
            shape: Border(bottom: BorderSide(color: Colors.yellow, width: 4.w)),
            leading: const Padding(
              padding:  EdgeInsets.all(8.0),
              child: Image(image: AssetImage(AppImages.profile)),
            ),
            centerTitle: true,
            title: const Text('Digital Business Card',
                style:
                    TextStyle(
                        // //Family: 'Nunito',
                        fontWeight: FontWeight.w600
                    ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _profile(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _button(Strings.shareInfo),
                  SizedBox(
                    width: 5.w,
                  ),
                  _button(Strings.scanInfo),
                ],
              )
            ],
          )),
    );
  }

  _profile() {
    return Container(
      padding: EdgeInsets.only(top: 15.h, left: 25.w, right: 10.w),
      height: 150.h,
      color: AppColor.redshade900,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _profilepicture(),
          SizedBox(width: 20.w),
          _personalinfo(),
        ],
      ),
    );
  }

  _profilepicture() {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          //profile image
          backgroundImage: AssetImage(AppImages.profile),
          radius: 29.r,
        ),
        Positioned(
            //position for button background
            top: 38.h,
            left: 38.h,
            child: //Gesture Detector
                CircleAvatar(
              backgroundColor: AppColor.white,
              radius: 9.r,
            )),
        Positioned(
            //position for button
            top: 24.h,
            left: 24.h,
            child: IconButton(
              onPressed: null,
              icon: Icon(Icons.camera_enhance, color: AppColor.black),
              iconSize: 10.h,
            ))
      ],
    );
  }

  _personalinfo() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Name
          Text('Jasmine Rivera',
              style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColor.white,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 6.h),
          //Email
          Text('a@a.com',
              style: TextStyle(fontSize: 13.sp, color: AppColor.white)),
          SizedBox(height: 6.h),
          //Employee ID
          Text('Alumni ID. 19',
              style: TextStyle(fontSize: 13.sp, color: AppColor.white)),
          SizedBox(height: 6.h),
          //Employee rank
          Text('BD Executive',
              style: TextStyle(fontSize: 13.sp, color: AppColor.white)),
          SizedBox(height: 6.h),
          //Company name
          Text('VIION', style: TextStyle(fontSize: 13.sp, color: AppColor.white)),
          SizedBox(height: 6.h),
          //Address
          Text('18-Hazari',
              style: TextStyle(fontSize: 13.sp, color: AppColor.white)),
        ]);
  }

  _button(
    String title,
  ) {
    return ElevatedButton(
        onPressed: null,
        child: Text(title,
            style: TextStyle(
                // //Family: 'Nunito',
                color: AppColor.white, fontSize: 13.sp)),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    side: BorderSide(color: AppColor.redshade900))),
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColor.redshade900),
            minimumSize: MaterialStateProperty.all<Size>(Size(75.w, 23.h))));
  }
}
