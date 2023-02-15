import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:iobm/helper_classes/ui_helper.dart';

import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';

import 'package:iobm/networkcalls/response_models/apply_for_card_model.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AlumniCardScreen extends StatefulWidget {
  const AlumniCardScreen({Key? key}) : super(key: key);

  @override
  _AlumniCardScreenState createState() => _AlumniCardScreenState();
}

class _AlumniCardScreenState extends State<AlumniCardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('its there bro');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alumni Card',
          style: TextStyle(color: AppColor.white),
        ),
        shape: Border(
          bottom: BorderSide(color: AppColor.secAppBar, width: 3.w),
        ),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: ScreenUtil().setSp(18),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  shape: const StadiumBorder(),
                  side: const BorderSide(width: 1, color: AppColor.white)),
              onPressed: () {
                print('you applied bro');
                cardApplyCall();
              },
              child: const Text(
                'Apply for Card',
                style: TextStyle(color: AppColor.white),
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        // child: SfPdfViewer.network(AppConstants.pdf),
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   // child: Container(
      //   //   child: Column(
      //   //     crossAxisAlignment: CrossAxisAlignment.start,
      //   //     children: [
      //   //       Text('IoBM Alumni Card From (Responses)',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600),),
      //   //       SizedBox(height: 3.h,),
      //   //       Text('Welcome back to IoBM!',style: TextStyle(fontSize: 13.sp,color: AppColor.grey),),
      //   //       SizedBox(height: 10.h,),
      //   //       Text('Your Alumni Card will be given you access to:',style: TextStyle(fontSize: 13.sp,color: AppColor.grey),),
      //   //
      //   //     ],
      //   //   ),
      //   // ),
      // ),
    );
  }

  // Future<void> cardApply() async {
  //
  //   var response = await ApiCalls.applyCard(
  //     userId: AppConstants.myId,
  //   );
  //
  //   DataFetched dataFetched = await ApiHelper.cardApply(context);
  //   print(dataFetched.done);
  //   if (dataFetched.done) {
  //
  //   }
  // }

  cardApplyCall() async {
    UIHelper.apiCallingAlert(context);
    var response = await ApiCalls.applyCard(userId: AppConstants.myId);
    UIHelper.hideApiCallingAlert(context);
    if (response is ErrorEntity) {
      print(response.message);
    } else {
      ApplyForCardModel applyForCardModel =
      ApplyForCardModel.fromJson(jsonEncode(response));
      print(applyForCardModel.success);
      if (applyForCardModel.success == 1) {
        print(applyForCardModel.message);
        UIHelper.showAlertMessage(context, applyForCardModel.message,action: (){
          Get.back();
          Get.back();
        });
      }
    }
  }
}
