import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iobm/utils/app_color.dart';

class ReferralRequestScreen extends StatefulWidget {
  const ReferralRequestScreen({Key? key}) : super(key: key);

  @override
  _ReferralRequestScreenState createState() => _ReferralRequestScreenState();
}

class _ReferralRequestScreenState extends State<ReferralRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          titleSpacing: 0,
          shape: Border(bottom: BorderSide(color: Colors.yellow, width: 4.w)),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.white,
            ),
          ),
          title: const Text(
            'Referral Request',
            style: TextStyle(
                // //Family: 'Nunito',
                // fontWeight: FontWeight.w600
            ),
          )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColor.redshade900,
          child: const ImageIcon(
            AssetImage('assets/icons/add.png'),
            color: AppColor.white,
          )),
    );
  }
}
