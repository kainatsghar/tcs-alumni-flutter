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

import 'business_directory/business_directory_screen.dart';

import 'gallery/gallery_screen.dart';

import 'networking_screen.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  MoreScreenState createState() => MoreScreenState();
}

class MoreScreenState extends State<MoreScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: const Text(Strings.more),
        context: context,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          _buildMoreItem(
            title: Strings.myConnections,
            icon: AppImages.myconnections,
            onClicked: () {
              Get.to(() => const ConnectionsScreen());
            },
          ),
          Divider(
            height: 1.h,
          ),
          if (AppConstants.appName == "IOBM" || AppConstants.appName == "BOSS")
            _buildMoreItem(
                title: Strings.campusDetails,
                icon: AppImages.chapterdetails,
                onClicked: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const CampusDetails();
                  }));
                }),
          Divider(
            height: 1.h,
          ),
          _buildMoreItem(
              title: AppConstants.appName == 'TLE'
                  ? Strings.featuredMembers
                  : Strings.spotlight,
              icon: AppImages.spotlighticon,
              onClicked: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return AppConstants.appName == 'TLE'
                          ? const TLESpotlight()
                          : const SpotlightScreen();
                    },
                  ),
                );
              }),
          AppConstants.appName == 'TLE'
              ? Column(
                  children: [
                    Divider(
                      height: 1.h,
                    ),
                    _buildMoreItem(
                        title: Strings.businessspotlight,
                        icon: AppImages.bspotlighticon,
                        onClicked: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const BusinessSpotlight();
                          }));
                        }),
                  ],
                )
              : Container(),
          AppConstants.appName != 'TLE'
              ? Column(
                  children: [
                    Divider(
                      height: 1.h,
                    ),
                    _buildMoreItem(
                        title: Strings.businessdirectory,
                        icon: AppImages.business,
                        onClicked: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const BusinessDirectory();
                          }));
                        }),
                  ],
                )
              : const SizedBox(),
          AppConstants.appName != 'TLE'
              ? Column(
                  children: [
                    Divider(
                      height: 1.h,
                    ),
                    _buildMoreItem(
                        title: Strings.careers,
                        icon: AppImages.careers,
                        onClicked: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const CareerScreen();
                          }));
                        }),
                  ],
                )
              : const SizedBox(),
          Divider(
            height: 1.h,
          ),
          _buildMoreItem(
              title: Strings.discountpartner,
              icon: AppImages.discount,
              onClicked: () {
                Get.to(() => const AvailDiscount());
              }),
          Divider(thickness: 1.h, height: 1.h, color: AppColor.greyshade200),
          AppConstants.appName != 'TLE'
              ? _buildMoreItem(
                  title: Strings.csr,
                  icon: AppImages.csrIcon,
                  onClicked: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const CsrScreen();
                    }));
                  })
              : const SizedBox(),
          AppConstants.appName == 'IOBM'
              ? Column(
                  children: [
                    Divider(
                      height: 1.h,
                    ),
                    _buildMoreItem(
                        title: Strings.workOrder,
                        icon: AppImages.workOrder,
                        onClicked: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const WorkOrderScreen();
                          }));
                        }),
                  ],
                )
              : Container(),
          AppConstants.appName != 'TLE'
              ? Column(
                  children: [
                    Divider(
                      height: 1.h,
                    ),
                    _buildMoreItem(
                        title: Strings.mentorship,
                        icon: AppImages.mentor,
                        onClicked: () {
                          Get.to(
                            () => AlumniScreen(
                              checkMentor: 1,
                            ),
                          );
                        }),
                  ],
                )
              : const SizedBox(),
          AppConstants.appName != 'TLE'
              ? Column(
                  children: [
                    Divider(
                      height: 1.h,
                    ),
                    _buildMoreItem(
                        title: Strings.gallery,
                        icon: AppImages.gallery,
                        onClicked: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const GalleryScreen();
                          }));
                        }),
                  ],
                )
              : const SizedBox(),
          AppConstants.appName == 'IOBM'
              ? Column(
                  children: [
                    Divider(
                      height: 1.h,
                    ),
                    _buildMoreItem(
                        title: Strings.alumniCard,
                        icon: AppImages.applyCard,
                        onClicked: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const AlumniCardScreen();
                          }));
                        }),
                  ],
                )
              : Container(),
          Divider(thickness: 5.h, height: 2.h, color: AppColor.greyshade200),
          AppConstants.appName != 'TLE'
              ? _buildMoreItem(
                  title: Strings.alumnielection,
                  icon: AppImages.electionicon,
                  onClicked: () {
                    Get.to(
                      () => const AlumniElectionScreen(),
                    );
                  },
                )
              : const SizedBox(),
          Divider(
            height: 1.h,
          ),
          // _buildMoreItem(
          //     title: 'Campus Details',
          //     icon: 'assets/icons/vote.png',
          //     onClicked: () {}),
          // Divider(
          //   height: 1.h,
          // ),
          _buildMoreItem(
            title: Strings.networking,
            icon: AppImages.networking,
            onClicked: () async {
              if (Platform.isAndroid) {
                final status = await Permission.locationWhenInUse.request();

                if (status == PermissionStatus.granted) {
                  Get.to(() => const NetWorkingScreen());
                  // print('Permission granted');
                } else if (status == PermissionStatus.denied) {
                  await Fluttertoast.showToast(
                      msg: 'Turn on your GPS location');
                  //   print(
                  //     'Denied. Show a dialog with a reason and again ask for the permission.');
                } else if (status == PermissionStatus.permanentlyDenied) {
                  await openAppSettings();
                  //   print('Take the user to the settings page.');
                }
              } else {
                Get.to(() => const NetWorkingScreen());
              }
            },
          ),
          AppConstants.appName != "TLE"
              ? Column(
                  children: [
                    Divider(
                      height: 1.h,
                    ),
                    Center(
                      child: ListTile(
                        minVerticalPadding: 10.h,
                        contentPadding: const EdgeInsets.only(left: 7.0),
                        title: Row(
                          children: [
                            Icon(
                              (Icons.video_collection),
                              size: 24.h,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              Strings.youtubechannel,
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(14),
                              ),
                            ),
                          ],
                        ),
                        trailing: const Icon(
                          Icons.keyboard_arrow_right,
                          color: AppColor.black,
                        ),
                        onTap: () {
                          Get.to(
                            () => const YoutubeChannelScreen(),
                          );
                        },
                        dense: true,
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          Divider(thickness: 5.h, height: 2.h, color: AppColor.greyshade200),
          _buildMoreItem(
              title: Strings.myAccount,
              icon: AppImages.myprofile,
              onClicked: () {
                Get.to(() => const ProfileOptionsView());
              }),
          Divider(
            height: 1.h,
          ),
          AppConstants.appName == 'TLE'
              ? Column(
                  children: [
                    _buildMoreItem(
                        title: Strings.advertise,
                        icon: AppImages.aboutus,
                        onClicked: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const FeedBack();
                          }));
                        }),
                    Divider(
                      height: 1.h,
                    ),
                  ],
                )
              : Container(),
          Center(
            child: ListTile(
              minVerticalPadding: 10.h,
              contentPadding: const EdgeInsets.only(left: 7.0),
              title: Row(
                children: [
                  // Icon(
                  //   (Icons.info),
                  //   size: 24.w,
                  // ),
                  SizedBox(
                    width: 2.w,
                  ),
                  SvgPicture.asset(
                    AppImages.help,
                    height: 21.h,
                    width: 21.w,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Text(
                    Strings.help,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                    ),
                  ),
                ],
              ),
              trailing: const Icon(
                Icons.keyboard_arrow_right,
                // size: ,
                color: AppColor.black,
              ),
              onTap: () {
                Get.to(() => const AboutOptionsView());
              },
              dense: true,
            ),
          ),
          Divider(
            height: 1.h,
          ),
        ]),
      ),
    );
  }

  _buildMoreItem({
    String? title,
    String? icon,
    VoidCallback? onClicked,
  }) {
    return Center(
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 10.0),
        title: Row(
          children: [
            SvgPicture.asset(
              icon!,
              height: 20.h,
              width: 20.w,
              // color: AppColor.black,
            ),
            SizedBox(
              width: 12.w,
            ),
            Text(title!,
                style: TextStyle(
                  // //Family: 'Nunito',
                  fontSize: ScreenUtil().setSp(14),
                )),
          ],
        ),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
          color: AppColor.black,
        ),
        onTap: onClicked,
        dense: true,
        minVerticalPadding: 10.h,
        // visualDensity: VisualDensity(vertical: 5),
      ),
    );
  }
}
