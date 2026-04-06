import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controllers/consultancyController.dart';
import '../../../utils/app_color.dart';
import '../../../utils/strings.dart';
import '../../../utils/text_styles.dart';
import '../../Models/PartnerModel.dart';

class ConsultancyDetailScreen extends StatelessWidget {
  const ConsultancyDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ConsultancyController>();
    final PartnerModel partner = Get.arguments as PartnerModel;

    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          partner.name,
          style: CustomTextStyles.text14SemiBoldW600.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Overview Section
            _buildSectionTitle(Strings.overview),
            SizedBox(height: 10.h),
            _buildCard(
              child: Text(
                partner.overview ?? 'No overview available.',
                style: CustomTextStyles.text12RegularW400.copyWith(
                  color: Colors.grey[700],
                  height: 1.5,
                ),
              ),
            ),
            SizedBox(height: 20.h),

            // Services Offered Section
            if (partner.services != null && partner.services!.isNotEmpty) ...[
              _buildSectionTitle(Strings.servicesOffered),
              SizedBox(height: 10.h),
              _buildCard(
                child: Column(
                  children: partner.services!
                      .asMap()
                      .entries
                      .map(
                        (entry) => Column(
                      children: [
                        _buildServiceTile(entry.value),
                        if (entry.key < partner.services!.length - 1)
                          Divider(
                            height: 1,
                            color: Colors.grey[200],
                          ),
                      ],
                    ),
                  )
                      .toList(),
                ),
              ),
              SizedBox(height: 20.h),
            ],

            // Countries We Cover Section
            if(partner.tags.isNotEmpty)
            _buildSectionTitle(Strings.CountriesWeCover),
            SizedBox(height: 10.h),
            if(partner.tags.isNotEmpty)
            _buildCard(
              child: Row(
                children: partner.tags
                    .map(
                      (flag) => Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: Text(
                      flag,
                      style: TextStyle(fontSize: 32.sp),
                    ),
                  ),
                )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: CustomTextStyles.text16SemiBoldW600.copyWith(
        color: Colors.black87,
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildServiceTile(ServiceModel service) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              color: AppColor.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              service.icon,
              color: AppColor.primaryColor,
              size: 18.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              service.title,
              style: CustomTextStyles.text12SemiBoldW600.copyWith(
                color: Colors.black87,
              ),
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: Colors.grey[400],
            size: 20.sp,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Chat Button
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.chat_bubble_outline,
                  size: 16.sp, color: AppColor.primaryColor),
              label: Text(
                Strings.chat,
                style: CustomTextStyles.text12SemiBoldW600.copyWith(
                  color: AppColor.primaryColor,
                ),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColor.primaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 12.h),
              ),
            ),
          ),
          SizedBox(width: 8.w),

          // Call Button
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.call_outlined,
                  size: 16.sp, color: AppColor.primaryColor),
              label: Text(
                Strings.call,
                style: CustomTextStyles.text12SemiBoldW600.copyWith(
                  color: AppColor.primaryColor,
                ),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColor.primaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 12.h),
              ),
            ),
          ),
          SizedBox(width: 8.w),

        ],
      ),
    );
  }
}