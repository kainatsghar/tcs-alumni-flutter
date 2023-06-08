import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/more/about_screens/privacy_policy_screen.dart';
import 'package:iobm/Views/more/about_us_screen.dart';
import 'package:iobm/Widgets/sec_appbar.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/strings.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/text_styles.dart';
import '../connect_screen.dart';
import '../faq_screen.dart';
import '../feedback_tle.dart';

class AboutOptionsView extends StatelessWidget {
  const AboutOptionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecAppBar(
        title: const Text(Strings.about),
        context: context,
      ),
      body: Column(
        children: [
          Center(
            child: ListTile(
              onTap: () {
                Get.to(() => const AboutUsScreen());
              },
              contentPadding: const EdgeInsets.only(left: 5.0),
              title: Row(
                children: [
                  Icon(
                    (Icons.info),
                    size: 26.h,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Text(
                    Strings.aboutUs,
                    style: CustomTextStyles.text14SemiBoldW600,
                  ),
                ],
              ),
              trailing: const Icon(
                Icons.keyboard_arrow_right,
                color: AppColor.black,
              ),
              dense: true,
            ),
          ),
          AppConstants.appName == 'TLE'
              ? Column(
                  children: [
                    Divider(
                      height: 1.h,
                    ),
                    Center(
                      child: ListTile(
                        onTap: () {
                          Get.to(() => const FeedBack());
                        },
                        contentPadding: const EdgeInsets.only(left: 5.0),
                        title: Row(
                          children: [
                            Icon(
                              (Icons.info),
                              size: 25.h,
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Text(
                              Strings.feedback,
                              style: CustomTextStyles.text14SemiBoldW600,
                            ),
                          ],
                        ),
                        trailing: const Icon(
                          Icons.keyboard_arrow_right,
                          color: AppColor.black,
                        ),
                        dense: true,
                      ),
                    ),
                  ],
                )
              : Container(),
          Divider(
            height: 1.h,
          ),
          _buildMoreItem(
              title: 'Contact Us',
              icon: AppImages.contactMenu,
              onClicked: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return const ConnectScreen();
                }));
              }),
          Divider(
            height: 1.h,
          ),
          _buildMoreItem(
              title: "FAQ's",
              icon: AppImages.faq,
              onClicked: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return const FaqScreen();
                }));
              }),
          Divider(
            height: 1.h,
          ),
          _buildMoreItem(
            title: 'Privacy Policy',
            icon: AppImages.privacy,
            // onClicked: () async {
            //   if (await canLaunch(AppConstants.privacyUrl)) {
            //     await launch(
            //       AppConstants.privacyUrl,
            //       forceSafariVC: true,
            //       forceWebView: true,
            //       headers: <String, String>{'my_header_key': 'my_header_value'},
            //     );
            //   } else {
            //     throw 'Could not launch ${AppConstants.privacyUrl}';
            //   }
            // },
            onClicked: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const PrivacyPolicyScreen();
                  }));
            },
          ),
          Divider(
            height: 1.h,
          ),
          Spacer(),
          Padding(
            padding:  EdgeInsets.only(bottom: 10.h,right: 10.w),
            child: InkWell(
              onTap: (){
                _launchInBrowser(AppConstants.linkMembia);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Developed by', style: CustomTextStyles.text12RegularW400.copyWith(color: Color(0xff979797)),),
                  Image.asset('assets/viion_logo.png', width: 80,height: 14,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  _buildMoreItem({
    String? title,
    String? icon,
    VoidCallback? onClicked,
  }) {
    return ListTile(
      hoverColor: AppColor.primaryColor,
      contentPadding: const EdgeInsets.only(left: 10.0),
      title: Row(
        children: [
          //  Icon(icon, color: AppColor.black, size: 22.0),
          ImageIcon(
            AssetImage(icon!),
            size: 20.h,
          ),
          SizedBox(
            width: 12.w,
          ),
          Text(title!,
              style: CustomTextStyles.text14SemiBoldW600,),
        ],
      ),
      trailing: const Icon(
        Icons.keyboard_arrow_right,
        color: AppColor.black,
      ),
      onTap: onClicked,
      dense: true,
    );
  }
}
