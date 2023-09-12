import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iobm/Views/login_screen.dart';
import 'package:iobm/controllers/on_boarding_controller.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_images.dart';

class IntroScreen extends StatelessWidget {
  final _controller = Get.put(OnBoardingController());

  IntroScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              child: Container(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  AppImages.topper1,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            PageView.builder(
              controller: _controller.pageController,
              onPageChanged: _controller.selectedPageIndex,
              itemCount: _controller.onBoardingPages.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      _controller.onBoardingPages[index].imageAsset,
                      height: 150.h,
                      width: 150.w,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      _controller.onBoardingPages[index].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(22),
                        fontWeight: FontWeight.w500,
                        color: AppColor.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        _controller.onBoardingPages[index].description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(16),
                          fontWeight: FontWeight.w500,
                          color: AppColor.black54,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Positioned(
              bottom: 20,
              child: Row(
                children: List.generate(
                  _controller.onBoardingPages.length,
                  (index) => Obx(() {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _controller.selectedPageIndex.value == index
                            ? AppColor.primaryColor
                            : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
              ),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: GestureDetector(
                onTap: () {
                  _controller.forwardAction();
                },
                child: Obx(() {
                  return Text(
                    _controller.isLastPage == false ? 'Next' : '',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: AppColor.primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  );
                }),
              ),
            ),
            Positioned(
              left: 20,
              bottom: 20,
              child: GestureDetector(
                onTap: () {
                  Get.offUntil(GetPageRoute(page: () => const LoginScreen()),
                          (route) => false);
                },
                child: Obx(() {
                  return Text(
                    _controller.isLastPage == false ? 'Skip' : '',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: AppColor.primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  );
                }),
              ),
            ),
             Positioned(
              bottom: 90,
              child: GestureDetector(
                onTap: () {
                  Get.offUntil(GetPageRoute(page: () => const LoginScreen()),
                          (route) => false);
                },
                child: Obx(() {
                  return _controller.isLastPage == true ? Container(
                    decoration:  BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                      child: Text(
                         'GET STARTED',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ) : const SizedBox();
                }),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
