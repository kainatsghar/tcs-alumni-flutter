import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/more/career/opening_job_screen.dart';
import 'package:iobm/Views/more/career/post_job_screen.dart';

import 'package:iobm/Widgets/sec_appbar.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';

import 'package:iobm/utils/strings.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/text_styles.dart';

class CareerScreen extends StatefulWidget {
  const CareerScreen({Key? key}) : super(key: key);

  @override
  CareerScreenState createState() => CareerScreenState();
}

class CareerScreenState extends State<CareerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecAppBar(
        title: const Text(Strings.careers),
        context: context,
      ),
      body: Column(
        children: [
          _buildMoreItem(
            title: 'Job Postings',
            onClicked: () {
              Get.to(() => JobOpening());
            },
          ),
          Divider(
            height: 1.h,
          ),
          AppConstants.appName == "BOSS"
              ? _beconhouse(
                  title: 'Beaconhouse Jobs',
                  onClicked: () async {
                    if (await canLaunch(
                        "https://beaconhousetimes.net/careers")) {
                      await launch(
                        "https://beaconhousetimes.net/careers",
                        forceSafariVC: false,
                        forceWebView: false,
                        headers: <String, String>{
                          'my_header_key': 'my_header_value'
                        },
                      );
                    } else {
                      throw 'Could not launch ${AppConstants.privacyUrl}';
                    }
                  },
                )
              : const SizedBox(),
          Divider(
            height: 1.h,
          ),
          _postJob(
            title: 'Post a Job',
            onClicked: () {
              Get.to(
                () => const PostJobScreen(
                  designation: "",
                  company: "",
                  dueDate: "",
                  jobLink: "",
                  jobID: "",
                ),
              );
            },
          ),
          Divider(
            height: 1.h,
          ),
          //JOb opening container
        ],
      ),
    );
  }

  Widget _buildMoreItem({
    String? title,
    VoidCallback? onClicked,
  }) {
    return Center(
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 7.0),
        title: Row(
          children: [
            SvgPicture.asset(AppImages.jobopening,height: 18.h,width: 18.w,color: AppColor.primaryColor,),
            SizedBox(
              width: 10.w,
            ),
            Text(
              title ?? '',
              style: CustomTextStyles.text14SemiBoldW600,
            ),
          ],
        ),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
          color: AppColor.black,
        ),
        onTap: onClicked,
        dense: true,
      ),
    );
  }

  Widget _beconhouse({
    String? title,
    VoidCallback? onClicked,
  }) {
    return Center(
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 7.0),
        title: Row(
          children: [
            Icon(
              (Icons.list_alt),
              size: 22.h,
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              title ?? '',
              style: CustomTextStyles.text14SemiBoldW600,
            ),
          ],
        ),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
          color: AppColor.black,
        ),
        onTap: onClicked,
        dense: true,
      ),
    );
  }
  Widget _postJob({
    String? title,
    VoidCallback? onClicked,
  }) {
    return Center(
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 7.0),
        title: Row(
          children: [
            SvgPicture.asset(AppImages.postjob,height: 18.h,width: 18.w,color: AppColor.primaryColor,),
            SizedBox(
              width: 10.w,
            ),
            Text(
              title ?? '',
              style: CustomTextStyles.text14SemiBoldW600,
            ),
          ],
        ),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
          color: AppColor.black,
        ),
        onTap: onClicked,
        dense: true,
      ),
    );
  }
}
