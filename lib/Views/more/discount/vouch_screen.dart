import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iobm/Widgets/app_bar.dart';
import 'package:iobm/Widgets/custom_widgets.dart';
import 'package:iobm/Widgets/sec_appbar.dart';
import 'package:iobm/utils/app_color.dart';

class VouchScreen extends StatefulWidget {
  @override
  VouchScreenState createState() => VouchScreenState();
}

class VouchScreenState extends State<VouchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecAppBar(
        title: const Text('Vouch by 365'),
        context: context,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // pushNewScreen(context, screen: OfferDiscount(),
            // withNavBar: false);
          },
          backgroundColor: AppColor.primaryColor,
          child: const ImageIcon(
            AssetImage('assets/icons/add.png'),
            color: AppColor.white,
          )),
      body: Container(
        padding: EdgeInsets.all(12.0),
        color: AppColor.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text:
                          'For Vouch365 subscription information contact the alumni affairs  ',
                      style: TextStyle(
                          // //Family: 'Nunito',
                          fontSize: 15.sp,
                          color: AppColor.black)),
                  TextSpan(
                      text: '(WhatsApp no)',
                      style: TextStyle(
                          // //Family: 'Nunito',
                          color: Colors.greenAccent.shade400))
                ])),
          ],
        ),
      ),
    );
  }
}
