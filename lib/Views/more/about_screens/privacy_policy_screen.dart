import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/text_styles.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  late final WebViewController _controller;


  @override
  void initState() {
    _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(AppConstants.privacyUrl));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          shape: Border(bottom: BorderSide(color: AppColor.secAppBar, width: 3.w)),
          backgroundColor: AppColor.primaryColor,
          titleTextStyle: CustomTextStyles.text16SemiBoldW600,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 22.h,
              color: AppColor.white,
            ),
          ),
          title: Text(
            'Privacy Policy',
            style: CustomTextStyles.text16SemiBoldW600,
          )),
      body: WebViewWidget(controller: _controller),
    );
  }

}
