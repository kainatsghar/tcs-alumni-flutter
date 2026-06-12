import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/Alumni_Card/alumniCard.dart';
import 'package:iobm/Views/alumni_screen.dart';
import 'package:iobm/Views/more/about_screens/about_options_view.dart';
import 'package:iobm/Views/more/alumni_election_view.dart';
import 'package:iobm/Views/more/business_spotlight.dart';
import 'package:iobm/Views/more/campus_details.dart';
import 'package:iobm/Views/more/career/career_screen.dart';
import 'package:iobm/Views/more/csr_screen.dart';
import 'package:iobm/Views/more/discount/avail_discount_screen.dart';
import 'package:iobm/Views/more/feedback_tle.dart';
import 'package:iobm/Views/more/my_connection_screen.dart';
import 'package:iobm/Views/more/porile_options.dart';
import 'package:iobm/Views/more/spotlight_screen.dart';
import 'package:iobm/Views/more/tle_spotlight/tle_spotlight.dart';
import 'package:iobm/Views/more/workorder/work_order_screen.dart';
import 'package:iobm/Views/more/youtube_channel_view.dart';
import 'package:iobm/Widgets/app_bar.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/strings.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../utils/text_styles.dart';
import '../privac_&_policy.dart';
import 'business_directory/business_directory_screen.dart';
import 'consultancy/Consultancy.dart';
import 'gallery/gallery_screen.dart';
import 'networking_screen.dart';

// ─── Model ────────────────────────────────────────────────────────────────────
class MoreMenuItem {
  final String title;
  final Color color;
  final IconData? iconData;
  final String? svgAsset;
  final String? pngAsset;
  final VoidCallback onTap;

  const MoreMenuItem({
    required this.title,
    required this.color,
    required this.onTap,
    this.iconData,
    this.svgAsset,
    this.pngAsset,
  });
}

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  MoreScreenState createState() => MoreScreenState();
}

class MoreScreenState extends State<MoreScreen> {
  // ─── Colors matching the design ─────────────────────────────────────────
  static const Color _purple     = Color(0xFF5C4DB1);
  static const Color _teal       = Color(0xFF00A896);
  static const Color _green      = Color(0xFF1B7F3B);
  static const Color _red        = Color(0xFFCC2936);
  static const Color _violet     = Color(0xFF8B2FC9);
  static const Color _olive      = Color(0xFF8B7D2A);
  static const Color _darkNav    = Color(0xFF1A2B4A);
  static const Color _brown      = Color(0xFF6B3A2A);
  static const Color _blue       = Color(0xFF2E6BE6);
  static const Color _salmon     = Color(0xFFB85C52);
  static const Color _limeGreen  = Color(0xFF3D9A3D);
  static const Color _slate      = Color(0xFF3A5A6A);
  static const Color _crimson    = Color(0xFFAA1F2E);
  static const Color _orange     = Color(0xFFE07020);

  List<MoreMenuItem> _buildMenuItems(BuildContext context) {
    return [
      // My Account
      MoreMenuItem(
        title: Strings.myAccount,
        color: _purple,
        iconData: Icons.person,
        onTap: () => Get.to(() => const ProfileOptionsView()),
      ),

      // Careers
      if (AppConstants.appName != 'TLE')
        MoreMenuItem(
          title: Strings.careers,
          color: _teal,
          svgAsset: AppImages.careers,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CareerScreen()),
          ),
        ),

      // Discount Partners
      MoreMenuItem(
        title: Strings.discountpartner,
        color: _green,
        svgAsset: AppImages.discount,
        onTap: () => Get.to(() => const AvailDiscount()),
      ),

      // Counselling / Consultancy
      // MoreMenuItem(
      //   title: Strings.consultancy,
      //   color: _red,
      //   pngAsset: 'assets/images/consultant.png',
      //   onTap: () => Get.to(() => const Consultancy()),
      // ),

      // CSR
      if (AppConstants.appName != 'TLE')
        MoreMenuItem(
          title: Strings.csr,
          color: _violet,
          svgAsset: AppImages.csrIcon,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CsrScreen()),
          ),
        ),

      // Nomination / Alumni Election
      if (AppConstants.appName != 'TLE')
        MoreMenuItem(
          title: Strings.alumnielection,
          color: _olive,
          svgAsset: AppImages.electionicon,
          onTap: () => Get.to(() => const AlumniElectionScreen()),
        ),

      // YouTube Channel
      if (AppConstants.appName != 'TLE')
        MoreMenuItem(
          title: Strings.youtubechannel,
          color: _darkNav,
          iconData: Icons.video_collection,
          onTap: () => Get.to(() => const YoutubeChannelScreen()),
        ),

      // My Connections
      MoreMenuItem(
        title: Strings.myConnections,
        color: _brown,
        svgAsset: AppImages.myconnections,
        onTap: () => Get.to(() => const ConnectionsScreen()),
      ),

      // Spotlight / Featured Members
      MoreMenuItem(
        title: AppConstants.appName == 'TLE'
            ? Strings.featuredMembers
            : Strings.spotlight,
        color: _blue,
        svgAsset: AppImages.spotlighticon,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AppConstants.appName == 'TLE'
                ? const TLESpotlight()
                : const SpotlightScreen(),
          ),
        ),
      ),

      // Business Directory
      if (AppConstants.appName != 'TLE')
        MoreMenuItem(
          title: Strings.businessdirectory,
          color: _salmon,
          svgAsset: AppImages.business,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const BusinessDirectory()),
          ),
        ),

      // Alumni Mentor
      if (AppConstants.appName != 'TLE')
        MoreMenuItem(
          title: Strings.mentorship,
          color: _limeGreen,
          svgAsset: AppImages.mentor,
          onTap: () => Get.to(() => AlumniScreen(checkMentor: 1)),
        ),

      // Networking
      MoreMenuItem(
        title: Strings.networking,
        color: _slate,
        svgAsset: AppImages.networking,
        onTap: () async {
          if (Platform.isAndroid) {
            final status = await Permission.locationWhenInUse.request();
            if (status == PermissionStatus.granted) {
              Get.to(() => const NetWorkingScreen());
            } else if (status == PermissionStatus.denied) {
              Fluttertoast.showToast(msg: 'Turn on your GPS location');
            } else if (status == PermissionStatus.permanentlyDenied) {
              openAppSettings();
            }
          } else {
            Get.to(() => const NetWorkingScreen());
          }
        },
      ),

      // Gallery
      if (AppConstants.appName != 'TLE')
        MoreMenuItem(
          title: Strings.gallery,
          color: _crimson,
          svgAsset: AppImages.gallery,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const GalleryScreen()),
          ),
        ),
      // Privacy and polocy
      MoreMenuItem(
        title: Strings.privacyAndPolicy,
        color: Colors.deepOrangeAccent,
        svgAsset: AppImages.privacy_and_policy,
        onTap: () => Get.to(()=>PrivacyPolicyPage()),
      ),

      // Help
      MoreMenuItem(
        title: Strings.help,
        color: _orange,
        svgAsset: AppImages.help,
        onTap: () => Get.to(() => const AboutOptionsView()),
      ),

      // Campus Details
      if (AppConstants.appName == 'IOBM' || AppConstants.appName == 'BOSS')
        MoreMenuItem(
          title: Strings.campusDetails,
          color: _teal,
          svgAsset: AppImages.chapterdetails,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CampusDetails()),
          ),
        ),

      // Work Order
      if (AppConstants.appName == 'IOBM')
        MoreMenuItem(
          title: Strings.workOrder,
          color: _purple,
          svgAsset: AppImages.workOrder,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const WorkOrderScreen()),
          ),
        ),

      // Alumni Card
      if (AppConstants.appName == 'IOBM')
        MoreMenuItem(
          title: Strings.alumniCard,
          color: _blue,
          svgAsset: AppImages.applyCard,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AlumniCardScreen()),
          ),
        ),

      // Business Spotlight (TLE only)
      if (AppConstants.appName == 'TLE')
        MoreMenuItem(
          title: Strings.businessspotlight,
          color: _green,
          svgAsset: AppImages.bspotlighticon,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const BusinessSpotlight()),
          ),
        ),

      // Advertise (TLE only)
      if (AppConstants.appName == 'TLE')
        MoreMenuItem(
          title: Strings.advertise,
          color: _violet,
          svgAsset: AppImages.aboutus,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const FeedBack()),
          ),
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final items = _buildMenuItems(context);

    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        backgroundColor: const Color(0xFFF0F2F5),
        appBar: MyAppBar(
          title: const Text(Strings.more),
          context: context,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
          child: GridView.builder(
            itemCount: items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 1.0,
            ),
            itemBuilder: (context, index) => _buildGridItem(items[index]),
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(MoreMenuItem item) {
    return GestureDetector(
      onTap: item.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: item.color,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(
              color: item.color.withOpacity(0.35),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIcon(item),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Text(
                item.title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(MoreMenuItem item) {
    const double size = 32;

    if (item.iconData != null) {
      return Icon(item.iconData, color: Colors.white, size: size);
    }

    if (item.pngAsset != null) {
      return Image.asset(
        item.pngAsset!,
        height: size,
        width: size,
        color: Colors.white,
        errorBuilder: (_, __, ___) =>
        const Icon(Icons.grid_view, color: Colors.white, size: size),
      );
    }

    if (item.svgAsset != null) {
      return SvgPicture.asset(
        item.svgAsset!,
        height: size,
        width: size,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      );
    }

    return const Icon(Icons.grid_view, color: Colors.white, size: size);
  }
}

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:iobm/Views/Alumni_Card/alumniCard.dart';
// import 'package:iobm/Views/alumni_screen.dart';
//
// import 'package:iobm/Views/more/about_screens/about_options_view.dart';
// import 'package:iobm/Views/more/alumni_election_view.dart';
// import 'package:iobm/Views/more/business_spotlight.dart';
// import 'package:iobm/Views/more/campus_details.dart';
//
// import 'package:iobm/Views/more/career/career_screen.dart';
//
// import 'package:iobm/Views/more/csr_screen.dart';
// import 'package:iobm/Views/more/discount/avail_discount_screen.dart';
// import 'package:iobm/Views/more/feedback_tle.dart';
//
// import 'package:iobm/Views/more/my_connection_screen.dart';
//
// import 'package:iobm/Views/more/porile_options.dart';
//
// import 'package:iobm/Views/more/spotlight_screen.dart';
// import 'package:iobm/Views/more/tle_spotlight/tle_spotlight.dart';
//
// import 'package:iobm/Views/more/workorder/work_order_screen.dart';
//
// import 'package:iobm/Views/more/youtube_channel_view.dart';
//
// import 'package:iobm/Widgets/app_bar.dart';
//
// import 'package:iobm/utils/app_color.dart';
// import 'package:iobm/utils/app_constants.dart';
//
// import 'package:iobm/utils/app_images.dart';
// import 'package:iobm/utils/strings.dart';
//
// import 'package:permission_handler/permission_handler.dart';
//
// import '../../utils/text_styles.dart';
// import 'business_directory/business_directory_screen.dart';
//
// import 'consultancy/Consultancy.dart';
// import 'gallery/gallery_screen.dart';
//
// import 'networking_screen.dart';
//
// class MoreScreen extends StatefulWidget {
//   const MoreScreen({Key? key}) : super(key: key);
//
//   @override
//   MoreScreenState createState() => MoreScreenState();
// }
//
// class MoreScreenState extends State<MoreScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar(
//         title: const Text(Strings.more),
//         context: context,
//       ),
//       body: SingleChildScrollView(
//         child: Column(children: [
//           _buildMoreItem(
//             title: Strings.myConnections,
//             icon: AppImages.myconnections,
//             onClicked: () {
//               Get.to(() => const ConnectionsScreen());
//             },
//           ),
//           Divider(
//             height: 1.h,
//           ),
//           if (AppConstants.appName == "IOBM" || AppConstants.appName == "BOSS")
//             _buildMoreItem(
//                 title: Strings.campusDetails,
//                 icon: AppImages.chapterdetails,
//                 onClicked: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (BuildContext context) {
//                     return const CampusDetails();
//                   }));
//                 }),
//           Divider(
//             height: 1.h,
//           ),
//           _buildMoreItem(
//               title: AppConstants.appName == 'TLE'
//                   ? Strings.featuredMembers
//                   : Strings.spotlight,
//               icon: AppImages.spotlighticon,
//               onClicked: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (BuildContext context) {
//                       return AppConstants.appName == 'TLE'
//                           ? const TLESpotlight()
//                           : const SpotlightScreen();
//                     },
//                   ),
//                 );
//               }),
//           AppConstants.appName == 'TLE'
//               ? Column(
//                   children: [
//                     Divider(
//                       height: 1.h,
//                     ),
//                     _buildMoreItem(
//                         title: Strings.businessspotlight,
//                         icon: AppImages.bspotlighticon,
//                         onClicked: () {
//                           Navigator.push(context, MaterialPageRoute(
//                               builder: (BuildContext context) {
//                             return const BusinessSpotlight();
//                           }));
//                         }),
//                   ],
//                 )
//               : Container(),
//           AppConstants.appName != 'TLE'
//               ? Column(
//                   children: [
//                     Divider(
//                       height: 1.h,
//                     ),
//                     _buildMoreItem(
//                         title: Strings.businessdirectory,
//                         icon: AppImages.business,
//                         onClicked: () {
//                           Navigator.push(context, MaterialPageRoute(
//                               builder: (BuildContext context) {
//                             return const BusinessDirectory();
//                           }));
//                         }),
//                   ],
//                 )
//               : const SizedBox(),
//           AppConstants.appName != 'TLE'
//               ? Column(
//                   children: [
//                     Divider(
//                       height: 1.h,
//                     ),
//                     _buildMoreItem(
//                         title: Strings.careers,
//                         icon: AppImages.careers,
//                         onClicked: () {
//                           Navigator.push(context, MaterialPageRoute(
//                               builder: (BuildContext context) {
//                             return const CareerScreen();
//                           }));
//                         }),
//                   ],
//                 )
//               : const SizedBox(),
//           Divider(
//             height: 1.h,
//           ),
//           _buildMoreItem(
//               title: Strings.discountpartner,
//               icon: AppImages.discount,
//               onClicked: () {
//                 Get.to(() => const AvailDiscount());
//               }),
//           Divider(thickness: 1.h, height: 1.h, ),
//           Center(
//             child: ListTile(
//               minVerticalPadding: 10.h,
//               contentPadding: const EdgeInsets.only(left: 7.0),
//               title: Row(
//                 children: [
//                   // Icon(
//                   //   (Icons.info),
//                   //   size: 24.w,
//                   // ),
//                   SizedBox(
//                     width: 2.w,
//                   ), Image.asset(
//                     'assets/images/consultant.png',
//                     height: 21.h,
//                     width: 21.w,
//                   ),
//                   SizedBox(
//                     width: 12.w,
//                   ),
//                   Text(
//                     Strings.consultancy,
//                     style: CustomTextStyles.text14SemiBoldW600,
//                   ),
//                 ],
//               ),
//               trailing: const Icon(
//                 Icons.keyboard_arrow_right,
//                 // size: ,
//                 color: AppColor.black,
//               ),
//               onTap: () {
//                 Get.to(() => const Consultancy());
//               },
//               dense: true,
//             ),
//           ),
//           Divider(
//             height: 1.h,
//           ),
//           AppConstants.appName != 'TLE'
//               ? _buildMoreItem(
//                   title: Strings.csr,
//                   icon: AppImages.csrIcon,
//                   onClicked: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (BuildContext context) {
//                       return const CsrScreen();
//                     }));
//                   })
//               : const SizedBox(),
//           AppConstants.appName == 'IOBM'
//               ? Column(
//                   children: [
//                     Divider(
//                       height: 1.h,
//                     ),
//                     _buildMoreItem(
//                         title: Strings.workOrder,
//                         icon: AppImages.workOrder,
//                         onClicked: () {
//                           Navigator.push(context, MaterialPageRoute(
//                               builder: (BuildContext context) {
//                             return const WorkOrderScreen();
//                           }));
//                         }),
//                   ],
//                 )
//               : Container(),
//           AppConstants.appName != 'TLE'
//               ? Column(
//                   children: [
//                     Divider(
//                       height: 1.h,
//                     ),
//                     _buildMoreItem(
//                         title: Strings.mentorship,
//                         icon: AppImages.mentor,
//                         onClicked: () {
//                           Get.to(
//                             () => AlumniScreen(
//                               checkMentor: 1,
//                             ),
//                           );
//                         }),
//                   ],
//                 )
//               : const SizedBox(),
//           AppConstants.appName != 'TLE'
//               ? Column(
//                   children: [
//                     Divider(
//                       height: 1.h,
//                     ),
//                     _buildMoreItem(
//                         title: Strings.gallery,
//                         icon: AppImages.gallery,
//                         onClicked: () {
//                           Navigator.push(context, MaterialPageRoute(
//                               builder: (BuildContext context) {
//                             return const GalleryScreen();
//                           }));
//                         }),
//                   ],
//                 )
//               : const SizedBox(),
//           AppConstants.appName == 'IOBM'
//               ? Column(
//                   children: [
//                     Divider(
//                       height: 1.h,
//                     ),
//                     _buildMoreItem(
//                         title: Strings.alumniCard,
//                         icon: AppImages.applyCard,
//                         onClicked: () {
//                           Navigator.push(context, MaterialPageRoute(
//                               builder: (BuildContext context) {
//                             return const AlumniCardScreen();
//                           }));
//                         }),
//                   ],
//                 )
//               : Container(),
//           Divider(thickness: 5.h, height: 2.h, color: AppColor.greyshade200),
//           AppConstants.appName != 'TLE'
//               ? _buildMoreItem(
//                   title: Strings.alumnielection,
//                   icon: AppImages.electionicon,
//                   onClicked: () {
//                     Get.to(
//                       () => const AlumniElectionScreen(),
//                     );
//                   },
//                 )
//               : const SizedBox(),
//           Divider(
//             height: 1.h,
//           ),
//           // _buildMoreItem(
//           //     title: 'Campus Details',
//           //     icon: 'assets/icons/vote.png',
//           //     onClicked: () {}),
//           // Divider(
//           //   height: 1.h,
//           // ),
//           _buildMoreItem(
//             title: Strings.networking,
//             icon: AppImages.networking,
//             onClicked: () async {
//               if (Platform.isAndroid) {
//                 final status = await Permission.locationWhenInUse.request();
//
//                 if (status == PermissionStatus.granted) {
//                   Get.to(() => const NetWorkingScreen());
//                   // print('Permission granted');
//                 } else if (status == PermissionStatus.denied) {
//                   await Fluttertoast.showToast(
//                       msg: 'Turn on your GPS location');
//                   //   print(
//                   //     'Denied. Show a dialog with a reason and again ask for the permission.');
//                 } else if (status == PermissionStatus.permanentlyDenied) {
//                   await openAppSettings();
//                   //   print('Take the user to the settings page.');
//                 }
//               } else {
//                 Get.to(() => const NetWorkingScreen());
//               }
//             },
//           ),
//           AppConstants.appName != "TLE"
//               ? Column(
//                   children: [
//                     Divider(
//                       height: 1.h,
//                     ),
//                     Center(
//                       child: ListTile(
//                         minVerticalPadding: 10.h,
//                         contentPadding: const EdgeInsets.only(left: 7.0),
//                         title: Row(
//                           children: [
//                             Icon(
//                               (Icons.video_collection),
//                               size: 24.h,
//                               color: AppColor.black,
//                             ),
//                             SizedBox(
//                               width: 10.w,
//                             ),
//                             Text(
//                               Strings.youtubechannel,
//                               style: CustomTextStyles.text14SemiBoldW600,
//                             ),
//                           ],
//                         ),
//                         trailing: const Icon(
//                           Icons.keyboard_arrow_right,
//                           color: AppColor.black,
//                         ),
//                         onTap: () {
//                           Get.to(
//                             () => const YoutubeChannelScreen(),
//                           );
//                         },
//                         dense: true,
//                       ),
//                     ),
//                   ],
//                 )
//               : const SizedBox(),
//           Divider(thickness: 5.h, height: 2.h, color: AppColor.greyshade200),
//           _buildMoreItem(
//               title: Strings.myAccount,
//               icon: AppImages.myprofile,
//               onClicked: () {
//                 Get.to(() => const ProfileOptionsView());
//               }),
//           Divider(
//             height: 1.h,
//           ),
//           AppConstants.appName == 'TLE'
//               ? Column(
//                   children: [
//                     _buildMoreItem(
//                         title: Strings.advertise,
//                         icon: AppImages.aboutus,
//                         onClicked: () {
//                           Navigator.push(context, MaterialPageRoute(
//                               builder: (BuildContext context) {
//                             return const FeedBack();
//                           }));
//                         }),
//                     Divider(
//                       height: 1.h,
//                     ),
//                   ],
//                 )
//               : Container(),
//           Center(
//             child: ListTile(
//               minVerticalPadding: 10.h,
//               contentPadding: const EdgeInsets.only(left: 7.0),
//               title: Row(
//                 children: [
//                   // Icon(
//                   //   (Icons.info),
//                   //   size: 24.w,
//                   // ),
//                   SizedBox(
//                     width: 2.w,
//                   ),
//                   SvgPicture.asset(
//                     AppImages.help,
//                     height: 21.h,
//                     width: 21.w,
//                   ),
//                   SizedBox(
//                     width: 12.w,
//                   ),
//                   Text(
//                     Strings.help,
//                     style: CustomTextStyles.text14SemiBoldW600,
//                   ),
//                 ],
//               ),
//               trailing: const Icon(
//                 Icons.keyboard_arrow_right,
//                 // size: ,
//                 color: AppColor.black,
//               ),
//               onTap: () {
//                 Get.to(() => const AboutOptionsView());
//               },
//               dense: true,
//             ),
//           ),
//           Divider(
//             height: 1.h,
//           ),
//         ]),
//       ),
//     );
//   }
//
//   _buildMoreItem({
//     String? title,
//     String? icon,
//     VoidCallback? onClicked,
//   }) {
//     return Center(
//       child: ListTile(
//         contentPadding: const EdgeInsets.only(left: 10.0),
//         title: Row(
//           children: [
//             SvgPicture.asset(
//               icon!,
//               height: 20.h,
//               width: 20.w,
//               // color: AppColor.black,
//             ),
//             SizedBox(
//               width: 12.w,
//             ),
//             Text(title!, style: CustomTextStyles.text14SemiBoldW600),
//           ],
//         ),
//         trailing: const Icon(
//           Icons.keyboard_arrow_right,
//           color: AppColor.black,
//         ),
//         onTap: onClicked,
//         dense: true,
//         minVerticalPadding: 10.h,
//         // visualDensity: VisualDensity(vertical: 5),
//       ),
//     );
//   }
// }
