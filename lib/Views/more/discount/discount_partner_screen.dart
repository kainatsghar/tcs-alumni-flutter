import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iobm/Views/more/discount/avail_discount_screen.dart';
import 'package:iobm/Views/more/discount/offer_discount_screen.dart';

import 'package:iobm/Widgets/sec_appbar.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/strings.dart';

class DiscountPartnerScreen extends StatefulWidget {
  const DiscountPartnerScreen({Key? key}) : super(key: key);

  @override
  _DiscountPartnerScreenState createState() => _DiscountPartnerScreenState();
}

class _DiscountPartnerScreenState extends State<DiscountPartnerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecAppBar(
        title: const Text(Strings.discounts),
        context: context,
      ),
      body: Container(
          color: AppColor.white,
          padding: const EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              //JOb opening container
              discountWidget(
                  img: AppImages.discount,
                  title: Strings.discountoffered,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const AvailDiscount();
                    }));
                  }),

              SizedBox(
                height: 15.h,
              ),
            ],
          )),
    );
  }

  discountWidget({title, img, onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 45.h,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: AppColor.greyshade200,
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ], borderRadius: BorderRadius.circular(8.r), color: AppColor.white),
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Image(
              image: AssetImage(img),
              height: 20.h,
              color: AppColor.primaryColor,
            ),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
                child: Text(
              title,
              style: TextStyle(
                  // //Family: 'Nunito',
                  fontSize: 13.sp),
            )),
            const Icon(Icons.keyboard_arrow_right)
          ],
        ),
      ),
    );
  }
}
