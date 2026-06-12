import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iobm/Widgets/app_bar.dart';
import 'package:iobm/Widgets/sec_appbar.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/strings.dart';
import 'package:iobm/utils/text_styles.dart';

class AlumniElectionScreen extends StatefulWidget {
  const AlumniElectionScreen({Key? key}) : super(key: key);

  @override
  _AlumniElectionScreenState createState() => _AlumniElectionScreenState();
}

class _AlumniElectionScreenState extends State<AlumniElectionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        appBar: SecAppBar(
          title: const Text(Strings.election),
          context: context,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                AppImages.nomiElection,
                height: 180.h,
                width: 180.w,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "We are not accepting nomination at this point",
              style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.primaryColor,),
            ),
          ],
        ),
      ),
    );
  }
}
