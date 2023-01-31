import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/text_styles.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          shape: Border(bottom: BorderSide(color: AppColor.secAppBar, width: 3.w)),
          backgroundColor: AppColor.primaryColor,
          title: Text(
            'Privacy Policy',
            style: CustomTextStyles.text16SemiBoldW600,
          )),
      body: const WebView(
        initialUrl: AppConstants.privacyUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
