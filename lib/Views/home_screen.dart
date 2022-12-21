// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:iobm/Views/comments_screen.dart';
// import 'package:iobm/Views/create_post.dart';
// import 'package:iobm/Widgets/custom_widgets.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:iobm/Widgets/widget_styles.dart';
// import 'package:iobm/utils/app_color.dart';
//
// import 'edit_post_screen.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   String? imagePath;
//
//   String? post =
//       'Crass eu elit, placer due ut, tindintal nishl, Nulla leo elit, Pharatera bibendum asf asf asftegvb dhdfb hrtydv dryer xvayikty b dfyr y dvd yr yd vdsfh rtuyrthefrb';
//
//   List<String>? imgList = [
//     "assets/images/postpic.png",
//     "assets/images/bike.png",
//     "",
//     "",
//     "assets/images/postpic.png",
//     "",
//     "assets/images/postpic.png",
//     "",
//     "assets/images/bike.png",
//     "",
//     "assets/images/postpic.png",
//     "",
//     "assets/images/bike.png",
//     "",
//     "assets/images/postpic.png",
//     ""
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar(
//         userID: '1',
//         title: const Text('Alumni Feed'),
//         bcontext: context,
//         onGpsFixedClick: () {
//           print("gps clicked");
//           CustomWidget.gpsDialogue(context: context);
//         },
//         onNotificationClick: () {
//           print("notificaton clicked");
//         },
//       ),
//       body: SafeArea(
//           left: true,
//           right: true,
//           top: true,
//           bottom: true,
//           child: Column(
//             children: [
//               _postbar(),
//               Expanded(
//                 child: ListView.builder(
//                     itemCount: imgList!.length,
//                     shrinkWrap: true,
//                     itemBuilder: (BuildContext context, int index) {
//                       return _buildList(postImg: imgList![index]);
//                     }),
//               ),
//             ],
//           )),
//     );
//   }
//
//   _buildList({postImg}) {
//     return Column(
//       children: [
//         Divider(thickness: 10, color: AppColor.greyshade200),
//         _feed1(
//             img: 'assets/images/profile.png',
//             name: "Megan Lucas",
//             description: post!,
//             time: "12:00 PM",
//             imgIndex: postImg),
//         postImg == "" ? Container() : Image.asset(postImg),
//         SizedBox(
//           height: 4.h,
//         ),
//         _likesComments(likes: 125, comments: 25),
//       ],
//     );
//   }
//
//   _postbar() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
//       child: Row(
//         children: [
//           CircleAvatar(
//             //profile image
//             child: image(),
//             radius: 16.r,
//           ),
//           SizedBox(
//             width: 10.w,
//           ),
//           Expanded(
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (BuildContext context) {
//                   return CreatePostScreen();
//                 }));
//               },
//               child: Container(
//                 padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
//                 decoration: WidgetStyle.containerDecoration(radius: 30.0.r),
//                 child: Text('Share your thoughts',
//                     style: WidgetStyle.forgotTExtStyle(
//                         fontsize: 13.sp, color: AppColor.grey)),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   image() {
//     // print(imagepath);
//     if (imagePath == null) {
//       return const Image(
//         image: AssetImage('assets/images/profile.png'),
//       );
//     } else {
//       return CachedNetworkImage(
//         imageUrl: imagePath!.toString(),
//         imageBuilder: (context, imageProvider) => Container(
//           width: 80.0,
//           height: 80.0,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
//           ),
//         ),
//         progressIndicatorBuilder: (context, url, downloadProgress) =>
//             CircularProgressIndicator(value: downloadProgress.progress),
//         errorWidget: (context, url, error) => Icon(Icons.error),
//       );
//     }
//   }
//
//   _feed1(
//       {String? name,
//       String? time,
//       String? img,
//       String? description,
//       imgIndex}) {
//     return Container(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 CircleAvatar(radius: 18.r, backgroundImage: AssetImage(img!)),
//                 SizedBox(width: 10.w),
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         name!,
//                         style: WidgetStyle.semiBoldText(
//                             color: AppColor.black, fontsize: 16.sp),
//                       ),
//                       Text(time!,
//                           style: WidgetStyle.forgotTExtStyle(
//                               color: AppColor.greyshade600, fontsize: 11.sp)),
//                     ],
//                   ),
//                 ),
//                 //IconButton(onPressed: null, icon: Icon(Icons.more_vert, color: AppColor.black,)),
//                 PopupMenuButton(
//                   itemBuilder: (BuildContext context) => const [
//                     PopupMenuItem(
//                       child: Text('Edit'),
//                       value: 1,
//                     ),
//                     PopupMenuItem(
//                       child: Text('Delete'),
//                       value: 2,
//                     ),
//                     PopupMenuItem(
//                       child: Text('report'),
//                       value: 3,
//                     ),
//                   ],
//                   onSelected: (value) {
//                     switch (value) {
//                       case 1:
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (BuildContext context) {
//                           return EditPostScreen(
//                             name: "Megan Lucas",
//                             post: post!,
//                             postImage: imgIndex,
//                             profileimage: "assets/images/profile.png",
//                           );
//                         }));
//                         break;
//
//                       case 2:
//                         CustomWidget.deleteDialogue(context: context);
//                         break;
//                       case 3:
//                         CustomWidget.reportDialogue(context: context);
//                     }
//                   },
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 8.h,
//             ),
//             Text(
//               description!,
//               style: WidgetStyle.forgotTExtStyle(
//                   color: AppColor.greyshade800, fontsize: 14.sp),
//               textAlign: TextAlign.justify,
//             ),
//           ],
//         ));
//   }
//
//   _likesComments({likes, comments}) {
//     return Container(
//       decoration: WidgetStyle.postDecoration(),
//       padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               ImageIcon(
//                 AssetImage('assets/icons/favorite.png'),
//                 size: 15,
//                 color: AppColor.primaryColor,
//               ),
//               Text(" $likes",
//                   style: WidgetStyle.forgotTExtStyle(
//                       color: AppColor.greyshade700, fontsize: 13.sp))
//             ],
//           ),
//           GestureDetector(
//             onTap: () {
//               // pushNewScreen(
//               //   context,
//               //   screen: CommentScreen(),
//               //   withNavBar: false,
//               // );
//             },
//             child: Row(
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (BuildContext context) {
//                       return const CommentScreen();
//                     }));
//                   },
//                   child: const ImageIcon(
//                     AssetImage('assets/icons/comments.png'),
//                     size: 15,
//                     color: AppColor.primaryColor,
//                   ),
//                 ),
//                 Text(
//                   ' $comments',
//                   style: WidgetStyle.forgotTExtStyle(
//                       color: AppColor.greyshade700, fontsize: 13.sp),
//                 ),
//               ],
//             ),
//           ),
//           const ImageIcon(
//             AssetImage('assets/icons/forward.png'),
//             size: 15,
//             color: AppColor.primaryColor,
//           ),
//           const ImageIcon(
//             AssetImage('assets/icons/share.png'),
//             size: 15,
//             color: AppColor.primaryColor,
//           ),
//         ],
//       ),
//     );
//   }
// }
