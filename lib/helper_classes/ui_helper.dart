import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iobm/helper_classes/alert_message.dart';
import 'package:iobm/helper_classes/success_alert.dart';
import 'package:iobm/utils/app_color.dart';

import 'api_calling_alert.dart';
import 'app_update_alerts.dart';
import 'error_alert.dart';

class UIHelper {
  static String capitalize(String string) {
    if (string.isEmpty) {
      return string;
    }
    return string[0].toUpperCase() + string.substring(1);
  }

  static GestureDetector blueButton(String title, action) {
    return GestureDetector(
      onTap: () {
        action();
      },
      child: Container(
        height: 45.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(10.w)),
        child: Center(
          child: Text(
            "$title",
            // style: MyStyles.semi14White(),
          ),
        ),
      ),
    );
  }

  static apiCallingAlert(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const ApiCallingAlert();
        });
  }

  static Widget waitProgress(double width, double height) {
    return Center(
      child: SizedBox(
        height: width,
        width: height,
        child: const CircularProgressIndicator(
          color: AppColor.primaryColor,
        ),
      ),
    );
  }

  static hideApiCallingAlert(context) {
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }

  static showErrorAlert(context, msg, {action}) {
    showDialog(
        context: context, builder: (_) => ErrorAlert(msg, action: action));
  }

  static showAlertMessage(context, msg, {action}) {
    showDialog(
        context: context, builder: (_) => AlertMessage(msg, action: action));
  }

  static showSuccessAlert(context, msg, action) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => SuccessAlert(
        msg,
        action,
      ),
    );
  }

  static showSuccessAlertWithAction(context, msg, action) {
    showDialog(
      context: context,
      builder: (_) => SuccessAlertWithAction(msg, action),
    );
  }

  static showOptionalUpdateAlert(BuildContext context, msg) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return OptionalUpdateAlertScreen(msg);
        });
  }

  static showForceUpdateAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const ForceUpdateScreen();
        });
  }

  static bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(em);
  }

  static String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }
}
