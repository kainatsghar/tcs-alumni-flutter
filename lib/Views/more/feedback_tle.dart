import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iobm/Widgets/custom_widgets.dart';
import 'package:iobm/Widgets/sec_appbar.dart';
import 'package:iobm/helper_classes/ui_helper.dart';
import 'package:iobm/utils/strings.dart';

import '../../Widgets/widget_styles.dart';
import '../../models/data_fetched.dart';
import '../../networkcalls/api_helper.dart';
import '../../utils/app_color.dart';
class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  GlobalKey<FormState> tleKey = GlobalKey<FormState>();
  // final ProfileController _controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecAppBar(title: const Text(Strings.feedback), context: context,),
      body: _form(),
    );
  }

  Widget _form() {
    return Form(
      key: tleKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title*',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(16),
                color: AppColor.black,
              ),
              // style: GoogleFonts.poppins(
              //   color: AppColor.shadeegray,
              //   fontSize: ScreenUtil().setSp(16),
              // ),
            ),
            TextFormField(
              style: TextStyle(fontSize: 15.sp),
              cursorHeight: 15.h,
              textInputAction: TextInputAction.next,
              controller: _titleController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                return value!.isEmpty
                    ? 'Title is required' : null;
              },
              decoration: WidgetStyle.nameTextFieldDecoration(hint: 'Title here'),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Description*',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(16),
                color: AppColor.black,
              ),
              // GoogleFonts.poppins(
              //   color: AppColor.shadeegray,
              //   fontSize: ScreenUtil().setSp(16),
              // ),
            ),
            Stack(
              children: [
                TextFormField(
                  style: TextStyle(fontSize: 15.sp),
                  cursorHeight: 15.h,
                  validator: (value) {
                    return value!.isEmpty ? 'Description is required' : null;
                  },
                  controller: _descriptionController,
                  // obscureText: showPass,
                  // obscuringCharacter: '*',
                  decoration: WidgetStyle.nameTextFieldDecoration(hint: 'Description here'),
                ),
              ],
            ),
            SizedBox(height: 20.h,),

            Align(
              alignment: Alignment.bottomCenter,
              child: CustomWidget.myButton(name: 'Save', isBorder: false, onClicked: () {
                if(tleKey.currentState!.validate()){
                  tleFeedbackCall();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> tleFeedbackCall() async {
    UIHelper.apiCallingAlert(context);
    DataFetched dataFetched = await ApiHelper.tleFeedback(_titleController.text, _descriptionController.text);
    UIHelper.hideApiCallingAlert(context);
    if (dataFetched.done) {
      UIHelper.showAlertMessage(context, 'Feedback added successfully.',action: (){
        Get.back();
        Get.back();
      });
    }
  }

}
