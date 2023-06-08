import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iobm/Views/more/profile_screen.dart';
import 'package:iobm/Views/notifications_screen.dart';
import 'package:iobm/Widgets/custom_widgets.dart';
import 'package:iobm/controllers/profile_controller.dart';
import 'package:get/get.dart';

import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/text_styles.dart';

class SecAppBar extends AppBar {
  final ProfileController controller = Get.put(ProfileController());
  SecAppBar({
    Key? key,
    required Widget title,
    Widget? shape,
    required BuildContext context,
  }) : super(
          key: key,
          title: title,
          backgroundColor: AppColor.primaryColor,
          elevation: 0,
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
          shape: Border(
            bottom: BorderSide(color: AppColor.secAppBar, width: 3.w),
          ),
          centerTitle: true,
          titleTextStyle: CustomTextStyles.text16SemiBoldW600,
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                CustomWidget.checkInDialog(context: context);
              },
              child: Container(
                color: AppColor.transparent,
                child: Icon(
                  Icons.gps_fixed,
                  size: 22.h,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const NotificationsView());
                },
                child: SizedBox(
                  height: 30.h,
                  width: 30.w,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(Icons.notifications,size: 22.h,color: AppColor.iconColor,),
                      GetBuilder<ProfileController>(
                        init: ProfileController(),
                        builder: (_) {
                          return _.notificationCount == 0
                              ? Container()
                              : Positioned(
                            right: 0,
                            top: 3,
                            child: Container(
                              height: 18.h,
                              width: 18.w,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: GetBuilder<ProfileController>(
                                  init: ProfileController(),
                                  builder: (_) => Text(
                                    '${_.notificationCount}',
                                    style: TextStyle(
                                      color: AppColor.white,
                                      fontSize: ScreenUtil().setSp(12),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
}
