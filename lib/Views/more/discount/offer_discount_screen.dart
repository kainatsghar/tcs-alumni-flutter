import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:iobm/Widgets/custom_widgets.dart';
import 'package:iobm/helper_classes/ui_helper.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/response_models/insert_offer_entity.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/strings.dart';

import '../../../utils/text_styles.dart';

class OfferDiscount extends StatefulWidget {
  const OfferDiscount({Key? key}) : super(key: key);

  @override
  OfferDiscountState createState() => OfferDiscountState();
}

class OfferDiscountState extends State<OfferDiscount> {
  final TextEditingController _detailsController = TextEditingController();
  GlobalKey<FormState> fKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
          Strings.offerediscount,
          style: CustomTextStyles.text16SemiBoldW600,
        ),
        shape: Border(
          bottom: BorderSide(color: AppColor.secAppBar, width: 3.w),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Form(
            key: fKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 70,
                ),
                Text(
                  'Please enter details of discount',
                  style: CustomTextStyles.text14SemiBoldW600.copyWith(color: AppColor.primaryColor,),
                ),
                SizedBox(
                  height: 12.h,
                ),
                TextFormField(
                  controller: _detailsController,
                  style: CustomTextStyles.text12RegularW400,
                  validator: (value) {
                    return value!.isEmpty
                        ? 'Please Enter Discount Information'
                        : value.length < 30
                            ? 'Discount information should be at least 30 characters '
                            : null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Discount Details here',
                    hintStyle: CustomTextStyles.text12RegularW400,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                    border: OutlineInputBorder(
                      borderSide:
                           BorderSide(color: AppColor.primaryColor),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    enabledBorder:  OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.primaryColor)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                             BorderSide(color: AppColor.primaryColor),
                        borderRadius: BorderRadius.circular(5.r)),
                  ),
                  maxLines: 8,
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomWidget.myButton(
                  name: AppConstants.submit,
                  isBorder: false,
                  onClicked: () {
                    FocusScope.of(context).unfocus();
                    if (fKey.currentState!.validate()) {
                      addDiscountDetails();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addDiscountDetails() async {
    UIHelper.apiCallingAlert(context);
    var response = await ApiCalls.insertDiscount(
      userId: AppConstants.myId,
      message: _detailsController.text,
    );
    UIHelper.hideApiCallingAlert(context);
    if (response is ErrorEntity) {
      print(response.message);
    } else {
      InsertOfferEntity offerEntity = InsertOfferEntity().fromJson(response);
      if (offerEntity.success == 1) {
        showDialog(
          context: context,
          builder: (builder) => Dialog(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alert',
                    style: CustomTextStyles.text14SemiBoldW600,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    offerEntity.message,
                    style: CustomTextStyles.text12RegularW400,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                    width: 50,
                    child: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Center(
                          child: Text(
                            "OK",
                            style: CustomTextStyles.text12SemiBoldW600.copyWith(color: AppColor.primaryColor,),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ).then((value) => Get.back());
      }
    }
  }
}
