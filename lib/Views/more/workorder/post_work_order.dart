

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:iobm/Widgets/custom_widgets.dart';
import 'package:iobm/Widgets/widget_styles.dart';
import 'package:iobm/helper_classes/ui_helper.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/response_models/work_order_entity.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/strings.dart';

import '../../../models/data_fetched.dart';
import '../../../networkcalls/api_helper.dart';

class PostWorkOrder extends StatefulWidget {
  final String? designation;
  final String? company;
  final String? description;
  final String? dueDate;
  final String? workId;
  final String? doc;
  const PostWorkOrder({Key? key,
    this.designation, this. company, this.description, this.dueDate, this.workId,this.doc
  }) : super(key: key);

  @override
  PostWorkOrderState createState() => PostWorkOrderState();
}

class PostWorkOrderState extends State<PostWorkOrder> {
  File? file;
  String? filePath;

  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();
  final TextEditingController _documentController = TextEditingController();
  GlobalKey<FormState> fKey = GlobalKey<FormState>();

  DateTime? postSelectedDate;

  Future<void> _selectPostDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 200),
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
    // TODO: implement initState
    super.initState();
    _designationController.text = widget.designation??'';
    _companyController.text = widget.company??'';
    _descriptionController.text = widget.description??'';
    _dueDateController.text = widget.dueDate??'';
    _documentController.text = widget.doc??'';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.postWorkOrder),
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
        shape: Border(
          bottom: BorderSide(color: AppColor.secAppBar, width: 3.w),
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: ScreenUtil().setSp(18),
        ),
        actions: <Widget>[
          widget.workId!.isNotEmpty ? GestureDetector(
            onTap: () {
              CustomWidget.successDialogue(context: context, icon: AppImages.delete, title: 'Want to Delete',
                dText: 'Are you sure you want to delete work order?\nyou will not be able to recover them',
                btnText: 'Cancel', workId: widget.workId,
              );
              // delWorkCall(widget.workId);
            },
            child: Container(
              color: AppColor.transparent,
              child: Icon(
                Icons.delete,
                size: 22.h,
              ),
            ),
          ) : Container(),
          const SizedBox(
            width: 10,
          ),
        ],
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
                  titleRow(title: 'Description', star: "*"),
                  descriptionTextField(),
                  SizedBox(height: 15.h),
                  titleRow(title: 'Due Date', star: "*"),
                  dueDateTextField(),
                  SizedBox(height: 15.h),
                  titleRow(title: 'Document', star: ""),
                  documentTextField(),
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                    child: CustomWidget.myButton(
                      name: widget.workId!.isEmpty ? Strings.postWorkOrder : Strings.updateWorkOrder,
                      size: Size(120.w, 30.h),
                      isBorder: false,
                      onClicked: () {
                        if (fKey.currentState!.validate()) {
                          // postJob();
                          filePath==null ? postWorkOrderN() : postWorkOrder() ;
                        }
                      },
                    ),
                  ),
                ]),
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

  descriptionTextField() {
    return TextFormField(
        controller: _descriptionController,
        style: TextStyle(fontSize: 13.sp),
        validator: (value) {
          return value!.isEmpty ? 'Enter Description' : null;
        },
        // controller: _jobLinkController,
        decoration:
        WidgetStyle.nameTextFieldDecoration(hint: "Enter Description"));
  }

  dueDateTextField() {
    return TextFormField(
        style: TextStyle(fontSize: 13.sp),
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

  documentTextField() {
    return TextFormField(
        style: TextStyle(fontSize: 13.sp),
        controller: _documentController,
        // validator: (value) {
        //   return value!.isEmpty ? 'Chose File.' : null;
        // },
        readOnly: true,
        onTap: () {
          filePicker();
          // _selectPostDate(context);
        },
        // controller: _dueDateController,
        decoration: WidgetStyle.suffixNameTextFieldDecoration(
            hint: "Chose Document",
            sufIcon: const Icon(
              Icons.document_scanner_sharp,
              color: AppColor.primaryColor,
            )));
  }

  Future<void> postWorkOrder() async {
    UIHelper.apiCallingAlert(context);
    print('its here');
    var response = await ApiCalls.postWorkOrder(
      userId: AppConstants.myId,
      designation: _designationController.text,
      companyName: _companyController.text,
      description: _descriptionController.text,
      dueDate: _dueDateController.text,
      id: widget.workId,
      file: filePath,
    );
    print('thre');
    UIHelper.hideApiCallingAlert(context);
    if (response is ErrorEntity) {
      UIHelper.showErrorAlert(context, response.message);
    } else {
      WorkOrderEntity orderEntity = WorkOrderEntity().fromJson(response);
      print(orderEntity.success);
      if (orderEntity.success == 1) {
        UIHelper.showAlertMessage(context, orderEntity.message,action: (){
          Get.back();
          Get.back();
        });
      }
    }
  }
  Future<void> postWorkOrderN() async {
    UIHelper.apiCallingAlert(context);
    print('its here');
    var response = await ApiCalls.postWorkOrderN(
      userId: AppConstants.myId,
      designation: _designationController.text,
      companyName: _companyController.text,
      description: _descriptionController.text,
      dueDate: _dueDateController.text,
      id: widget.workId,
      // file: filePath,
    );
    print('thre');
    UIHelper.hideApiCallingAlert(context);
    if (response is ErrorEntity) {
      UIHelper.showErrorAlert(context, response.message);
    } else {
      WorkOrderEntity orderEntity = WorkOrderEntity().fromJson(response);
      print(orderEntity.success);
      if (orderEntity.success == 1) {
        UIHelper.showAlertMessage(context, orderEntity.message, action: (){
          Get.back();
          Get.back();
        });
      }
    }
  }




  filePicker() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result != null) {
      file = File(result.files.first.path!);
      setState(() {
        filePath = file!.path;
      });
      _documentController.text =  file!.path;
      print(filePath);
    } else {
      // User canceled the picker
    }
  }

// Future<void> delWorkCall(workId) async {
//
//   DataFetched dataFetched = await ApiHelper.delWorkOrder(workId);
//
//   if(dataFetched.done){
//     print('deleted Work order');
//     UIHelper.showAlertMessage(context, 'Work Order Deleted Successfully.');
//   }
// }


}
