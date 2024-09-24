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
import 'package:iobm/utils/app_images.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/text_styles.dart';

class MyAppBar extends AppBar {
  final ProfileController controller = Get.put(ProfileController());
  MyAppBar({
    Key? key,
    required Widget title,
    required BuildContext context,
  }) : super(
          key: key,
          title: title,
          backgroundColor: AppColor.primaryColor,
          elevation: 0,
          shape: Border(
            bottom: BorderSide(color: AppColor.secAppBar, width: 4.w),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Get.to(
                  () => ProfileScreen(
                    userID: AppConstants.myId,
                  ),
                );
              },
              child: GetBuilder<ProfileController>(
                builder: (_) {
                  return Hero(
                    tag: 'photo',
                    child: CircleAvatar(
                      child: _.image == ''
                          ? Image(
                              image: const AssetImage(AppImages.profile),
                              width: 80.w,
                              height: 80.h,
                            )
                          : CachedNetworkImage(
                              imageUrl: _.image ?? '',
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: 80.w,
                                height: 80.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  //   color: AppColor.white,
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      CircularProgressIndicator(
                                          value: downloadProgress.progress),
                              errorWidget: (context, url, error) =>
                                  CircleAvatar(
                                //profile image
                                backgroundColor: AppColor.white,
                                backgroundImage:
                                    const AssetImage(AppImages.profile),
                                radius: 33.r,
                              ),
                            ),
                      radius: 33.r,
                      backgroundColor: AppColor.black,
                    ),
                  );
                },
              ),
            ),
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
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            // GestureDetector(
            //   onTap: () {
            //     Get.to(() => const NotificationsView());
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.only(right: 15),
            //     child: Stack(
            //       alignment: Alignment.center,
            //       children: [
            //         const Icon(Icons.notifications),
            //       ],
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: GetBuilder<ProfileController>(builder: (_){
                return GestureDetector(
                  onTap: () async {
                    _.notificationCount = 0;
                    _.update();
                    SharedPreferences localStorage = await SharedPreferences.getInstance();
                    localStorage.remove('count');
                    Get.to(() => const NotificationsView());
                  },
                  child: Container(
                    height: 30.h,
                    width: 30.w,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Badge(
                            isLabelVisible: _.notificationCount == 0
                                ? false: true,
                            label: GetBuilder<ProfileController>(
                              init: ProfileController(),
                              builder: (_) => Text(
                                '${_.notificationCount}',
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 10.sp,
                                ),
                              ),
                            ),
                            child: Icon(Icons.notifications, size: 22.h, color: AppColor.iconColor,)),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        );
}
