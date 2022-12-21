import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iobm/Widgets/custom_widgets.dart';
import 'package:iobm/utils/app_color.dart';

class ReportPostScreen extends StatefulWidget {
  const ReportPostScreen({Key? key}) : super(key: key);

  @override
  _ReportPostScreenState createState() => _ReportPostScreenState();
}

class _ReportPostScreenState extends State<ReportPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidget.reportAppBar(
          context: context,
          title: "Report",
          actionText: "Submit",
          onSubmitPressed: () {
            print("Report Submitted");
          }),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        color: AppColor.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          style: const TextStyle(
              // fontFamily: 'Nunito'
          ),
          decoration: InputDecoration.collapsed(
              hintText: 'Write Some details here...',
              hintStyle: TextStyle(
                  // //Family: 'Nunito',
                  fontSize: 15.sp)),
          maxLines: 10,
        ),
      ),
    );
  }
}
