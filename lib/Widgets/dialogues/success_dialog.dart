import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iobm/Widgets/custom_widgets.dart';
import 'package:iobm/utils/app_color.dart';

import '../../helper_classes/ui_helper.dart';
import '../../models/data_fetched.dart';
import '../../networkcalls/api_helper.dart';

class SucessDialog extends StatefulWidget {
  final String? icon;
  final String? title;
  final String? dText;
  final String? btnText;
  final String? id;

  const SucessDialog(
      {Key? key, this.icon, this.dText, this.btnText, this.title, this.id})
      : super(key: key);

  @override
  _SucessDialogState createState() => _SucessDialogState();
}

class _SucessDialogState extends State<SucessDialog> {
  @override
  Widget build(context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      content: Container(
        height: 350,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1.5,
            color: AppColor.secAppBar,
          ),
          // boxShadow: [
          //   CustomBoxShadow(
          //     color: AppColors.inputBorderColor,
          //     blurRadius: 5.0,
          //     blurStyle: BlurStyle.outer,
          //   )
          // ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const Spacer(),
              Container(
                // padding: const EdgeInsets.all(20),
                child: Image.asset(
                  widget.icon!,
                  height: 100.h,
                  width: 100.h,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(widget.title!,
                  style:
                      TextStyle(fontSize: 20.sp, color: AppColor.primaryColor)),
              // const Spacer(),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  widget.dText!,
                  style:  TextStyle(
                      fontSize: 12, color: AppColor.primaryColor),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomWidget.dialogButton(
                      isBorderColor: true,
                      name: 'Cancel',
                      onClicked: () {
                        Navigator.pop(context);
                      }),
                  SizedBox(
                    width: 20.w,
                  ),
                  CustomWidget.dialogButton(
                      isBorderColor: false,
                      name: 'Delete',
                      onClicked: () {
                        delWorkCall(widget.id);
                      }),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              // const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> delWorkCall(workId) async {
    DataFetched dataFetched = await ApiHelper.delWorkOrder(workId);

    if (dataFetched.done) {
      print('deleted Work order');
      UIHelper.showAlertMessage(context, 'Work Order Deleted Successfully.',action: (){
        Get.back();
        Get.back();
        Get.back();
        Get.back();
      });
    }
  }
}
