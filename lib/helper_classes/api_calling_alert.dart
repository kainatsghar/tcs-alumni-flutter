import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iobm/utils/app_color.dart';

class ApiCallingAlert extends StatefulWidget {
  const ApiCallingAlert({Key? key}) : super(key: key);

  @override
  _ApiCallingAlertState createState() => _ApiCallingAlertState();
}

class _ApiCallingAlertState extends State<ApiCallingAlert> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const Scaffold(
        backgroundColor: AppColor.transparent,
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(AppColor.primaryColor),
            strokeWidth: 3,
          ),
        ),
      ),
    );
  }
}
