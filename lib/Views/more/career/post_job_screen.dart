import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:iobm/Views/more/career/career_screen.dart';
import 'package:iobm/Widgets/app_bar.dart';
import 'package:iobm/Widgets/custom_widgets.dart';
import 'package:iobm/Widgets/sec_appbar.dart';
import 'package:iobm/Widgets/widget_styles.dart';
import 'package:iobm/helper_classes/ui_helper.dart';
import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/response_models/insert_job_entity.dart';
import 'package:iobm/utils/app_color.dart';

import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/strings.dart';

class PostJobScreen extends StatefulWidget {
  final String? designation;
  final String? company;
  final String? jobLink;
  final String? dueDate;
  final String? jobID;
  const PostJobScreen({
    Key? key,
    this.designation,
    this.company,
    this.dueDate,
    this.jobLink,
    this.jobID,
  }) : super(key: key);

  @override
  _PostJobScreenState createState() => _PostJobScreenState();
}

class _PostJobScreenState extends State<PostJobScreen> {
  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _jobLinkController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();
  GlobalKey<FormState> fKey = GlobalKey<FormState>();

  DateTime? postSelectedDate;

  Future<void> _selectPostDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 200),
      ),
    );
    if (picked != null && picked != postSelectedDate) postSelectedDate = picked;

    setDate();
  }

  void setDate() {
    setState(() {
      if (postSelectedDate == null) {
      } else {
        _dueDateController.text =
            DateFormat("dd/MM/yyyy").format(postSelectedDate!).toString();
      }
    });
  }

  @override
  void initState() {
    _designationController.text = widget.designation ?? '';
    _dueDateController.text = widget.dueDate ?? '';
    _jobLinkController.text = widget.jobLink ?? "";
    _companyController.text = widget.company ?? "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: SecAppBar(
          title: const Text(Strings.postajob),
          context: context,
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: SingleChildScrollView(
            child: Form(
              key: fKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleRow(title: 'Designation', star: "*"),
                    designationTextField(),
                    SizedBox(height: 15.h),
                    titleRow(title: 'Company', star: "*"),
                    companyTextField(),
                    SizedBox(height: 15.h),
                    titleRow(title: 'Job Link', star: "*"),
                    jobLinkTextField(),
                    SizedBox(height: 15.h),
                    titleRow(title: 'Due Date', star: "*"),
                    dueDateTextField(),
                    SizedBox(
                      height: 30.h,
                    ),
                    Center(
                      child: CustomWidget.myButton(
                        name: AppConstants.postjob,
                        size: Size(100, 30.h),
                        isBorder: false,
                        onClicked: () {
                          if (fKey.currentState!.validate()) {
                            postJob();
                          }
                        },
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  titleRow({title, star}) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: ScreenUtil().setSp(15),
          ),
        ),
        Text(
          star,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: ScreenUtil().setSp(15),
            color: AppColor.redshade900,
          ),
        )
      ],
    );
  }

  designationTextField() {
    return TextFormField(
        style: TextStyle(fontSize: 13.sp),
        textCapitalization: TextCapitalization.words,
        validator: (value) {
          return value!.isEmpty ? 'Enter Designation' : null;
        },
        controller: _designationController,
        decoration:
            WidgetStyle.nameTextFieldDecoration(hint: "Enter Designation"));
  }

  companyTextField() {
    return TextFormField(
        style: TextStyle(fontSize: 13.sp),
        validator: (value) {
          return value!.isEmpty ? 'Enter Company Name' : null;
        },
        textCapitalization: TextCapitalization.words,
        controller: _companyController,
        decoration: WidgetStyle.nameTextFieldDecoration(hint: "Enter Company"));
  }

  jobLinkTextField() {
    return TextFormField(
        style: TextStyle(fontSize: 13.sp),
        validator: (value) {
          return value!.isEmpty ? 'Enter Link' : null;
        },
        controller: _jobLinkController,
        decoration:
            WidgetStyle.nameTextFieldDecoration(hint: "Enter Job Link"));
  }

  dueDateTextField() {
    return TextFormField(
        validator: (value) {
          return value!.isEmpty ? 'Enter Date' : null;
        },
        readOnly: true,
        onTap: () {
          _selectPostDate(context);
        },
        controller: _dueDateController,
        decoration: WidgetStyle.suffixNameTextFieldDecoration(
            hint: "Enter Due Date",
            sufIcon: const Icon(
              Icons.calendar_today_outlined,
              color: AppColor.primaryColor,
            )));
  }

  // emailTextField() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       TextField(
  //         //  controller: emailController,
  //           decoration:
  //               WidgetStyle.nameTextFieldDecoration(hint: "Enter Email"))
  //     ],
  //   );
  // }

  Future<void> postJob() async {
    UIHelper.apiCallingAlert(context);
    var response = await ApiCalls.postJob(
      _designationController.text,
      _companyController.text,
      _jobLinkController.text,
      AppConstants.myId,
      _dueDateController.text,
      widget.jobID,
    );
    UIHelper.hideApiCallingAlert(context);
    if (response is ErrorEntity) {
    } else {
      InsertJobEntity jobEntity = InsertJobEntity().fromJson(response);
      if (jobEntity.success == 1) {
        if (widget.jobID != "") {
          database.updateJobs(
            widget.jobID ?? '',
            _designationController.text,
            _companyController.text,
            _jobLinkController.text,
            _dueDateController.text,
          );
          await Fluttertoast.showToast(
            msg: 'Job has been updated successfully',
          );
        } else {
          await Fluttertoast.showToast(
            msg: 'Job has been posted successfully',
          );
        }

        Get.back();
      }
    }
  }
}
