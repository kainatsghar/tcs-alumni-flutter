import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iobm/helper_classes/ui_helper.dart';
import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/add_experience_response.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/api_params.dart';
import 'package:iobm/networkcalls/network_config.dart';

import 'package:iobm/networkcalls/response_models/add_interest_entity.dart';

import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/text_styles.dart';
import '../custom_widgets.dart';
import '../widget_styles.dart';

class AddExperienceDialog extends StatefulWidget {
  final int check;
  var experienceId;
  final String? designation;
  final String? company;
  final String? startYear;
  final String? endYear;
  final String? logoChange;
  final String? industry;

  AddExperienceDialog(
      this.check,
      this.experienceId,
      this.designation,
      this.company,
      this.startYear,
      this.endYear,
      this.logoChange,
      this.industry);
  @override
  _AddExperienceDialogState createState() => _AddExperienceDialogState();
}

class _AddExperienceDialogState extends State<AddExperienceDialog> {
  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  bool currentlyWorkinHere = false;
  bool wait = false;
  bool change = false;
  late List<DBIndustrie> _industries;
  late List<DBCompanie> _companies;
  late List<DBDesignation> _designations;

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

  Future cameraImage() async {
    var pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      _imageFile = pickedFile;
      _imagePath = pickedFile!.path;
    });
  }

  String? selectedCompany;
  String? logoChangeAble;
  String? logoImage;
  String? selectedIndustry;
  int? selectedStartMonth;
  int? selectedStartYear;
  int? selectedEndMonth;
  int? selectedEndYear;

  List startMonthsList = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  List? endMonthsList;

  late Future _fetchData;

  Future<void> getData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    _industries = await database.getAllIndustries();
    _companies = await database.getCompanies();
    _designations = await database.getDesignations();
    selectedIndustry = widget.industry == "null" ? null : widget.industry;
  }

  List? yearStartList;
  List? yearEndList;

  void getStartYear() async {
    setState(
      () {
        yearStartList = [
          for (var i = 1950; i <= DateTime.now().year.toInt(); i++)
            i.toString(),
        ];
      },
    );
  }

  var startYear;
  var startMonth;
  var endYear;
  var endMonth;

  @override
  void initState() {
    print(widget.industry);
    getStartYear();
    _designations = [];
    _fetchData = getData();
    _designationController.text = widget.designation ?? '';
    _companyController.text = widget.company ?? '';
    startDateController.text = widget.startYear ?? '';
    endDateController.text = widget.endYear ?? '';
    if (startDateController.text != "") {
      final tagName = startDateController.text;
      final split = tagName.split('-');
      setState(() {
        startYear = int.parse(split.last);
        startMonth = split.first;
        print(startMonth);
        selectedStartYear = yearStartList!.indexOf(split.last);
        selectedStartMonth = startMonthsList.indexOf(startMonth);

        yearEndList = [
          for (var i = startYear!; i <= DateTime.now().year.toInt(); i++)
            i.toString(),
        ];
      });
    }
    if (endDateController.text == "Continue") {
      setState(() {
        currentlyWorkinHere = true;
      });
    }
    if (endDateController.text == "") {
      setState(() {
        yearEndList = [
          for (var i = DateTime.now().year.toInt();
              i <= DateTime.now().year.toInt();
              i++)
            i.toString(),
        ];
      });
    }
    if (endDateController.text != "" && endDateController.text != "Continue") {
      final tagName = endDateController.text;
      final split = tagName.split('-');
      setState(() {
        endYear = int.parse(split.last);
        endMonth = split.first;

        selectedEndMonth = startMonthsList.indexOf(endMonth);
        selectedEndYear = yearEndList!.indexOf(endYear);
      });
    }

    super.initState();
  }

  final _expKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(_designations);
      },
      child: Form(
        key: _expKey,
        child: FutureBuilder(
            future: _fetchData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Stack(
                  children: [
                    Scaffold(
                      backgroundColor: AppColor.transparent,
                      body: Center(
                        child: Material(
                          color: AppColor.transparent,
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: SingleChildScrollView(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                          top: 15,
                                          bottom: 15,
                                          right: 10,
                                        ),
                                        decoration: const BoxDecoration(
                                          color: AppColor.primaryColor, //
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text('         '),
                                            Text(
                                              'Add Professional Experience',
                                              style: CustomTextStyles.text16SemiBoldW600.copyWith(color: AppColor.white,),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Get.back();
                                              },
                                              child: const Icon(
                                                Icons.close,
                                                color: AppColor.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 7),
                                        decoration: const BoxDecoration(
                                          color: AppColor.white,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              'Designation',
                                              style: CustomTextStyles.text14SemiBoldW600,
                                            ),
                                            _positionField(),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              'Company Name',
                                              style: CustomTextStyles.text14SemiBoldW600,
                                            ),
                                            _companyField(),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            logoChangeAble == null ||
                                                    widget.logoChange == ''
                                                ? uploadlogo(
                                                    onPessed: () {},
                                                  )
                                                : logoChangeAble == 'Y' ||
                                                        widget.logoChange == 'Y'
                                                    ? uploadlogo(
                                                        onPessed: () {},
                                                      )
                                                    : Container(),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            _yearExperience(),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            _workCheckBox(),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            _changeIndustry(),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            change
                                                ? Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    child: DropdownButton(
                                                      menuMaxHeight: 600,
                                                      underline: Container(),
                                                      icon: const Icon(Icons
                                                          .keyboard_arrow_down_outlined),
                                                      isExpanded: true,
                                                      value: selectedIndustry,
                                                      onChanged: (newVal) {
                                                        setState(
                                                          () {
                                                            selectedIndustry =
                                                                newVal.toString();
                                                          },
                                                        );
                                                      },
                                                      items: _industries.map(
                                                        (industry) {
                                                          return DropdownMenuItem(
                                                            value: industry.title,
                                                            child: Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                industry.title ??
                                                                    '',
                                                                style: CustomTextStyles.text12RegularW400,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).toList(),
                                                    ),
                                                  )
                                                : Container(),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                widget.check == 2
                                                    ? CustomWidget
                                                        .secDialogButton(
                                                        name: Strings.delete,
                                                        isBorderColor: true,
                                                        onClicked: () async {
                                                          await deleteUserExperience();
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
                                                        if (_expKey.currentState!
                                                            .validate()) {
                                                          addExperience();
                                                        }
                                                        // addExperience();
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
                    ),
                    wait
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container(),
                  ],
                );
              } else {
                return Container();
              }
            }),
      ),
    );
  }

  uploadlogo({Function()? onPessed}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            galleryImage();
          },
          child: Text(
            'Upload Company Logo (Optional)',
            style: CustomTextStyles.text12RegularW400.copyWith(decoration: TextDecoration.underline,color: AppColor.blue),
          ),
        ),
        GestureDetector(
          onTap: onPessed!,
          child: logoImage == null
              ? GestureDetector(
                  onTap: () {
                    galleryImage();
                  },
                  child: const Image(
                    image: AssetImage(AppImages.camera),
                    height: 25,
                  ),
                )
              : CachedNetworkImage(
                  height: 25.w,
                  width: 25.w,
                  imageUrl: logoImage!,
                ),
        ),
      ],
    );
  }

  Widget _workCheckBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 20.w,
          height: 20.w,
          child: Checkbox(
            value: currentlyWorkinHere,
            onChanged: (value) {
              setState(() {
                currentlyWorkinHere = value!;
              });
            },
            activeColor: AppColor.primaryColor,
          ),
        ),
        SizedBox(width: 10.w),
        Text(
          'Currently working here',
          style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.greyshade600,),
          textAlign: TextAlign.start,
        )
      ],
    );
  }

  Widget _changeIndustry() {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 20.w,
            height: 20.w,
            child: Checkbox(
              value: change,
              onChanged: (value) {
                setState(() {
                  change = value!;
                });
              },
              activeColor: AppColor.primaryColor,
            ),
          ),
          SizedBox(width: 10.w),
          Text(
            'Change Industry',
            style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.greyshade600,),
          )
        ],
      ),
    );
  }

  Widget _yearExperience() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Starting Year',
                style: CustomTextStyles.text14SemiBoldW600,
              ),
              SizedBox(
                  width: 125.w,
                  child: InkWell(
                    onTap: () {
                      showStartDateCalander();
                    },
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter starting year.';
                        }
                        return null;
                      },
                      onTap: () {
                        showStartDateCalander();
                      },
                      style: TextStyle(
                        //Family: 'Nunito',
                        fontSize: ScreenUtil().setSp(14),
                      ),
                      readOnly: true,
                      controller: startDateController,
                      decoration: InputDecoration(
                        hintText: "Starting Year",
                        isDense: true,
                        hintStyle: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.greyshade400,),
                        contentPadding: EdgeInsets.only(top: 8.h, bottom: 2),
                      ),
                    ),
                  )),
            ],
          ),
          currentlyWorkinHere == false
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ending Year',
                      style: CustomTextStyles.text14SemiBoldW600,
                    ),
                    SizedBox(
                        width: 125.w,
                        child: InkWell(
                          onTap: () {
                            showEndDateCalander();
                          },
                          child: TextField(
                            onTap: () {
                              showEndDateCalander();
                            },
                            readOnly: true,
                            controller: endDateController,
                            decoration: InputDecoration(
                              hintText: "End Year",
                              isDense: true,
                              hintStyle: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.greyshade400,),
                              contentPadding: EdgeInsets.only(top: 8.h),
                            ),
                          ),
                        )),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _positionField() {
    return TypeAheadFormField<DBDesignation>(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter position.';
        }
        return null;
      },
      textFieldConfiguration: TextFieldConfiguration(
        textCapitalization: TextCapitalization.words,
        style: CustomTextStyles.text12RegularW400,
        controller: _designationController,
        // onSubmitted: (value) {
        //   airportSelected = null;
        //   _searchairports(value);
        //   SystemChannels.textInput.invokeMethod('TextInput.hide');
        // },
        decoration: WidgetStyle.nameTextFieldDecoration(hint: "Enter Position"),
      ),
      hideOnEmpty: true,
      suggestionsCallback: (pattern) async {
        if (pattern == '') {
          return [];
        } else {
          return _designations
              .where((item) =>
                  item.name!.toLowerCase().startsWith(pattern.toLowerCase()))
              .toList();
        }
      },
      transitionBuilder: (context, child, controller) {
        return child;
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          title: Text(
            suggestion.name ?? '',
            style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.black54,),
          ),
          dense: true,
        );
      },
      getImmediateSuggestions: false,
      onSuggestionSelected: (suggestion) {
        _designationController.text = suggestion.name ?? '';
      },
    );
  }

  Widget _companyField() {
    return TypeAheadFormField<DBCompanie>(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter company name.';
        }
        return null;
      },
      hideOnEmpty: true,
      textFieldConfiguration: TextFieldConfiguration(
        style: CustomTextStyles.text12RegularW400,
        textCapitalization: TextCapitalization.words,
        controller: _companyController,
        // onSubmitted: (value) {
        //   airportSelected = null;
        //   _searchairports(value);
        //   SystemChannels.textInput.invokeMethod('TextInput.hide');
        // },
        decoration:
            WidgetStyle.nameTextFieldDecoration(hint: "Enter Company Name"),
      ),
      suggestionsCallback: (pattern) async {
        if (pattern == '') {
          return [];
        } else {
          return _companies
              .where((item) =>
                  item.title!.toLowerCase().startsWith(pattern.toLowerCase()))
              .toList();
        }
      },
      transitionBuilder: (context, child, controller) {
        return child;
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          title: Text(
            suggestion.title ?? '',
            style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.black54,),
          ),
          dense: true,
        );
      },
      getImmediateSuggestions: false,
      onSuggestionSelected: (suggestion) {
        _companyController.text = suggestion.title ?? '';
        setState(() {
          logoChangeAble = suggestion.logoChangeable;
          logoImage = suggestion.image;
        });
      },
    );
  }

  // Future<List<DBDesignation>> getDesignation(pattern) async {
  //   if (pattern == null || pattern == '') {
  //   } else {
  //
  //   }
  //   return _designations;
  // }

  showStartDateCalander() {
    showDialog(
      context: context,
      builder: (builder) => Dialog(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          height: 250.w,
          decoration: const BoxDecoration(
            color: AppColor.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Select Start Date',
                  style: CustomTextStyles.text16SemiBoldW600,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80.w,
                    height: 130.w,
                    child: CupertinoPicker(
                      scrollController: FixedExtentScrollController(
                        initialItem: selectedStartMonth == null
                            ? 0
                            : selectedStartMonth ?? 0,
                      ),
                      itemExtent: 40.w,

                      selectionOverlay: Container(
                        decoration: const BoxDecoration(
                          color: AppColor.transparent,
                          border: Border(
                            top: BorderSide(
                              color: AppColor.black,
                            ),
                            bottom: BorderSide(
                              color: AppColor.black,
                            ),
                          ),
                        ),
                      ),
                      backgroundColor: AppColor.white,
                      onSelectedItemChanged: (value) {
                        setState(() {
                          selectedStartMonth = value;
                        });
                      },
                      // children: new List<Widget>.generate(
                      //     colors.length, (int index) {
                      //   return new Center(
                      //     child: new Text(colors[index]),
                      //   );
                      // }
                      children: List<Widget>.generate(
                        startMonthsList.length,
                        (int index) {
                          return Center(
                            child: Text(
                              startMonthsList[index],
                              style: CustomTextStyles.text14SemiBoldW600,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 80.w,
                    height: 130.w,
                    child: CupertinoPicker(
                      itemExtent: 40.w,
                      selectionOverlay: Container(
                        decoration: const BoxDecoration(
                          color: AppColor.transparent,
                          border: Border(
                            top: BorderSide(
                              color: AppColor.black,
                            ),
                            bottom: BorderSide(
                              color: AppColor.black,
                            ),
                          ),
                        ),
                      ),
                      backgroundColor: AppColor.white,
                      scrollController: FixedExtentScrollController(
                        initialItem: selectedStartYear == null
                            ? 71
                            : selectedStartYear ?? 71,
                      ),
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          selectedStartYear = index;
                        });
                      },
                      children: List<Widget>.generate(
                        yearStartList!.length,
                        (int index) {
                          return Center(
                            child: Text(
                              yearStartList![index].toString(),
                              style: CustomTextStyles.text14SemiBoldW600,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Center(
                      child: Text(
                        Strings.cancel,
                        style: CustomTextStyles.text12RegularW400,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      if (selectedStartMonth == null ||
                          selectedStartYear == null) {
                        setState(() {
                          selectedStartMonth = selectedStartMonth ?? 0;
                          selectedStartYear = selectedStartYear ?? 71;
                          startDateController.text =
                              startMonthsList[selectedStartMonth ?? 0] +
                                  '-' +
                                  yearStartList![selectedStartYear ?? 71]
                                      .toString();

                          yearEndList = [
                            for (var i = int.parse(
                                    yearStartList![selectedStartYear ?? 71]);
                                i <= DateTime.now().year.toInt();
                                i++)
                              i.toString(),
                          ];
                        });
                      } else {
                        setState(() {
                          startDateController.text =
                              startMonthsList[selectedStartMonth ?? 0] +
                                  '-' +
                                  yearStartList![selectedStartYear ?? 0]
                                      .toString();
                          yearEndList = [
                            for (var i = int.parse(
                                    yearStartList![selectedStartYear ?? 70]);
                                i <= DateTime.now().year.toInt();
                                i++)
                              i.toString(),
                          ];
                        });
                      }

                      Navigator.of(context).pop();
                    },
                    child: Center(
                      child: Text(
                        'OK',
                        style: CustomTextStyles.text12RegularW400,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  showEndDateCalander() {
    showDialog(
      context: context,
      builder: (builder) => Dialog(
        child: GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            height: 250.w,
            decoration: const BoxDecoration(
              color: AppColor.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Select End Date',
                    style: CustomTextStyles.text16SemiBoldW600,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80.w,
                      height: 130.w,
                      child: CupertinoPicker(
                        scrollController: FixedExtentScrollController(
                          initialItem: selectedEndMonth == null
                              ? 0
                              : selectedEndMonth ?? 0,
                        ),
                        itemExtent: 40.w,
                        useMagnifier: true,
                        selectionOverlay: Container(
                          decoration: const BoxDecoration(
                            color: AppColor.transparent,
                            border: Border(
                              top: BorderSide(
                                color: AppColor.black,
                              ),
                              bottom: BorderSide(
                                color: AppColor.black,
                              ),
                            ),
                          ),
                        ),
                        backgroundColor: AppColor.white,
                        onSelectedItemChanged: (value) {
                          setState(() {
                            selectedEndMonth = value;
                          });
                        },
                        children: List<Widget>.generate(
                          startMonthsList.length,
                          (int index) {
                            return Center(
                              child: Text(
                                startMonthsList[index],
                                style: CustomTextStyles.text14SemiBoldW600,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 80.w,
                      height: 130.w,
                      child: CupertinoPicker(
                        itemExtent: 40.w,
                        selectionOverlay: Container(
                          decoration: const BoxDecoration(
                            color: AppColor.transparent,
                            border: Border(
                              top: BorderSide(
                                color: AppColor.black,
                              ),
                              bottom: BorderSide(
                                color: AppColor.black,
                              ),
                            ),
                          ),
                        ),
                        backgroundColor: AppColor.white,
                        scrollController: FixedExtentScrollController(
                          initialItem: selectedEndYear == null
                              ? 0
                              : selectedEndYear ?? 0,
                        ),
                        onSelectedItemChanged: (int index) {
                          setState(() {
                            selectedEndYear = index;
                          });
                        },
                        children: List<Widget>.generate(
                          yearEndList!.length,
                          (int index) {
                            return Center(
                              child: Text(
                                yearEndList![index].toString(),
                                style: CustomTextStyles.text14SemiBoldW600,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Center(
                        child: Text(
                          Strings.cancel,
                          style: CustomTextStyles.text12RegularW400,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          endDateController.text =
                              startMonthsList[selectedEndMonth ?? 0] +
                                  '-' +
                                  yearEndList![selectedEndYear ?? 0].toString();
                        });
                        Navigator.of(context).pop();
                      },
                      child: Center(
                        child: Text(
                          'OK',
                          style: CustomTextStyles.text12RegularW400,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Api Calls
  ///
  Future<void> deleteUserExperience() async {
    setState(() {
      wait = true;
    });
    var response = await ApiCalls.deleteExperience(
      AppConstants.myId,
      "${widget.experienceId}",
    );
    setState(() {
      wait = false;
    });
    if (response is ErrorEntity) {
      UIHelper.showErrorAlert(context, response.message);
    } else {
      AddInterestEntity interestEntity = AddInterestEntity().fromJson(response);
      if (interestEntity.success == 1) {
        database.deleteUserExperience(widget.experienceId);
        await Fluttertoast.showToast(msg: 'Your data has been updated');
      }
    }
  }

  Future<void> addExperience() async {
    setState(() {
      wait = true;
    });
    String url = AppConstants.baseUrl + 'api/add_experience';
    Map map = {
      Params.USER_ID: AppConstants.myId,
      Params.EXPERIENCE_POSITION: _designationController.text,
      Params.COMPANY_NAME: _companyController.text,
      Params.EXPERIENCE_ID: widget.experienceId,
      Params.ALUMNI_EVENT_START_DATE: startDateController.text,
      Params.ALUMNI_EVENT_END_DATE: currentlyWorkinHere
          ? 'Continue'
          : endDateController.text == ''
              ? 'Continue'
              : endDateController.text,
      "industry": selectedIndustry
    };

    if (_imagePath != null) {
      ApiResponse apiResponse =
          await NetworkConfig.uploadFileWithToken(url, map, _imageFile!.path);
      if (apiResponse.done ?? false) {
        AddExperienceResponse response =
            AddExperienceResponse.fromJson(apiResponse.responseString ?? '');
        if (response.success == 1) {
          for (var element in response.result!.experience!) {
            DBExperiece dbExperience = DBExperiece(
              id: int.parse(element.id ?? ''),
              userId: int.parse(element.userId ?? ''),
              position: element.position,
              campanyName: element.campanyName,
              companyImage: element.companyImage,
              startDate: element.startDate,
              endDate: element.endDate,
            );
            database.insertExperience(dbExperience);
          }
          await database.editIndustry(
              AppConstants.myId, selectedIndustry ?? '');

          await Fluttertoast.showToast(msg: 'Your data has been updated');
          Get.back();
        } else {
          UIHelper.showErrorAlert(context, 'response.message');
          print(response.message);
        }
      }
    } else {
      ApiResponse apiResponse =
          await NetworkConfig.postWebWithTokenCall(url, map);
      if (apiResponse.done ?? false) {
        AddExperienceResponse response =
            AddExperienceResponse.fromJson(apiResponse.responseString ?? '');
        if (response.success == 1) {
          for (var element in response.result!.experience!) {
            DBExperiece dbExperience = DBExperiece(
              id: int.parse(element.id ?? ''),
              userId: int.parse(element.userId ?? ''),
              position: element.position,
              campanyName: element.campanyName,
              companyImage: element.companyImage,
              startDate: element.startDate,
              endDate: element.endDate,
            );
            database.insertExperience(dbExperience);
          }
          await database.editIndustry(
              AppConstants.myId, selectedIndustry ?? '');

          await Fluttertoast.showToast(msg: 'Your data has been updated');
          Get.back();
        } else {
          UIHelper.showErrorAlert(context, 'response.message');
          print(response.message);
        }
      }
    }
    setState(() {
      wait = false;
    });
  }

  // Future<void> addExperience() async {
  //   UIHelper.apiCallingAlert(context);
  //   var response = await ApiCalls.addExperience(
  //     userId: AppConstants.myId,
  //     position: _designationController.text,
  //     companyName: _companyController.text,
  //     startDate: startDateController.text,
  //     endDate: currentlyWorkinHere
  //         ? 'Continue'
  //         : endDateController.text == ''
  //             ? 'Continue'
  //             : endDateController.text,
  //     experienceID: widget.experienceId,
  //     industry: selectedIndustry,
  //     // imagePath: _imagePath,
  //   );
  //   UIHelper.hideApiCallingAlert(context);
  //   if (response is ErrorEntity) {
  //     UIHelper.showErrorAlert(context, response.message);
  //   } else {
  //     AddExperienceEntity experienceEntity =
  //         AddExperienceEntity().fromJson(response);
  //     if (experienceEntity.success == 1) {
  //       SharedPreferences localStorage = await SharedPreferences.getInstance();
  //       print("added");
  //       experienceEntity.result.experience.forEach(
  //         (element) {
  //           DBExperiece dbExperience = DBExperiece(
  //             id: int.parse(element.id),
  //             userId: int.parse(element.userId),
  //             position: element.position,
  //             campanyName: element.campanyName,
  //             companyImage: element.companyImage,
  //             startDate: element.startDate,
  //             endDate: element.endDate,
  //           );
  //           database.insertExperience(dbExperience);
  //         },
  //       );
  //       await Fluttertoast.showToast(msg: 'Your data has been updated');
  //     }
  //   }
  // }
}
