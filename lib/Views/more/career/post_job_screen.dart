import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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
import 'package:iobm/networkcalls/api_path.dart';
import 'package:iobm/networkcalls/response_models/insert_job_entity.dart';
import 'package:iobm/utils/app_color.dart';

import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/text_styles.dart';

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

  /// Image Picker
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  String? _imagePath;

  Future galleryImage() async {
    var pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _imageFile = pickedFile;
      _imagePath = pickedFile!.path;
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
                    titleRow(title: 'Job Link', star: ""),
                    jobLinkTextField(),
                    SizedBox(height: 15.h),
                    titleRow(title: 'Due Date', star: ""),
                    dueDateTextField(),
                    SizedBox(
                      height: 30.h,
                    ),
                    titleRow(title: 'Upload Image', star: ""),
                    SizedBox(
                      height: 10.h,
                    ),
                    DottedBorder(
                      color: const Color(0xff164892),
                      borderType: BorderType.RRect,
                      strokeWidth: 1,
                      dashPattern: const <double>[3, 3],
                      child: GestureDetector(
                        onTap: () async {
                          var pickedFile = await _picker.pickImage(
                            source: ImageSource.gallery,
                          );
                          _imagePath = pickedFile!.path;
                          print("PickImageFromGallery${pickedFile!.path.toString()}");
                        },
                        child: Container(
                          height: 75.h,
                          width: double.infinity,
                          margin: const EdgeInsets.all(5),
                          color: const Color(0xff164892).withOpacity(0.10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppImages.jobImageIcon),
                              const Text('Upload Image',style: TextStyle(color: Color(0xff164892)),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Center(
                      child: CustomWidget.myButton(
                        name: AppConstants.postjob,
                        size: Size(100, 30.h),
                        isBorder: false,
                        onClicked: () {

                            postJob();

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
          style: CustomTextStyles.text14SemiBoldW600,
        ),
        Text(
          star,
          style: CustomTextStyles.text14SemiBoldW600.copyWith(color: AppColor.redshade900,),
        )
      ],
    );
  }

  designationTextField() {
    return TextFormField(
        style: CustomTextStyles.text12RegularW400,
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
        style: CustomTextStyles.text12RegularW400,
        validator: (value) {
          return value!.isEmpty ? 'Enter Company Name' : null;
        },
        textCapitalization: TextCapitalization.words,
        controller: _companyController,
        decoration: WidgetStyle.nameTextFieldDecoration(hint: "Enter Company"));
  }

  jobLinkTextField() {
    return TextFormField(
        style: CustomTextStyles.text12RegularW400,
        // validator: (value) {
        //   return value!.isEmpty ? 'Enter Link' : null;
        // },
        controller: _jobLinkController,
        decoration:
            WidgetStyle.nameTextFieldDecoration(hint: "Enter Job Link"));
  }

  dueDateTextField() {
    return TextFormField(
      style: CustomTextStyles.text12RegularW400,
        // validator: (value) {
        //   return value!.isEmpty ? 'Enter Date' : null;
        // },
        readOnly: true,
        onTap: () {
          _selectPostDate(context);
        },
        controller: _dueDateController,
        decoration: WidgetStyle.suffixNameTextFieldDecoration(
            hint: "Enter Due Date",
            sufIcon:  Icon(
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
    print('postJob Called.');
    UIHelper.apiCallingAlert(context);
    var response = await ApiCalls.postJob(
      _designationController.text,
      _companyController.text,
      _jobLinkController.text,
      AppConstants.myId,
      _dueDateController.text,
      widget.jobID,
      _imagePath,
    );
    print("Params=${_imagePath.toString()}");
    print('response: ${response.toString()}');
    UIHelper.hideApiCallingAlert(context);
    if (response is ErrorEntity) {
      print('errorResponse: ${response.toString()}');
    } else {
      print('success');
      InsertJobEntity jobEntity = InsertJobEntity().fromJson(response);
      if (jobEntity.success == 1) {
        print('success: 1');
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
