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


class Userwidget2 extends StatefulWidget {
 final String? image;
 final String? name;
 final String? profession;
 final String? year;
 final String? head;
 final String? place;
 final String? chatStatus;
 final String? id;
  const Userwidget2({
  this.image,
    this.name,
    this.profession,
    this.year,
    this.place,
    this.head,
    this.chatStatus,
    this.id,
  Key? key}) : super(key: key);

  @override
  _Userwidget2State createState() => _Userwidget2State();
}

class _Userwidget2State extends State<Userwidget2> {
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
            child: _userinfo(widget.name!, widget.profession!, widget.year!, widget.head!),
          ),
          SizedBox(
            width: 12.w,
          ),
          // _designation(widget.place ?? ''),
          SizedBox(
            width: 6.w,
          ),
        ],
      ),
    );
  }


  _profilepicture(String image) {
    return Container(
      height: 50.h,
      width: 50.w,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Image(
          image: AssetImage(image),
          width: 50.w,
          height: 50.h,
        ),
      ),
    );
  }

  _userinfo(String name, String profession, String address, String head) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(12),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(head, style: TextStyle(color: AppColor.primaryColor,fontSize: 12.sp),),
          ],
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
        Text(
          address,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(12),
            color: AppColor.grey,
          ),
        )
      ],
    );
  }

  // _designation(place) {
  //   return Container(
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       crossAxisAlignment: CrossAxisAlignment.end,
  //       children: [
  //         SizedBox(
  //           height: 7.h,
  //         ),
  //         Container(
  //           height: 25.w,
  //           width: 25.w,
  //           color: AppColor.transparent,
  //           child: widget.chatStatus == ""
  //               ? SvgPicture.asset(
  //             AppImages.chatSend,
  //             color: AppColor.primaryColor,
  //           )
  //               : widget.chatStatus == AppConstants.INVITE ||
  //               widget.chatStatus == AppConstants.REJECT
  //               ? SvgPicture.asset(
  //             AppImages.chatPending,
  //             color: AppColor.primaryColor,
  //           )
  //               : SvgPicture.asset(
  //             AppImages.chatAccept,
  //             color: AppColor.primaryColor,
  //           ),
  //         ),
  //         SizedBox(
  //           height: 7.h,
  //         ),
  //         Text(
  //           place == "null" ? "" : place,
  //           style: TextStyle(
  //             fontSize: ScreenUtil().setSp(12),
  //             color: AppColor.black45,
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}



// class UserWidget2 extends StatefulWidget {
//   String? image;
//   String? name;
//   String? profession;
//   String? year;
//   String? isMentor;
//   String? place;
//   String? chatStatus;
//   String? id;
//
//   UserWidget2({
//     Key? key,
//     this.image,
//     this.name,
//     this.profession,
//     this.year,
//     this.place,
//     this.isMentor,
//     this.chatStatus,
//     this.id,
//   }) : super(key: key);
//
//   @override
//   State<UserWidget2> createState() => _UserWidgetState();
// }
//
// class _UserWidgetState extends State<UserWidget2> {
//   Function()? messageTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       decoration: const BoxDecoration(
//         color: AppColor.white,
//         border: Border(
//           bottom: BorderSide(
//             color: AppColor.black12,
//           ),
//         ),
//       ),
//       // padding: EdgeInsets.symmetric(horizontal: 8.w),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           SizedBox(
//             width: 6.w,
//           ),
//           _profilepicture(widget.image!),
//           SizedBox(
//             width: 12.w,
//           ),
//           Expanded(
//             child: _userinfo(widget.name!, widget.profession!, widget.year!),
//           ),
//           SizedBox(
//             width: 12.w,
//           ),
//           _designation(widget.place ?? ''),
//           SizedBox(
//             width: 6.w,
//           ),
//         ],
//       ),
//     );
//   }
//
//   _profilepicture(String image) {
//     return SizedBox(
//       height: 50.h,
//       width: 50.w,
//       child: Stack(
//         children: [
//           SizedBox(
//             height: 50.h,
//             width: 50.w,
//             child: CircleAvatar(
//               child: image == ''
//                   ? Image(
//                 image: const AssetImage(AppImages.profile),
//                 width: 50.w,
//                 height: 50.h,
//               )
//                   : CachedNetworkImage(
//                 imageUrl: image,
//                 imageBuilder: (context, imageProvider) => Container(
//                   height: 50.h,
//                   width: 50.w,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     image: DecorationImage(
//                       image: imageProvider,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 progressIndicatorBuilder:
//                     (context, url, downloadProgress) =>
//                     CircularProgressIndicator(
//                         value: downloadProgress.progress),
//               ),
//             ),
//           ),
//           widget.isMentor == '1'
//               ? Align(
//             alignment: Alignment.bottomRight,
//             child: Container(
//               height: 16.h,
//               width: 16.w,
//               decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(AppImages.mentoricon),
//                   ),
//                   shape: BoxShape.circle),
//             ),
//           )
//               : Container(),
//         ],
//       ),
//     );
//   }
//
//   _userinfo(String name, String profession, String year) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           name,
//           style: TextStyle(
//             fontSize: ScreenUtil().setSp(12),
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(
//           height: 4,
//         ),
//         profession != " , "
//             ? Text(
//           profession,
//           style: TextStyle(
//             fontSize: ScreenUtil().setSp(12),
//           ),
//         )
//             : Container(),
//         const SizedBox(
//           height: 4,
//         ),
//         Text(
//           'Class of $year',
//           style: TextStyle(
//             fontSize: ScreenUtil().setSp(12),
//             color: AppColor.grey,
//           ),
//         )
//       ],
//     );
//   }
//
//   _designation(place) {
//     return Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           SizedBox(
//             height: 7.h,
//           ),
//           GestureDetector(
//             onTap: () {
//               var a = Get.to(
//                     () => ChatInvitationScreen(
//                   name: widget.name,
//                   image: widget.image,
//                   receiverId: widget.id,
//                 ),
//               );
//             },
//             child: Container(
//               height: 25.w,
//               width: 25.w,
//               color: AppColor.transparent,
//               child: widget.chatStatus == ""
//                   ? SvgPicture.asset(
//                 AppImages.chatSend,
//                 color: AppColor.primaryColor,
//               )
//                   : widget.chatStatus == AppConstants.INVITE ||
//                   widget.chatStatus == AppConstants.REJECT
//                   ? SvgPicture.asset(
//                 AppImages.chatPending,
//                 color: AppColor.primaryColor,
//               )
//                   : SvgPicture.asset(
//                 AppImages.chatAccept,
//                 color: AppColor.primaryColor,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 7.h,
//           ),
//           Text(
//             place == "null" ? "" : place,
//             style: TextStyle(
//               fontSize: ScreenUtil().setSp(12),
//               color: AppColor.black45,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
