import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/Chat/chat_screen.dart';
import 'package:iobm/Views/Chat/messages.dart';
import 'package:iobm/Views/Chat/send_invation_screen.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';

import '../utils/text_styles.dart';

class UserWidget extends StatefulWidget {
  String? image;
  String? name;
  String? organization;
  String? designation;
  String? year;
  String? isMentor;
  String? place;
  String? chatStatus;
  String? id;

  UserWidget({
    Key? key,
    this.image,
    this.name,
    this.organization,
    this.designation,
    this.year,
    this.place,
    this.isMentor,
    this.chatStatus,
    this.id,
  }) : super(key: key);

  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  Function()? messageTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 140,
          padding:  EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),

          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(7),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2), // Use opacity so it blends smoothly
                blurRadius: 3,                    // Softens the shadow
                spreadRadius: 0.5,                   // Extends the shadow outwards
                offset: Offset(0, 0),                // Position: (x = horizontal, y = vertical)
              ),
            ],        // border: Border.all(
            //   width: 1,
            //     color: AppColor.black12,
            //
            // ),
          ),
          // padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(
              //   width: 6.w,
              // ),
              _profilepicture(widget.image!),
              SizedBox(
                width: 12.w,
              ),
              Center(
                child:
                _userinfo(widget.name!, widget.organization ?? '',
                    widget.designation ?? '', widget.year!,widget.place),
              ),

              SizedBox(
                height: 20.h,
              ),


            ],
          ),
        ),
        Positioned(
          bottom: 7,
          left: 0,
          right: 0,
          child:

        _designation(widget.place ?? ''),
    )
      ],
    );
  }

  _profilepicture(String image) {
    return SizedBox(
      height: 50.h,
      width: 50.w,
      child: Stack(
        children: [
          SizedBox(
            height: 50.h,
            width: 50.w,
            child: CircleAvatar(
              backgroundColor: AppColor.white,
              child: image == ''
                  ? Image(
                      image: const AssetImage(AppImages.profile),
                      width: 50.w,
                      height: 50.h,
                    )
                  : CachedNetworkImage(
                      imageUrl: image,
                      imageBuilder: (context, imageProvider) => Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Image(
                        image: const AssetImage(AppImages.profile),
                        width: 50.w,
                        height: 50.h,
                      ),
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                        value: downloadProgress.progress,
                      ),
                    ),
            ),
          ),
          widget.isMentor == '1'
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 16.h,
                    width: 16.w,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImages.mentoricon),
                        ),
                        shape: BoxShape.circle),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  _userinfo(String name, String organization, String designation, String year,String? place) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          name,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: CustomTextStyles.text14SemiBoldW600,
        ),
        const SizedBox(
          height: 0,
        ),
        if (designation != '' || organization != '')
          Text('$designation,$organization',style: TextStyle(color: AppColor.grey,fontSize: 13.sp),),
        AppConstants.appName != 'TLE' ? Column(
          children: [
            const SizedBox(
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Class of $year',
                  style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.black,fontSize: 10),
                ),

                Row(
                  children: [
                    Icon(Icons.location_on_outlined,color: AppColor.black45,size: 10,),
                    Text(
                      place! == "null" ? "" : place,
                      style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.black45,fontSize: 10),
                    ),
                  ],
                ),
              ],
            )
          ],
        ) : const SizedBox(),
      ],
    );
  }

  _designation(place) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // SizedBox(
          //   height: 7.h,
          // ),
          // Text(
          //   place == "null" ? "" : place,
          //   style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.black45,),
          // ),
          // SizedBox(
          //   height: 7.h,
          // ),

          GestureDetector(
            onTap: () {
              var a = Get.to(
                () => ChatInvitationScreen(
                  name: widget.name,
                  image: widget.image,
                  receiverId: widget.id,
                ),
              );
            },
            child: Container(
              // height: 25.w,
              // width: 25.w,

              decoration: BoxDecoration(
                color:AppColor.white,
                // widget.chatStatus == ""||widget.chatStatus == AppConstants.REJECT?AppColor.primaryColor:widget.chatStatus == AppConstants.INVITE ?Colors.deepOrange:AppColor.greenColor,
                borderRadius: BorderRadius.circular(3.r),
                border: Border.all(
                  color: widget.chatStatus == ""||widget.chatStatus == AppConstants.REJECT?AppColor.primaryColor:widget.chatStatus == AppConstants.INVITE ?Colors.deepOrange:AppColor.greenColor,
                )
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 1,bottom: 3),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 2
                      ),
                      child: SizedBox(
                        height: 18,
                        child:widget.chatStatus == ""
                          ? SvgPicture.asset(
                              AppImages.chatSend2,
                              color:AppColor.primaryColor,
                              // color: AppColor.white,
                            )
                          : widget.chatStatus == AppConstants.INVITE ||
                                  widget.chatStatus == AppConstants.REJECT
                              ? SvgPicture.asset(
                                  AppImages.chatPending2,
                                  color: Colors.deepOrange,
                                  // color: AppColor.white,
                                )
                              : SvgPicture.asset(
                                  AppImages.chatAccept2,
                                  // color: AppColor.white,
                                  color: AppColor.greenColor,
                                ),
                                  ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6,bottom: 0),
                      child: Text(
                        widget.chatStatus == ""||widget.chatStatus == AppConstants.REJECT?"Connect":widget.chatStatus == AppConstants.INVITE ?"Pending":'Chat   ',
                        style: CustomTextStyles.text12RegularW400.copyWith(
                            color: widget.chatStatus == ""||widget.chatStatus == AppConstants.REJECT?AppColor.primaryColor:widget.chatStatus == AppConstants.INVITE ?Colors.deepOrange:AppColor.greenColor,
                          // color: AppColor.white
                          ),
                      ),
                    ),
                  ],
                ),
              )
            ),
          ),

        ],
      ),
    );
  }
}
