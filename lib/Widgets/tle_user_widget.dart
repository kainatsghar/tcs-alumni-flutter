import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Views/Chat/send_invation_screen.dart';
import '../utils/app_color.dart';
import '../utils/app_constants.dart';
import '../utils/app_images.dart';
class TleUserWidget extends StatefulWidget {
  String? image;
  String? name;
  String? profession;
  String? year;
  String? isMentor;
  String? place;
  String? chatStatus;
  String? id;
  TleUserWidget({
    this.image,
    this.name,
    this.profession,
    this.year,
    this.place,
    this.isMentor,
    this.chatStatus,
    this.id,
    Key? key}) : super(key: key);

  @override
  _TleUserWidgetState createState() => _TleUserWidgetState();
}

class _TleUserWidgetState extends State<TleUserWidget> {
  Function()? messageTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: AppColor.white,
        border: Border(
          bottom: BorderSide(
            color: AppColor.black12,
          ),
        ),
      ),
      // padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 6.w,
          ),
          _profilepicture(widget.image!),
          SizedBox(
            width: 12.w,
          ),
          Expanded(
            child: _userinfo(widget.name!, widget.profession!, widget.year!),
          ),
          SizedBox(
            width: 12.w,
          ),
          _designation(widget.place ?? ''),
          SizedBox(
            width: 6.w,
          ),
        ],
      ),
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
                errorWidget: (context, url, error) => const Image(
                  image: AssetImage(
                    AppImages.profile,
                  ),
                ),
                progressIndicatorBuilder:
                    (context, url, downloadProgress) =>
                    CircularProgressIndicator(
                        value: downloadProgress.progress),
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

  _userinfo(String name, String profession, String year) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(12),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        profession != " , "
            ? Text(
          profession,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(12),
          ),
        )
            : Container(),
        const SizedBox(
          height: 4,
        ),
        Text( year,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(12),
            color: AppColor.grey,
          ),
        )
      ],
    );
  }

  _designation(place) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 7.h,
          ),
          GestureDetector(

            onTap: () {
              print(widget.chatStatus);
              print(widget.id);
              print(widget.image);
              print(widget.name);
              var a = Get.to(
                    () => ChatInvitationScreen(
                  name: widget.name,
                  image: widget.image,
                  receiverId: widget.id,
                ),
              );
            },
            child: Container(
              height: 25.w,
              width: 25.w,
              color: AppColor.transparent,
              child: widget.chatStatus == ""
                  ? SvgPicture.asset(
                AppImages.chatSend,
                color: AppColor.primaryColor,
              )
                  : widget.chatStatus == AppConstants.INVITE ||
                  widget.chatStatus == AppConstants.REJECT
                  ? SvgPicture.asset(
                AppImages.chatPending,
                color: AppColor.primaryColor,
              )
                  : SvgPicture.asset(
                AppImages.chatAccept,
                color: AppColor.primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Text(
            place == "null" ? "" : place,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(12),
              color: AppColor.black45,
            ),
          )
        ],
      ),
    );
  }
}
