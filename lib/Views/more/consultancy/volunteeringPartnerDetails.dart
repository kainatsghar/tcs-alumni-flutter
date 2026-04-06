import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controllers/consultancyController.dart';
import '../../../utils/app_color.dart';
import '../../../utils/strings.dart';
import '../../../utils/text_styles.dart';
import '../../Models/PartnerModel.dart';

class Volunteeringpartnerdetails extends StatelessWidget {
  const Volunteeringpartnerdetails({super.key});

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
            // _buildSectionTitle(Strings.overview),
            // SizedBox(height: 10.h),
            // _buildCard(
            //   child: Text(
            //     partner.overview ?? 'No overview available.',
            //     style: CustomTextStyles.text12RegularW400.copyWith(
            //       color: Colors.grey[700],
            //       height: 1.5,
            //     ),
            //   ),
            // ),
            Container(
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
                              Text('${Strings.focus}: Environmental Conversatios',
                                style: CustomTextStyles.text12RegularW400.copyWith(
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: 10.h),


                            ],
                          ),
                        ),
                      ],
                    ),
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                      style: CustomTextStyles.text12RegularW400.copyWith(
                        color: AppColor.black,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(children: [
                      Image.asset("assets/images/certi.png",width: 18.w,color: AppColor.primaryColor,),
                      SizedBox(width: 5,),
                      Text("Certified Partner - 5 year Record",
                        style: CustomTextStyles.text12SemiBoldW600.copyWith(
                          color: AppColor.primaryColor,
                          // fontWeight: FontWeight.bold
                        ),
                      ),

                    ],)


                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),

            // Services Offered Section



            SizedBox(
              width: double.infinity,
              child: Card(
                color: AppColor.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Active Locations", style: CustomTextStyles.text14SemiBoldW600),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 10.0, // Horizontal gap
                        runSpacing: 5.0, // Vertical gap (agar line break ho)
                        children: [
                          // Item 1
                          Row(
                            mainAxisSize: MainAxisSize.min, // Ye zaroori hai
                            children: [
                              Text('🇬🇧'),
                              SizedBox(width: 4),
                              Text('London'),
                            ],
                          ),
                          // Item 2
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('🇬🇧'),
                              SizedBox(width: 4),
                              Text('London'),
                            ],
                          ),
                          // Item 3
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('🇬🇧'),
                              SizedBox(width: 4),
                              Text('London'),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),

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
}