import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/Alumni_Card/alumniCard.dart';
import 'package:iobm/Views/alumni_screen.dart';
import 'package:iobm/Views/more/Counselor/counselor_view.dart';
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
  ///todo:Promary colors
  static  Color _purple      = AppColor.primaryColor; // Soft Lavender
  static  Color _teal        = AppColor.primaryColor; // Light Mint/Teal
  static  Color _green       = AppColor.primaryColor; // Soft Pastel Green
  static  Color _red         = AppColor.primaryColor; // Light Coral Red
  static  Color _violet      = AppColor.primaryColor; // Light Violet/Lilac
  static  Color _olive       = AppColor.primaryColor; // Soft Olive/Sand
  static  Color _darkNav     = AppColor.primaryColor; // Light Steel Blue
  static  Color _brown       = AppColor.primaryColor; // Soft Terracotta/Brown
  static  Color _blue        = AppColor.primaryColor; // Baby Blue
  static  Color _salmon      = AppColor.primaryColor; // Light Salmon Pink
  static  Color _limeGreen   = AppColor.primaryColor; // Light Lime Green
  static  Color _slate       = AppColor.primaryColor; // Light Slate/Gray-Blue
  static  Color _crimson     = AppColor.primaryColor; // Soft Crimson Pink
  static  Color _orange      = AppColor.primaryColor; // Light Pastel Orange
  static  Color _counselor   = AppColor.primaryColor; // Soft Slate Cyan (Opacity removed for consistency)
  ///todo:old Lite Multi colors
  // static const Color _purple      = Color(0xFFB1A7F2); // Soft Lavender
  // static const Color _teal        = Color(0xFF8CE5DC); // Light Mint/Teal
  // static const Color _green       = Color(0xFF8ED9A6); // Soft Pastel Green
  // static const Color _red         = Color(0xFFF99DA4); // Light Coral Red
  // static const Color _violet      = Color(0xFFD6A6F7); // Light Violet/Lilac
  // static const Color _olive       = Color(0xFFE2D68F); // Soft Olive/Sand
  // static const Color _darkNav     = Color(0xFF8EA4C7); // Light Steel Blue
  // static const Color _brown       = Color(0xFFC79E91); // Soft Terracotta/Brown
  // static const Color _blue        = Color(0xFF99BBFF); // Baby Blue
  // static const Color _salmon      = Color(0xFFF3B0A7); // Light Salmon Pink
  // static const Color _limeGreen   = Color(0xFFA5E6A5); // Light Lime Green
  // static const Color _slate       = Color(0xFFA3BCC9); // Light Slate/Gray-Blue
  // static const Color _crimson     = Color(0xFFEAA1A8); // Soft Crimson Pink
  // static const Color _orange      = Color(0xFFFFC093); // Light Pastel Orange
  // static const Color _counselor   = Color(0xFF90C2CE); // Soft Slate Cyan (Opacity removed for consistency)
  ///todo:old dark Multi colors
  // static const Color _purple     = Color(0xFF5C4DB1);
  // static const Color _teal       = Color(0xFF00A896);
  // static const Color _green      = Color(0xFF1B7F3B);
  // static const Color _red        = Color(0xFFCC2936);
  // static const Color _violet     = Color(0xFF8B2FC9);
  // static const Color _olive      = Color(0xFF8B7D2A);
  // static const Color _darkNav    = Color(0xFF1A2B4A);
  // static const Color _brown      = Color(0xFF6B3A2A);
  // static const Color _blue       = Color(0xFF2E6BE6);
  // static const Color _salmon     = Color(0xFFB85C52);
  // static const Color _limeGreen  = Color(0xFF3D9A3D);
  // static const Color _slate      = Color(0xFF3A5A6A);
  // static const Color _crimson    = Color(0xFFAA1F2E);
  // static const Color _orange     = Color(0xFFE07020);
  // static const Color _counselor     = Color(0xE8224A55);


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
      // Counselor
        MoreMenuItem(
        title: Strings.counselor,
        color: _counselor,
        pngAsset: 'assets/images/counselor.png',
        onTap: () => Get.to(() => const CounselorView()),
      ),

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
        pngAsset: AppImages.myconnections2,
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
          pngAsset: AppImages.gallery2,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const GalleryScreen()),
          ),
        ),
      // Privacy and polocy
      MoreMenuItem(
        title: Strings.privacyAndPolicy,
        color: AppColor.primaryColor,
        // color: Colors.deepOrangeAccent,
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
      // if (AppConstants.appName == 'TLE')
      //   MoreMenuItem(
      //     title: Strings.businessspotlight,
      //     color: _green,
      //     svgAsset: AppImages.bspotlighticon,
      //     onTap: () => Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (_) => const BusinessSpotlight()),
      //     ),
      //   ),

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
          padding: EdgeInsets.only(left: 12.w,right:  12.w,top: 2,bottom: 2),
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
            Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.white.withOpacity(0.2),
                  boxShadow: [
                    BoxShadow(
                      color: item.color.withOpacity(0.35),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildIcon(item),
                )),
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
                  color: AppColor.white,
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
     double size = 32.r;
     double size2 = 27.r;

    if (item.iconData != null) {
      return Icon(item.iconData, color: AppColor.white, size: size);
    }

    if (item.pngAsset != null) {
      return Image.asset(
        item.pngAsset!,
        height: size.r,
        width: size.r,
        color: AppColor.white,
        errorBuilder: (_, __, ___) =>
         Icon(Icons.grid_view, color: AppColor.white, size: size),
      );
    }

    if (item.svgAsset != null) {
      return SvgPicture.asset(
        item.svgAsset!,
        height: size2.r,
        width: size2.r,
        colorFilter: const ColorFilter.mode(AppColor.white, BlendMode.srcIn),
      );
    }

    return  Icon(Icons.grid_view, color: Colors.white, size: size);
  }
}

