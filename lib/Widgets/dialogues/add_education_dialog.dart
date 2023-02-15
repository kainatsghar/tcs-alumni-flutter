import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/response_models/add_education_entity.dart';
import 'package:iobm/networkcalls/response_models/add_interest_entity.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/strings.dart';
import '../../utils/text_styles.dart';
import '../custom_widgets.dart';
import '../widget_styles.dart';

class AddEducationDialog extends StatefulWidget {
  final int check;
  final String? educationID;
  final String? degree;
  final String? institute;
  final String? startYear;
  final String? endYear;
  AddEducationDialog(
    this.check,
    this.educationID,
    this.degree,
    this.institute,
    this.startYear,
    this.endYear,
  );
  @override
  _AddEducationDialogState createState() => _AddEducationDialogState();
}

class _AddEducationDialogState extends State<AddEducationDialog> {
  final TextEditingController _degreeController = TextEditingController();
  final TextEditingController _instituteController = TextEditingController();
  List? dropDownYearList = [];

  bool wait = false;

  List? dropDownEndYearList = ["Continue"];
  String? selectedYear;

  String? selectedEndYear = "Continue";
  addingyear() {
    for (var i = 0; i <= 70; i++) {
      int year = DateTime.now().year;
      setState(() {
        year = year - i;
        dropDownYearList!.add(year.toString());
      });
    }
  }

  @override
  void initState() {
    addingyear();
    _degreeController.text = widget.degree ?? '';
    _instituteController.text = widget.institute ?? "";
    if (widget.check == 1) {
      setState(() {
        selectedYear = DateTime.now().year.toString();
      });
    } else {
      setState(() {
        selectedYear = widget.startYear;
        for (var i = DateTime.now().year.toInt();
            i >= int.parse(selectedYear ?? '');
            i--) {
          dropDownEndYearList!.add(i.toString());
        }
      });
    }

    super.initState();
  }

  final _eduKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _eduKey,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: AppColor.transparent,
              body: Center(
                child: Material(
                  color: AppColor.transparent,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration:  BoxDecoration(
                                color: AppColor.primaryColor,
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(10.r), topLeft: Radius.circular(10.r))
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('         '),
                                   Text(
                                    'Add Education',
                                    style: CustomTextStyles.text16SemiBoldW600.copyWith(color: AppColor.white,),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 5),
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        color: AppColor.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              width: double.infinity,
                              decoration:  BoxDecoration(
                                color: AppColor.white,
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.r), bottomLeft: Radius.circular(10.r))
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Degree Title',
                                    style: CustomTextStyles.text14SemiBoldW600.copyWith(color: AppColor.black,),
                                  ),
                                  TextFormField(
                                    style: CustomTextStyles.text12RegularW400,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter degree title.';
                                      }
                                      return null;
                                    },
                                    textCapitalization:
                                        TextCapitalization.words,
                                    controller: _degreeController,
                                    decoration:
                                        WidgetStyle.nameTextFieldDecoration(
                                            hint: "Enter Degree Title"),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    'Institution Name',
                                    style: CustomTextStyles.text14SemiBoldW600.copyWith(color: AppColor.black,),
                                  ),
                                  TextFormField(
                                    style: CustomTextStyles.text12RegularW400,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter institution name.';
                                      }
                                      return null;
                                    },
                                    textCapitalization:
                                        TextCapitalization.words,
                                    controller: _instituteController,
                                    decoration:
                                        WidgetStyle.nameTextFieldDecoration(
                                            hint: "Enter Institution Name"),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  _yearExpercience(),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      widget.check == 2
                                          ? CustomWidget.secDialogButton(
                                              name: Strings.delete,
                                              isBorderColor: true,
                                              onClicked: () async {
                                                await deleteUserEducation();
                                                Get.back();
                                              },
                                            )
                                          : Container(),
                                      Row(
                                        children: [
                                          CustomWidget.dialogButton(
                                            name: Strings.cancel,
                                            isBorderColor: true,
                                            onClicked: () {
                                              Get.back();
                                            },
                                          ),
                                          SizedBox(width: 8.w),
                                          CustomWidget.dialogButton(
                                            name: Strings.save,
                                            isBorderColor: false,
                                            onClicked: () async {
                                              if (_eduKey.currentState!
                                                  .validate()) {
                                                await addEducation(
                                                  AppConstants.myId,
                                                  _instituteController.text,
                                                  _degreeController.text,
                                                  selectedYear,
                                                  selectedEndYear,
                                                  widget.educationID,
                                                );
                                                Get.back();
                                              }
                                            },
                                          ),
                                          SizedBox(width: 6.w)
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            wait
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  _yearExpercience() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Starting Year',
              style: CustomTextStyles.text14SemiBoldW600.copyWith(color: AppColor.black,),
            ),
            Container(
              height: 35, //
              width: MediaQuery.of(context).size.width / 3,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(5),
                //border: Border.all(width: .7, color: AppColor.black)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: DropdownButton(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  menuMaxHeight: 500,
                  underline: Container(),
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  isExpanded: true,
                  value: selectedYear!,
                  onChanged: (newVal) {
                    setState(() {
                      selectedYear = newVal.toString();
                      // dropDownEndYearList!.clear();
                      dropDownEndYearList = ["Continue"];

                      for (var i = DateTime.now().year.toInt();
                          i >= int.parse(selectedYear ?? '');
                          i--) {
                        dropDownEndYearList!.add(i.toString());
                      }
                    });
                  },
                  items: dropDownYearList!.map(
                    (valueItem) {
                      return DropdownMenuItem(
                          value: valueItem,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              valueItem,
                              style: CustomTextStyles.text12RegularW400,
                            ),
                          ));
                    },
                  ).toList(),
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ending Year',
              style: CustomTextStyles.text14SemiBoldW600.copyWith(color: AppColor.black,),
            ),
            Container(
              height: 35, //
              width: MediaQuery.of(context).size.width / 3,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(5),
                //border: Border.all(width: .7, color: AppColor.black)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: DropdownButton(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  underline: Container(),
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  isExpanded: true,
                  value: selectedEndYear!,
                  onChanged: (newVal) {
                    setState(() {
                      selectedEndYear = newVal.toString();
                      print("new======= $selectedEndYear");
                    });
                  },
                  items: dropDownEndYearList!.map((valueItem) {
                    return DropdownMenuItem(
                        value: valueItem,
                        child: Text(
                          valueItem,
                          style: CustomTextStyles.text12RegularW400,
                        ));
                  }).toList(),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Future<void> deleteUserEducation() async {
    setState(() {
      wait = true;
    });
    var response = await ApiCalls.deleteEducation(
      userId: AppConstants.myId,
      educationId: "${widget.educationID}",
    );

    if (response is ErrorEntity) {
      print(response.message);
    } else {
      AddInterestEntity interestEntity = AddInterestEntity().fromJson(response);
      if (interestEntity.success == 1) {
        database.deleteUserEducation(int.parse(widget.educationID ?? ''));

        await Fluttertoast.showToast(msg: 'Your data has been updated');
      }
    }
    setState(() {
      wait = false;
    });
  }

  Future<void> addEducation(
      userId, institute, program, startDate, endDate, educationID) async {
    setState(() {
      wait = true;
    });
    var response = await ApiCalls.addEducation(
      userId,
      institute,
      program,
      startDate,
      endDate,
      educationID,
    );
    setState(() {
      wait = false;
    });

    if (response is ErrorEntity) {
      print(response.message);
    } else {
      AddEducationEntity educationEntity =
          AddEducationEntity().fromJson(response);
      if (educationEntity.success == 1) {
        for (var element in educationEntity.result.education) {
          DBEducation dbEducation = DBEducation(
            id: int.parse(element.id),
            userId: int.parse(element.userId),
            program: element.program,
            institute: element.institute,
            startDate: element.startDate,
            endDate: element.endDate,
          );
          database.insertEducation(dbEducation);
        }
        await Fluttertoast.showToast(msg: 'Your data has been updated');
      }
    }
  }
}
