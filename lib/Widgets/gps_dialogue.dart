import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/Alumni_Card/alumniCard.dart';
import 'package:iobm/Views/more/business_directory/business_card_screen.dart';
import 'package:iobm/Views/report_screen.dart';
import 'package:iobm/Widgets/custom_widgets.dart';
import 'package:iobm/Widgets/widget_styles.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/strings.dart';

//report Dialogue

//delete Dialogue

class DeleteDialogue extends StatefulWidget {
  const DeleteDialogue({Key? key}) : super(key: key);

  @override
  _DeleteDialogueState createState() => _DeleteDialogueState();
}

class _DeleteDialogueState extends State<DeleteDialogue> {
  @override
  Widget build(BuildContext context) {
    return (AlertDialog(
      title: Text(
        'Are you sure you want to delete this post?',
        style: TextStyle(
            // fontFamily: 'Nunito',
            fontSize: 13.sp),
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomWidget.myButton(
                name: Strings.nO,
                isBorder: false,
                size: Size(65.w, 25.h),
                onClicked: () {}),
            SizedBox(
              width: 8.w,
            ),
            CustomWidget.myButton(
                name: 'Yes ',
                isBorder: false,
                size: Size(65.w, 25.h),
                onClicked: () {})
          ],
        ),
        SizedBox(
          height: 10.h,
        )
      ],
    ));
  }
}

/* apply Via Linked In */

//*** Apply For Card */
class ApplyForCard extends StatefulWidget {
  ApplyForCard({required this.img, this.name, this.email, this.id});
  Widget img;
  String? name;
  String? email;
  String? id;

  @override
  _ApplyForCardState createState() => _ApplyForCardState();
}

class _ApplyForCardState extends State<ApplyForCard> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 16,
      child: Container(
        height: 400.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              infoWidget(
                img: widget.img,
                name: widget.name,
                email: widget.email,
                id: widget.id,
                onPressed: () {
                  Get.back();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const AlumniCardScreen();
                  }));
                },
              ),
              Container(
                height: 4,
                color: AppColor.black87,
              ),
              Container(
                child: Image.asset(
                  AppImages.qrcode,
                  height: 150,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  infoWidget({
    img,
    name,
    email,
    id,
    onPressed,
  }) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4), topRight: Radius.circular(4))),
      height: 220.h,
      width: double.infinity.w,
      child: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  img,
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                        // fontFamily: 'Nunito',
                        fontSize: 16,
                        color: AppColor.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    email,
                    style: WidgetStyle.semiBoldText(
                        color: AppColor.white, fontSize: 12.0.sp),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    "Alumni ID.$id",
                    style: WidgetStyle.semiBoldText(
                        color: AppColor.white, fontSize: 12.0.sp),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  CustomWidget.myButton(
                      name: "Apply for Card",
                      isBorder: true,
                      size: Size(130.w, 30.h),
                      onClicked: onPressed),
                ],
              ),
            ),
          ),
          Positioned(
              child: Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.clear,
                  color: AppColor.white,
                )),
          ))
        ],
      ),
    );
  }
}
