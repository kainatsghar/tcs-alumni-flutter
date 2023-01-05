import 'dart:convert';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iobm/Views/Chat/full_img_view.dart';
import 'package:iobm/Views/Chat/send_invation_screen.dart';
import 'package:iobm/Views/buy_and_sell_tle/add_product_screen.dart';
import 'package:iobm/Views/buy_and_sell_tle/product_detail_screen.dart';
import 'package:iobm/Views/more/gallery/full_gallery_view.dart';
import 'package:iobm/Views/more/referfriend.dart';

import 'package:iobm/Widgets/custom_widgets.dart';
import 'package:iobm/Widgets/widget_styles.dart';
import 'package:iobm/controllers/profile_controller.dart';
import 'package:iobm/helper_classes/ui_helper.dart';
import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/data_fetched.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_helper.dart';
import 'package:iobm/models/upload_profile_response.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/network_config.dart';

import 'package:iobm/networkcalls/response_models/add_interest_entity.dart';
import 'package:iobm/networkcalls/response_models/company_hints_entity.dart';
import 'package:iobm/networkcalls/response_models/designation_hints_entity.dart';
import 'package:iobm/networkcalls/response_models/edit_description_entity.dart';
import 'package:iobm/networkcalls/response_models/enable_loc_sharing_entity.dart';

import 'package:iobm/networkcalls/response_models/mentor_sub_entity.dart';

import 'package:iobm/networkcalls/response_models/update_connect_entity.dart';

import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/app_utils.dart';
import 'package:iobm/utils/strings.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../networkcalls/response_models/get_invitation_entity.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({this.userID});
  final String? userID;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _interestController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  final ProfileController controller = Get.put(ProfileController());

  //loading
  bool wait = false;

  bool isShowIntrested = false;

  bool? shareLocation = false;

  bool fetchedData = false;
  late Future _fetchData;
  late List<DBEducation> _educationList = [];
  late List<DBExperiece> _experienceList = [];
  late List<DBInterest> _interestList = [];
  late List<DBProduct> _productList = [];

  bool isUpdateName = false;

  DBAllUser? oneUser;
  bool writeAbout = false;

  late List values = [];
  Future<void> getData() async {
    if (_interestList.isNotEmpty) {
      values.clear();
      for(int i=0; i<_interestList.length; i++){
        values.add(_interestList[i].interest);
        // var tagName = _interestList[i].interest ?? '';
        // final split = tagName.split(',');
        // print("split= $split");
        // if (mounted) {
        //   setState(() {
        //     values = [
        //       for (int i = 0; i < split.length; i++) split[i],
        //     ];
        //   },);
        // }
      }
      setState(() {

      });
    }
    else {}
  }

  String? valuesString;

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
    _fetchData = getUserInfo();
    loadDesignations();
    loadCompanies();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        //_firebaseRemote();
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: height * 0.4,
              width: width,
              color: AppColor.primaryColor,
            ),
            FutureBuilder(
              future: _fetchData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Stack(
                    children: [
                      buildScreenWidget(height: height),
                      wait
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(),
                    ],
                  );
                } else {
                  return buildScreenWidget(height: height);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildScreenWidget({height}) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBox(
            height: 40.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: AppColor.white,
                  ),
                ),
              ),
              oneUser?.userId == AppConstants.myId ?const SizedBox() :GestureDetector(
                onTap: (){
                  showMaterialModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      height: 50.h,
                      child: ListTile(
                        leading: const Icon(Icons.sim_card_alert_rounded),
                        title: const Text("Block"),
                        onTap: (){
                          sendInvitation(AppConstants.BLOCK);
                        },
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 30.h,
                    width: 30.h,
                    margin: EdgeInsets.only(right: 10.w),
                    color: Colors.transparent,
                    child: const Icon(Icons.more_vert_rounded,color: Colors.white,)),
              )
            ],
          ),
          sizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _userImage(),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  "${oneUser?.firstName ?? "-"} ${oneUser?.lastName??"-"}",
                                  maxLines: 2,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: ScreenUtil().setSp(14),
                                    color: AppColor.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.r,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              oneUser?.userId == AppConstants.myId ?
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    isUpdateName = true;
                                  });
                                },
                                child: Container(
                                  height: 20.h,
                                  width: 20.h,
                                  color: Colors.transparent,
                                  child: Icon(Icons.edit,size: 15.h,color: Colors.white,),
                                ),
                              ) :
                              Container(),
                            ],
                          ),
                          isUpdateName && oneUser?.userId == AppConstants.myId ? _updateUserName(): Container(),
                          SizedBox(
                            height: 5.h,
                          ),
                          oneUser?.userId == AppConstants.myId
                              ? Text(
                                  oneUser?.email ?? '-',
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(12),
                                    color: AppColor.white,
                                  ),
                                )
                              : const SizedBox(),
                          SizedBox(
                            height:
                                oneUser?.userId == AppConstants.myId ? 8 : 4,
                          ),
                          // Text(
                          //   "Alumni ID. ${oneUser?.userId ?? '-'}",
                          //   style: TextStyle(
                          //     fontSize: ScreenUtil().setSp(12),
                          //     color: AppColor.white,
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 5.h,
                          // ),
                          Text(
                            oneUser?.designation == ''
                                ? '-'
                                : oneUser?.designation ?? '-',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(12),
                              color: AppColor.white,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            oneUser?.organizationName == ''
                                ? '-'
                                : oneUser?.organizationName ?? '-',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(12),
                              color: AppColor.white,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            oneUser?.currentCityName == ''
                                ? '-'
                                : oneUser?.currentCityName ?? '-',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(12),
                              color: AppColor.white,
                            ),
                          ),
                          // SizedBox(
                          //   height: 5.h,
                          // ),
                          // Row(
                          //   children: [
                          //     Text(
                          //       'Class of ',
                          //       style: TextStyle(
                          //         fontSize: ScreenUtil().setSp(12),
                          //         color: AppColor.white,
                          //       ),
                          //     ),
                          //     Text(
                          //       oneUser?.graduationYear ?? '',
                          //       style: TextStyle(
                          //         fontSize: ScreenUtil().setSp(12),
                          //         color: AppColor.white,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          const SizedBox(
                            height: 10,
                          ),
                          widget.userID != AppConstants.myId
                              ? oneUser?.connectionStatus == ''
                                  ? GestureDetector(
                                      onTap: () async {
                                        await updateConnectStatus(
                                            status: 'REQUEST',
                                            connectStatus: "REQUEST SENT");
                                        setDataFromDB();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 9, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: AppColor.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Text(
                                          'Connect',
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(12),
                                          ),
                                        ),
                                      ),
                                    )
                                  : oneUser?.connectionStatus == "REQUEST SENT"
                                      ? Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 9,
                                                        vertical: 4),
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffEA8E37),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Text(
                                                  'Pending',
                                                  style: TextStyle(
                                                    fontSize:
                                                        ScreenUtil().setSp(12),
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                await updateConnectStatus(
                                                  status: "CANCEL",
                                                  connectStatus: "",
                                                );
                                                setDataFromDB();
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 9,
                                                        vertical: 4),
                                                decoration: BoxDecoration(
                                                  color: AppColor.white,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Text(
                                                  Strings.cancel,
                                                  style: TextStyle(
                                                    fontSize:
                                                        ScreenUtil().setSp(12),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      : oneUser?.connectionStatus ==
                                              "REQUEST RECEIVED"
                                          ? Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    await updateConnectStatus(
                                                      status: "ACCEPT",
                                                      connectStatus: "ACCEPT",
                                                    );
                                                    setDataFromDB();
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 9,
                                                        vertical: 4),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AppColor.greenColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    child: Text(
                                                      'Accept',
                                                      style: TextStyle(
                                                        fontSize: ScreenUtil()
                                                            .setSp(12),
                                                        color: AppColor.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    await updateConnectStatus(
                                                      status: "CANCEL",
                                                      connectStatus: "",
                                                    );
                                                    setDataFromDB();
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 9,
                                                        vertical: 4),
                                                    decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    child: Text(
                                                      Strings.reject,
                                                      style: TextStyle(
                                                        fontSize: ScreenUtil()
                                                            .setSp(12),
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          : oneUser?.connectionStatus ==
                                                  "ACCEPT"
                                              ? GestureDetector(
                                                  onTap: () async {
                                                    await updateConnectStatus(
                                                      status: "CANCEL",
                                                      connectStatus: "",
                                                    );
                                                    setDataFromDB();
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 9,
                                                        vertical: 4),
                                                    decoration: BoxDecoration(
                                                      color: AppColor.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    child: Text(
                                                      Strings.remove,
                                                      style: TextStyle(
                                                        fontSize: ScreenUtil()
                                                            .setSp(12),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Container()
                              : Container(),
                        ],
                      ),
                    ),
                    widget.userID == AppConstants.myId
                        ? Column(
                            children: [
                              // mediaButton(
                              //     mediaIcon: AppImages.referfriend,
                              //     onPressed: () {
                              //       Get.to(
                              //         () => ReferFriend(
                              //           email: oneUser?.email ?? '',
                              //         ),
                              //       );
                              //     }),
                              const SizedBox(
                                height: 5,
                              ),
                              mediaButton(
                                mediaIcon: AppImages.linkedinProfile,
                                onPressed: () async {
                                  await CustomWidget.linkedInDialogue(
                                    context: context,
                                    url: oneUser!.linkedinUrl,
                                  );
                                  await setDataFromDB();
                                },
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              mediaButton(
                                mediaIcon: AppImages.facebicon,
                                onPressed: () async {
                                  await CustomWidget.facebookDialogue(
                                    context: context,
                                    url: oneUser!.facebookUrl,
                                  );
                                  await setDataFromDB();
                                },
                              ),
                            ],
                          )
                        : GestureDetector(
                            onTap: () {
                              Get.to(
                                () => ChatInvitationScreen(
                                  name:
                                      "${oneUser?.firstName}${oneUser?.lastName}",
                                  image: oneUser?.image,
                                  receiverId: oneUser?.userId,
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 25.w,
                                  width: 25.w,
                                  color: AppColor.transparent,
                                  child: oneUser?.chatStatus == ""
                                      ? SvgPicture.asset(
                                          AppImages.chatSend,
                                          color: AppColor.white,
                                        )
                                      : oneUser?.chatStatus ==
                                                  AppConstants.INVITE ||
                                              oneUser?.chatStatus ==
                                                  AppConstants.REJECT
                                          ? SvgPicture.asset(
                                              AppImages.chatPending,
                                              color: AppColor.white,
                                            )
                                          : SvgPicture.asset(
                                              AppImages.chatAccept,
                                              color: AppColor.white,
                                            ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                oneUser?.linkedinUrl != null &&
                                        oneUser?.linkedinUrl != ""
                                    ? mediaButton(
                                        mediaIcon: AppImages.linkedinProfile,
                                        onPressed: () async {
                                          AppUtils().launchSocial(
                                            'fb://profile/104342767870346',
                                            '${oneUser!.linkedinUrl}',
                                          );
                                        },
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                  ],
                ),
                sizedBox(height: 10.0.h),
                _aboutMe(),
                sizedBox(height: 10.0.h),
                _interest(),
                sizedBox(height: 10.0.h),
                _experience(),
                sizedBox(height: 10.0.h),
                AppConstants.appName == 'TLE' ? _product() : _education(),
                //sizedBox(height: 5.0.h),
                widget.userID == AppConstants.myId ? _checkbox() : Container(),
                sizedBox(height: 10.0.h),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _updateUserName(){
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 30.w),
          child: TextField(
            controller: _userNameController,
            cursorColor: Colors.white,
            style: const TextStyle(color: Colors.white),
            // controller: emailController,
            decoration: userNameTextFieldDecoration(hint: ""),
          ),
        ),
        SizedBox(height: 10.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomWidget.dialogButton(
              name: "Update",
              isBorderColor: true,
              onClicked: () async {
                updateName();
              },
            ),
            sizedBox(
              width: 6.0,
            ),
            CustomWidget.dialogButton(
              name: Strings.cancel,
              isBorderColor: true,
              onClicked: () {
                setState(() {
                  isUpdateName = false;
                });
              },
            ),
            sizedBox(width: 6.0)
          ],
        )
      ],
    );
  }

  sizedBox({height, width}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  Widget mediaButton({mediaIcon, Function()? onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Image(
        image: AssetImage(mediaIcon),
        height: 28.w,
        width: 28.w,
      ),
    );
  }

  _clickMentor() {
    return Dialog(
      //elevation: 16,
      //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 15.h,
            ),
            Image(
              image: const AssetImage(AppImages.mentorpopup),
              height: 100.w,
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              oneUser!.isMentor == '0'
                  ? 'Do you really want to be a Mentor?'
                  : 'Do you really want to unsubscribe from Mentorship?',
              style: boldText(),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomWidget.myButton(
                  isBorder: true,
                  name: Strings.nO,
                  size: const Size(70, 30),
                  onClicked: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(width: 8.w),
                CustomWidget.myButton(
                  isBorder: false,
                  name: Strings.yes,
                  size: const Size(70, 30),
                  onClicked: () async {
                    if (oneUser!.isMentor == '0') {
                      await mentorSub()
                          .then((value) => Navigator.of(context).pop());

                      await setDataFromDB();
                    } else {
                      await mentorUnSub()
                          .then((value) => Navigator.of(context).pop());
                      await setDataFromDB();
                    }
                  },
                ),
                SizedBox(width: 6.w)
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _aboutMe() {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColor.white,
        ),
        child: Column(
          children: [
            Container(
              height: 3,
              color: AppColor.secAppBar,
            ),
            SizedBox(
              height: widget.userID == AppConstants.myId ? 0 : 10,
            ),
            CustomWidget.addTitle(
              icon: Icons.edit,
              title: Strings.about_Me,
              userID: widget.userID,
              onPressed: () {
                setState(
                  () {
                    writeAbout = true;
                    _aboutController.text = oneUser?.description ?? '';
                  },
                );
              },
            ),
            SizedBox(
              height: widget.userID == AppConstants.myId ? 0 : 10,
            ),
            writeAbout
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          minLines: 1,
                          maxLines: 5,
                          controller: _aboutController,
                          decoration: InputDecoration(
                            isDense: true,
                            hintStyle: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                            ),
                            // contentPadding: EdgeInsets.only(top: 8.h),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            CustomWidget.dialogButton(
                              name: Strings.cancel,
                              isBorderColor: true,
                              onClicked: () {
                                setState(
                                  () {
                                    writeAbout = false;
                                  },
                                );
                              },
                            ),
                            SizedBox(width: 8.w),
                            CustomWidget.dialogButton(
                              name: Strings.save,
                              isBorderColor: false,
                              onClicked: () async {
                                if (_aboutController.text != "") {
                                  await editDescription();
                                  await setDataFromDB();
                                }
                              },
                            ),
                            SizedBox(width: 6.w),
                          ],
                        ),
                      ],
                    ),
                  )
                : Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        oneUser?.description ?? '',
                        textAlign: TextAlign.start,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColor.grey,
                          fontSize: ScreenUtil().setSp(14),
                        ),
                      ),
                    ),
                  ),
            sizedBox(height: 7.0),
          ],
        ),
      ),
    );
  }

  Widget _interest() {
    return Card(
      elevation: 2,
      child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: widget.userID == AppConstants.myId ? 0 : 10,
              ),
              CustomWidget.addTitle(
                  icon: Icons.edit,
                  title: "INTERESTS",
                  userID: widget.userID,
                  onPressed: () {
                    setState(() {
                      isShowIntrested = true;
                    });
                  }),
              isShowIntrested
                  ? Column(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            controller: _interestController,
                            // controller: emailController,
                            maxLength: 17,
                            decoration:
                                WidgetStyle.nameTextFieldDecoration(hint: ""),
                          ),
                        ),
                        sizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomWidget.dialogButton(
                              name: Strings.add,
                              isBorderColor: false,
                              onClicked: () {
                                setState(() {
                                  if (_interestController.text != "") {
                                    values.add(_interestController.text);
                                  }
                                  _interestController.clear();
                                });
                              },
                            ),
                            sizedBox(width: 6.0),
                            CustomWidget.dialogButton(
                              name: Strings.save,
                              isBorderColor: false,
                              onClicked: () async {
                                setState(() {
                                  valuesString = values.toString();
                                  valuesString =
                                      valuesString!.replaceAll('[', "");
                                  valuesString =
                                      valuesString!.replaceAll(']', "");
                                });

                                await addInterest(valuesString);

                                //await setDataFromDB();
                              },
                            ),
                            sizedBox(
                              width: 6.0,
                            ),
                            CustomWidget.dialogButton(
                              name: Strings.cancel,
                              isBorderColor: false,
                              onClicked: () {
                                setState(() {
                                  isShowIntrested = false;
                                });
                              },
                            ),
                            sizedBox(width: 6.0)
                          ],
                        )
                      ],
                    )
                  : const SizedBox(),
              SizedBox(
                height: widget.userID == AppConstants.myId
                    ? isShowIntrested
                        ? 5
                        : 0
                    : 10,
              ),
              isShowIntrested == false
                  ? Wrap(
                      spacing: 1,

                      direction: Axis.horizontal,

                      alignment: WrapAlignment.start,

                      runAlignment: WrapAlignment.start,
                      runSpacing: 5.0,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      //  textDirection,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.hardEdge,
                      children: [
                        for (int i = 0; i < values.length; i++)
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: AppColor.blue,
                            ),
                            child: Text(
                              values[i] ?? '',
                              textAlign: TextAlign.start,
                              style: WidgetStyle.forgotTExtStyle(
                                color: AppColor.white,
                                fontSize: ScreenUtil().setSp(14),
                              ),
                            ),
                          ),
                      ],
                    )
                  : Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      runAlignment: WrapAlignment.start,
                      runSpacing: 5.0,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      //  textDirection,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.hardEdge,
                      children: [
                        for (int i = 0; i < values.length; i++)
                          values.isNotEmpty
                              ? Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    color: AppColor.blue,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        values[i] ?? '',
                                        textAlign: TextAlign.start,
                                        style: WidgetStyle.forgotTExtStyle(
                                          color: AppColor.white,
                                          fontSize: ScreenUtil().setSp(14),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            values.removeAt(i);
                                          });
                                        },
                                        child: const Icon(
                                          Icons.close,
                                          color: AppColor.white,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Container(),
                      ],
                    ),
              sizedBox(height: 7.0)
            ],
          )),
    );
  }

  Widget _experience() {
    return Card(
      elevation: 2,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColor.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: widget.userID == AppConstants.myId ? 0 : 10,
              ),
              CustomWidget.addTitle(
                icon: Icons.add,
                title:
                    AppConstants.appName == "TLE" ? "PROFESSION" : "EXPERIENCE",
                userID: widget.userID,
                onPressed: () async {
                  await CustomWidget.addExperienceDialogue(
                    context: context,
                    check: 1,
                    experienceId: '',
                    designation: '',
                    company: '',
                    startYear: '',
                    endYear: '',
                    logoChange: "",
                    industry: oneUser?.industryName,
                  );
                  await setDataFromDB();
                },
              ),
              SizedBox(
                height: widget.userID == AppConstants.myId ? 0 : 10,
              ),
              _experienceList.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'No Experience Added',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(14),
                          color: AppColor.black45,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: _experienceList.length,
                      shrinkWrap: true,
                      reverse: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return detailsWidget(
                          logo: _experienceList[index].companyImage,
                          date:
                              '${_experienceList[index].startDate} - ${_experienceList[index].endDate}',
                          title: _experienceList[index].position,
                          subtitle: _experienceList[index].campanyName,
                          isEducation: false,
                          userID: widget.userID,
                          onPressed: () async {
                            await CustomWidget.addExperienceDialogue(
                              context: context,
                              check: 2,
                              experienceId: _experienceList[index].id,
                              designation: _experienceList[index].position,
                              company: _experienceList[index].campanyName,
                              startYear: _experienceList[index].startDate,
                              endYear: _experienceList[index].endDate,
                              logoChange: _experienceList[index].logoChangeable,
                              industry: oneUser?.industryName,
                            );
                            await setDataFromDB();
                          },
                        );
                      },
                    ),
              sizedBox(height: 7.0),
            ],
          )),
    );
  }

  Widget _userImage() {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: 75.h,
        width: 75.w,
        child: Stack(
          children: [
            widget.userID != AppConstants.myId
                ? CircleAvatar(
                    child: oneUser?.image == ''
                        ? Image(
                            image: const AssetImage(AppImages.profile),
                            width: 80.w,
                            height: 80.w,
                          )
                        : GestureDetector(
                            onTap: () {
                              Get.to(() => FullFileView(
                                  image: oneUser!.image ?? '', type: 'image'));
                            },
                            child: CachedNetworkImage(
                              imageUrl: oneUser?.image ?? '',
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: 80.w,
                                height: 80.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  //   color: AppColor.white,
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      CircularProgressIndicator(
                                          value: downloadProgress.progress),
                              errorWidget: (context, url, error) =>
                                  CircleAvatar(
                                //profile image
                                backgroundColor: AppColor.white,
                                backgroundImage:
                                    const AssetImage(AppImages.profile),
                                radius: 33.r,
                              ),
                            ),
                          ),
                    radius: 33.r,
                    backgroundColor: AppColor.black,
                  )
                : GetBuilder<ProfileController>(
                    builder: (_) {
                      return CircleAvatar(
                        child: _.image == ''
                            ? Image(
                                image: const AssetImage(AppImages.profile),
                                width: 80.w,
                                height: 80.w,
                              )
                            : GetBuilder<ProfileController>(builder: (_) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(() => FullFileView(
                                        image: oneUser!.image ?? '',
                                        type: 'image'));
                                  },
                                  child: CachedNetworkImage(
                                    imageUrl: _.image ?? '',
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      width: 80.w,
                                      height: 80.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        //   color: AppColor.white,
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    progressIndicatorBuilder: (context, url,
                                            downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                    errorWidget: (context, url, error) =>
                                        CircleAvatar(
                                      //profile image
                                      backgroundColor: AppColor.white,
                                      backgroundImage:
                                          const AssetImage(AppImages.profile),
                                      radius: 33.r,
                                    ),
                                  ),
                                );
                              }),
                        radius: 33.r,
                        backgroundColor: AppColor.black,
                      );
                    },
                  ),
            widget.userID == AppConstants.myId
                ? Positioned(
                    //position for button background
                    bottom: 12.h,
                    right: 15.w,
                    child: //Gesture Detector
                        GestureDetector(
                      onTap: () async {
                        await galleryImage();
                        await uploadUserImage();
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColor.white,
                        radius: 10.r,
                        child: Center(
                          child: Icon(
                            Icons.camera_enhance,
                            color: AppColor.black,
                            size: 15.w,
                          ),
                        ),
                      ),
                    ))
                : oneUser?.isMentor == '1'
                    ? Positioned(
                        //position for button background
                        bottom: 12.h,
                        right: 12.h,
                        child: //Gesture Detector
                            GestureDetector(
                          onTap: () async {},
                          child: SizedBox(
                            height: 20.w,
                            child: const Center(
                              child: Image(
                                image: AssetImage(AppImages.mentoricon),
                              ),
                            ),
                          ),
                        ))
                    : Container(),
          ],
        ),
      ),
    );
  }

  Widget _userImage2() {
    return SizedBox(
      height: 75.h,
      width: 75.w,
      child: Stack(
        children: [
          widget.userID != AppConstants.myId
              ? CircleAvatar(
                  child: oneUser?.image == ''
                      ? Image(
                          image: const AssetImage(AppImages.profile),
                          width: 80.w,
                          height: 80.w,
                        )
                      : CachedNetworkImage(
                          imageUrl: oneUser?.image ?? '',
                          imageBuilder: (context, imageProvider) => Container(
                            width: 80.w,
                            height: 80.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              //   color: AppColor.white,
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                          errorWidget: (context, url, error) => CircleAvatar(
                            //profile image
                            backgroundColor: AppColor.white,
                            backgroundImage:
                                const AssetImage(AppImages.profile),
                            radius: 33.r,
                          ),
                        ),
                  radius: 33.r,
                  backgroundColor: AppColor.black,
                )
              : GetBuilder<ProfileController>(
                  builder: (_) {
                    return CircleAvatar(
                      child: _.image == ''
                          ? Image(
                              image: const AssetImage(AppImages.profile),
                              width: 80.w,
                              height: 80.w,
                            )
                          : GetBuilder<ProfileController>(builder: (_) {
                              return CachedNetworkImage(
                                imageUrl: _.image ?? '',
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width: 80.w,
                                  height: 80.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    //   color: AppColor.white,
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                errorWidget: (context, url, error) =>
                                    CircleAvatar(
                                  //profile image
                                  backgroundColor: AppColor.white,
                                  backgroundImage:
                                      const AssetImage(AppImages.profile),
                                  radius: 33.r,
                                ),
                              );
                            }),
                      radius: 33.r,
                      backgroundColor: AppColor.black,
                    );
                  },
                ),
        ],
      ),
    );
  }

  Widget _education() {
    return Card(
      elevation: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: widget.userID == AppConstants.myId ? 0 : 10,
          ),
          CustomWidget.addTitle(
            icon: Icons.add,
            title: "EDUCATION",
            userID: widget.userID,
            onPressed: () async {
              await CustomWidget.addEducationDialogue(
                context: context,
                check: 1,
                educationId: "",
                degree: '',
                institute: '',
                startYear: '',
                endYear: '',
              );
              await setDataFromDB();
            },
          ),
          SizedBox(
            height: widget.userID == AppConstants.myId ? 0 : 10,
          ),
          _educationList.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'No Education Added',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: AppColor.black45,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: _educationList.length,
                  shrinkWrap: true,
                  reverse: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return detailsWidget(
                      logo: '',
                      title: _educationList[index].program,
                      subtitle: _educationList[index].institute,
                      date:
                          '${_educationList[index].startDate} - ${_educationList[index].endDate}',
                      isEducation: true,
                      userID: widget.userID,
                      onPressed: () async {
                        await CustomWidget.addEducationDialogue(
                          context: context,
                          check: 2,
                          educationId: _educationList[index].id,
                          degree: _educationList[index].program,
                          institute: _educationList[index].institute,
                          startYear: _educationList[index].startDate,
                          endYear: _educationList[index].endDate,
                        );
                        await setDataFromDB();
                      },
                    );
                  },
                ),
          sizedBox(height: 7.0)
        ],
      ),
    );
  }

  Widget _product() {
    return Card(
      elevation: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: widget.userID == AppConstants.myId ? 0 : 10,
          ),
          CustomWidget.addTitle(
              icon: Icons.add,
              title: "PRODUCTS",
              userID: widget.userID,
              onPressed: () async {
                Get.to(() => const AddProductScreen(
                          productId: "",
                        ))!
                    .then((value) async => _productList = await database
                        .getUserProduct(int.parse(widget.userID ?? '0')));
                // setState(() {
                //   _productList.clear();
                // });
                // _productList = await database
                //     .getUserProduct(int.parse(widget.userID ?? '0'));
              }),
          SizedBox(
            height: widget.userID == AppConstants.myId ? 0 : 10,
          ),
          _productList.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'No Products Added',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: AppColor.black45,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: _productList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => ProductDetailScreen(
                              productId: _productList[index].id,
                            ));
                      },
                      child: prodDetailsWidget(
                        logo: _productList[index].coverImage,
                        title: _productList[index].productName,
                        subtitle: _productList[index].description,
                        date: _productList[index].dueDate,
                        isEducation: true,
                        userID: widget.userID,
                        city: _productList[index].cityName,
                        price: _productList[index].productPrice,
                        onPressed: () async {
                          Get.to(
                            () => AddProductScreen(
                              productId: _productList[index].id.toString(),
                            ),
                          )!
                              .then(
                            (value) async => _productList =
                                await database.getUserProduct(
                                    int.parse(widget.userID ?? '0')),
                          );
                          // setState(() {
                          //   _productList.clear();
                          // });
                          // _productList = await database
                          //     .getUserProduct(int.parse(widget.userID ?? '0'));
                          // await setDataFromDB();
                        },
                      ),
                    );
                  },
                ),
          sizedBox(height: 7.0),
        ],
      ),
    );
  }

  Widget detailsWidget(
      {logo, title, subtitle, date, onPressed, isEducation, userID}) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 10,
        top: 4,
        bottom: 5,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomWidget.experienceImage(
                  logoImage: logo, isEducation: isEducation),
              SizedBox(width: 20.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      subtitle ?? '',
                      style: WidgetStyle.ts4,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      date ?? '',
                      style: WidgetStyle.ts4,
                    ),
                  ],
                ),
              ),
              widget.userID == AppConstants.myId
                  ? IconButton(
                      onPressed: onPressed,
                      icon: Icon(
                        Icons.edit,
                        color: AppColor.black,
                        size: 15.h,
                      ),
                    )
                  : Container(),
            ],
          ),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }

  Widget prodDetailsWidget(
      {logo,
      title,
      subtitle,
      date,
      onPressed,
      isEducation,
      userID,
      city,
      price}) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 0,
        top: 4,
        bottom: 5,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: logo ?? '',
                imageBuilder: (context, imageProvider) => Container(
                  width: 55.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    // shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Container(
                  width: 55.0,
                  height: 40.0,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Image.asset(
                    isEducation! ? AppImages.noImage : AppImages.experience,
                  ),
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      subtitle ?? '',
                      style: WidgetStyle.ts4,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Wrap(
                      spacing: 10,
                      runSpacing: 5,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.location_on_outlined, size: 15.r),
                            Text(
                              city ?? '',
                              style: WidgetStyle.ts4,
                            ),
                          ],
                        ),

                        // SizedBox(width: 15.w),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.calendar_today_outlined, size: 13.r),
                            Text(
                              date ?? '',
                              style: WidgetStyle.ts4,
                            ),
                          ],
                        ),

                        Text(
                          'PKR. $price',
                          style: WidgetStyle.ts4,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              widget.userID == AppConstants.myId
                  ? IconButton(
                      onPressed: onPressed,
                      icon: Icon(
                        Icons.edit,
                        color: AppColor.black,
                        size: 15.h,
                      ),
                    )
                  : Container(),
            ],
          ),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }

  Widget _checkbox() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w).copyWith(top: 10.h),
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 15.h,
            width: 15.w,
            child: Checkbox(
              activeColor: AppColor.primaryColor,
              value: shareLocation,
              onChanged: (value) async {
                await enableLoSharing(value ?? true);
                setState(() {
                  shareLocation = value;
                });
              },
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Text(
              'Share location with others for networking',
              style: TextStyle(
                // color: AppColor.grey,
                fontSize: ScreenUtil().setSp(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getUserInfo() async {
    print('this user id is used: ${widget.userID}');
    setDataFromDB();
    DataFetched dataFetched =
        await ApiHelper.getUserInfo(context, widget.userID);
    print('user_info');
    if (dataFetched.done) {
      setDataFromDB();
    }
  }

  Future<void> setDataFromDB() async {
    //oneUser = null;
    _educationList =
        await database.getUserEducation(int.parse(widget.userID ?? '0'));
    _experienceList =
        await database.getUserExperience(int.parse(widget.userID ?? '0'));
    _interestList =
        await database.getUserInterests(int.parse(widget.userID ?? '0'));
    _productList =
        await database.getUserProduct(int.parse(widget.userID ?? '0'));

    oneUser = await database.getSingleUser(widget.userID ?? '');
    print("Db LinkedIn= ${oneUser?.linkedinUrl}");
    print("Db fb= ${oneUser?.facebookUrl}");
    await getData();

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? loc = localStorage.getString('sharingLoc');
    _userNameController.text = oneUser?.firstName ?? "";

    if (mounted) {
      setState(() {
        loc == "1" ? shareLocation = true : shareLocation = false;
      });
    }
    if (mounted) {
      setState(() {
        fetchedData = true;
      });
    }
  }

  Future<void> addInterest(values) async {
    setState(() {
      wait = true;
    });
    var response = await ApiCalls.addInterests(
      AppConstants.myId,
      values,
    );
    if (response is ErrorEntity) {
      UIHelper.showErrorAlert(context, response.message);
    } else {
      AddInterestEntity addInterestEntity =
          AddInterestEntity().fromJson(response);
      if (addInterestEntity.success == 1) {
        setState(
          () {
            isShowIntrested = false;
          },
        );
      }
    }
    setState(() {
      wait = false;
    });
  }

  Future<void> uploadUserImage() async {
    setState(() {
      wait = true;
    });
    String url = AppConstants.baseUrl + 'api/user_image_update';
    Map map = {
      'user_id': AppConstants.myId,
    };
    print(_imagePath);
    ApiResponse apiResponse =
        await NetworkConfig.uploadFileWithToken(url, map, _imagePath ?? '');
    setState(() {
      wait = false;
    });

    print(apiResponse.done);
    print(apiResponse.errorMsg);
    print(apiResponse.responseString);

    if (apiResponse.done ?? false) {
      UploadProfileResponse response =
          UploadProfileResponse.fromJson(apiResponse.responseString ?? '');
      if (response.success == 1) {
        print('////////////////+************User image uploaded bro');
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString("userImage", response.message ?? '');
        controller.image = response.message;
        controller.updateImage(response.message ?? '');

        await Fluttertoast.showToast(msg: 'Your image uploaded');
      } else {
        UIHelper.showErrorAlert(context, 'response.message');
        print(response.message);
      }
    }
  }

  Future<void> mentorSub() async {
    UIHelper.apiCallingAlert(context);
    var response = await ApiCalls.mentorSubscribe(
      userid: AppConstants.myId,
      status: 'subscribe',
    );
    UIHelper.hideApiCallingAlert(context);
    if (response is ErrorEntity) {
    } else {
      MentorSubEntity subEntity = MentorSubEntity().fromJson(response);
      if (subEntity.success == 1) {
        database.editMentorStatus(
          AppConstants.myId,
          '1',
        );
        database.editMentorUsers(
          AppConstants.myId,
          '1',
        );
      }
    }
  }

  Future<void> mentorUnSub() async {
    UIHelper.apiCallingAlert(context);
    var response = await ApiCalls.mentorSubscribe(
      userid: AppConstants.myId,
      status: 'unsubscribe',
    );
    UIHelper.hideApiCallingAlert(context);
    if (response is ErrorEntity) {
    } else {
      MentorSubEntity subEntity = MentorSubEntity().fromJson(response);
      if (subEntity.success == 1) {
        database.editMentorStatus(
          AppConstants.myId,
          '0',
        );
        database.editMentorUsers(
          AppConstants.myId,
          '0',
        );
      }
    }
  }

  Future<void> updateConnectStatus({status, connectStatus}) async {
    setState(() {
      wait = true;
    });
    var response = await ApiCalls.updateConnectionStatus(
      senderId: AppConstants.myId,
      receiverId: widget.userID,
      status: status,
    );
    setState(() {
      wait = false;
    });

    if (response is ErrorEntity) {
    } else {
      UpdateConnectEntity connectEntity =
          UpdateConnectEntity().fromJson(response);
      if (connectEntity.success == 1) {
        database.editConnectStatus(widget.userID ?? '', connectStatus);
        database.editConnectUsers(widget.userID ?? '', connectStatus);
      }
    }
  }

  Future<void> editDescription() async {
    print('edit_user_description');
    setState(() {
      wait = true;
    });
    var response = await ApiCalls.editDescription(
      userId: AppConstants.myId,
      description: _aboutController.text,
    );

    if (response is ErrorEntity) {
    } else {
      EditDescriptionEntity descriptionEntity =
          EditDescriptionEntity().fromJson(response);
      if (descriptionEntity.success == 1) {
        database.editDescriptionUser(AppConstants.myId, _aboutController.text);
        setState(() {
          writeAbout = false;
          wait = false;
        });
      }
    }
  }

  Future<void> loadCompanies() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var last_sync = localStorage.getString('last_sync_companies');
    var response = await ApiCalls.loadCompanies();
    print('load_company_hints');
    if (response is ErrorEntity) {
      UIHelper.showErrorAlert(context, response.message);
    } else {
      CompanyHintsEntity hintsEntity = CompanyHintsEntity().fromJson(response);
      if (hintsEntity.success == 1) {
        localStorage.setString(
            'last_sync_companies', DateTime.now().toString());
        database.insertAllCompanies(hintsEntity.companyHints!);
      }
    }
  }

  Future<void> loadDesignations() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    //var last_sync = localStorage.getString('last_sync_designations');
    var response = await ApiCalls.loadDesignations(
      userId: AppConstants.myId,
      //last_sync: last_sync ?? '',
    );
    print('load_designations');
    if (response is ErrorEntity) {
      UIHelper.showErrorAlert(context, response.message);
    } else {
      DesignationHintsEntity hintsEntity =
          DesignationHintsEntity().fromJson(response);
      if (hintsEntity.success == 1) {
        database.deleteDesignations();
        localStorage.setString(
            'last_sync_designations', DateTime.now().toString());
        database.insertAllDesignations(hintsEntity.designations!);
      }
    }
  }

  Future<void> enableLoSharing(bool sharingLoc) async {
    setState(() {
      wait = true;
    });
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var response = await ApiCalls.enableLocationSharing(
      userId: AppConstants.myId,
      sharingLoc: sharingLoc == true ? "1" : "0",
    );
    if (response is ErrorEntity) {
      //UIHelper.showErrorAlert(context, response.message);
    } else {
      EnableLocSharingEntity sharingEntity =
          EnableLocSharingEntity().fromJson(response);
      if (sharingEntity.success == 1) {
        localStorage.setString('sharingLoc', sharingLoc == true ? "1" : "0");
        database.editSharingLoc(
            AppConstants.myId, sharingLoc == true ? "1" : "0");

        await Fluttertoast.showToast(msg: sharingEntity.message);
      }
    }
    setState(() {
      wait = false;
    });
  }

  Future<void> updateName() async {
    UIHelper.apiCallingAlert(context);
    var response = await ApiCalls.getUpdateUserName(
      name: _userNameController.text,
    );
    if (response is ErrorEntity) {
      setState(() {
        isUpdateName = false;
      });
      UIHelper.hideApiCallingAlert(context);
    }
    else {
      if(json.decode(json.encode(response))["success"] == 1){
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('firstName',_userNameController.text);
        UIHelper.hideApiCallingAlert(context);
        UIHelper.showSuccessAlert(context, json.decode(json.encode(response))["message"], ()=> Navigator.pop(context));
        setState(() {
          isUpdateName = false;
        });

        getUserInfo();
      }
      else{
        setState(() {
          isUpdateName = false;
        });
        UIHelper.hideApiCallingAlert(context);
      }
    }
  }

  InputDecoration userNameTextFieldDecoration({hint}) {
    return InputDecoration(
      errorStyle: TextStyle(fontSize: 13.sp),
      contentPadding: const EdgeInsets.only(bottom: 4.0, top: 15),
      counterText: "",
      prefixIconConstraints: const BoxConstraints(
        minWidth: 23,
        maxHeight: 25,
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      hintStyle: TextStyle(
        fontSize: ScreenUtil().setSp(12),
        color: AppColor.greyshade400,
      ),
      hintText: hint,
      isDense: true,
    );
  }

  Future<void> sendInvitation(status) async {
    UIHelper.apiCallingAlert(context);
    var response = await ApiCalls.insertUserInvitation(
      senderId: AppConstants.myId,
      receiverId: widget.userID,
      status: status,
    );
    UIHelper.hideApiCallingAlert(context);
    if (response is ErrorEntity) {
      UIHelper.hideApiCallingAlert(context);
    }
    else {
      GetInvitationEntity entity = GetInvitationEntity().fromJson(response);
      if (entity.success == 1) {
        Get.back();
        UIHelper.showSuccessAlert(
          context,
          "Your report is in Review",
              () {
            Get.back();
          },
        );
      }
    }
  }

}
