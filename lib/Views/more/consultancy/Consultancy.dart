import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/more/consultancy/volunteeringPartnerDetails.dart';
import '../../../controllers/consultancyController.dart';
import '../../../utils/app_color.dart';
import '../../../utils/strings.dart';
import '../../../utils/text_styles.dart';
import '../../Models/PartnerModel.dart';
import 'consultancyDetailScreen.dart';

class Consultancy extends StatelessWidget {
  const Consultancy({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ConsultancyController());

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
          Strings.partners,
          style: CustomTextStyles.text14SemiBoldW600.copyWith(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.mark_email_unread_rounded,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          SizedBox(width: 4.w),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10.h),
          _buildTabBar(controller),
          Expanded(
            child: Obx(() {
              final isEducation = controller.selectedTab.value == 0;
              final partners = isEducation
                  ? controller.educationPartners
                  : controller.volunteeringPartners;
              return SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  itemCount: partners.length,
                  itemBuilder: (context, index) => isEducation
                      ? _buildEducationCard(partners[index])
                      : _buildVolunteerCard(partners[index]),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(ConsultancyController controller) {
    return Container(
      color: AppColor.white,
      padding: EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w),
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            _buildTabItem(Strings.educationPartners, 0, controller),
            _buildTabItem(Strings.volunteeringPartners, 1, controller),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(
      String label,
      int index,
      ConsultancyController controller,
      ) {
    return Expanded(
      child: Obx(() {
        final isSelected = controller.selectedTab.value == index;
        return GestureDetector(
          onTap: () => controller.changeTab(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: EdgeInsets.all(3.r),
            decoration: BoxDecoration(
              color: isSelected ? AppColor.primaryColor : AppColor.transparent,
              borderRadius: BorderRadius.circular(10.r),
            ),
            alignment: Alignment.center,
            child: Text(
              label,
              style: CustomTextStyles.text12SemiBoldW600.copyWith(
                color: isSelected ? AppColor.white : AppColor.primaryColor,
              ),
            ),
          ),
        );
      }),
    );
  }

  // ─── Education Card (with stars, Contact button) ───────────────────────────
  Widget _buildEducationCard(PartnerModel partner) {
    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAvatar(partner),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        partner.name,
                        style: CustomTextStyles.text14SemiBoldW600,
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: partner.tags
                            .map(
                              (flag) => Padding(
                            padding: EdgeInsets.only(right: 4.w),
                            child: Text(
                              flag,
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ),
                        )
                            .toList(),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        partner.subtitle,
                        style: CustomTextStyles.text12RegularW400.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 6.h),
                      _buildStarRating(partner.rating, partner.reviewCount),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.h),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.to(
                          () => const ConsultancyDetailScreen(),
                      arguments: partner,
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColor.primaryColor,
                      side: BorderSide(color: AppColor.primaryColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                    ),
                    child: Text(
                      Strings.viewDetails,
                      style: CustomTextStyles.text12SemiBoldW600.copyWith(
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      elevation: 0,
                    ),
                    child: Text(
                      Strings.contact,
                      style: CustomTextStyles.text12SemiBoldW600.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ─── Volunteer Card (Cause, Location, single View Details button) ──────────
  Widget _buildVolunteerCard(PartnerModel partner) {
    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar
                _buildAvatar(partner),
                SizedBox(width: 12.w),

                // Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        partner.name,
                        style: CustomTextStyles.text14SemiBoldW600,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        '${Strings.cause}: ${partner.cause ?? '-'}',
                        style: CustomTextStyles.text12RegularW400.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text('${Strings.location}: ${partner.location ?? '-'}',
                        style: CustomTextStyles.text12RegularW400.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      // SizedBox(height: 10.h),
                      // View Details aligned right

                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () => Get.to(
                      () => const Volunteeringpartnerdetails(),
                  arguments: partner,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  elevation: 0,
                ),
                child: Text(
                  Strings.viewDetails,
                  style: CustomTextStyles.text12SemiBoldW600.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(PartnerModel partner) {
    return Container(
        width: 56.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: const Color(0xFFE8EFFF),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: partner.imagePath != null
            ? ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.network(
            partner.imagePath!,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Icon(
              Icons.person,
              color: AppColor.primaryColor,
              size: 30.sp,
            ),
          ),
        )
            : Icon(
          partner.icon ?? Icons.business,
          color: AppColor.primaryColor,
          size: 30.sp,
        ));
        }

  Widget _buildStarRating(double rating, int? reviewCount) {
    return Row(
      children: [
        ...List.generate(5, (index) {
          final filled = index < rating.floor();
          final half = !filled && index < rating;
          return Icon(
            half
                ? Icons.star_half
                : (filled ? Icons.star : Icons.star_border),
            color: const Color(0xFFFFC107),
            size: 16.sp,
          );
        }),
        if (reviewCount != null) ...[
          SizedBox(width: 4.w),
          Text(
            '($reviewCount ${Strings.reviews})',
            style: CustomTextStyles.text12RegularW400.copyWith(
              color: Colors.grey[500],
            ),
          ),
        ],
      ],
    );
  }
}