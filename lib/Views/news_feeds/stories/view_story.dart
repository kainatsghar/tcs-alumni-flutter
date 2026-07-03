import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:http/http.dart' as http;
import 'package:iobm/networkcalls/response_models/add_story_entity.dart';

import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';

import 'package:iobm/utils/app_images.dart';
import 'package:story_view/story_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Widgets/custom_widgets.dart';
import '../../../controllers/profile_controller.dart';
import '../../../networkcalls/api_helper.dart';
import '../../../networkcalls/response_models/seen_story_entity.dart';
import '../../../networkcalls/response_models/stories_entity.dart';
import '../../../networkcalls/response_models/story_seen_by.dart';
import '../../../utils/text_styles.dart';
import '../../bottom_navigationbar.dart';
import '../../more/profile_screen.dart';

class ViewStory extends StatefulWidget {
  final String? name;
  final String? image;
  final String? userId;
  final List<Story>? storiesList;
  // final String? date;
  // final String? storyId;
  const ViewStory(
      {Key? key,
        this.name,
        this.image,
        this.userId, this.storiesList})
      : super(key: key);

  @override
  _ViewStoryState createState() => _ViewStoryState();
}

class _ViewStoryState extends State<ViewStory> {
  final StoryController controller = StoryController();
  final ProfileController pController = Get.find();
  final UpdateTimeController dateController = Get.put(UpdateTimeController());
  List _deviceTokens = [];
  final _replyController = TextEditingController();


  var nums = [];
  String? largeId;
  String? smallId;
  String? readLength;
  int currentIndex = 0;
  List<StoryItem> storyItems = [];

  @override
  void initState() {
    //region Other Code
    nums = [int.parse(AppConstants.myId), int.parse(widget.userId ?? '')];
    nums.sort();
    setState(() {
      largeId = nums.last.toString();
      smallId = nums.first.toString();
    });
    _addStories();
    //endregion
    _initializeToken();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // List<StoryItem> storyItems = [
    //   widget.url!.endsWith('mp4')
    //       ? StoryItem.pageVideo(
    //           widget.url ?? '',
    //           controller: controller,
    //         )
    //       : StoryItem.pageImage(
    //           url: widget.url ?? '',
    //           controller: controller,
    //           duration: const Duration(seconds: 10),
    //         ),
    // ];

    return Scaffold(
      body: Stack(
        children: [
          StoryView(
            storyItems: storyItems,
            onComplete: () {
              Get.back();
            },
            onStoryShow: (s, index) {
              currentIndex = index;
              dateController.calculateDifference(widget.storiesList![currentIndex].storyTime.toString());
              dateController.fetchStoryLink(widget.storiesList![currentIndex].link ?? "");
              if (widget.userId == AppConstants.myId) {
                dateController.seenByApi(widget.storiesList![currentIndex].id ?? "0");
              } else {
                storySeen(widget.storiesList![currentIndex].id);
              }
            },
            controller: controller,
          ),
          // Top Left: Back button and Profile
          Positioned(
            top: 45.h,
            left: 3,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColor.white,
                    size: 25.r,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => ProfileScreen(userID: widget.userId));
                  },
                  child: CircleAvatar(
                    child: widget.image == ''
                        ? Image(
                            image: const AssetImage(AppImages.profile),
                            width: 45.w,
                            height: 45.h,
                          )
                        : CachedNetworkImage(
                            imageUrl: widget.image ?? '',
                            imageBuilder: (context, imageProvider) => Container(
                              height: 45.w,
                              width: 45.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) => Image(
                              image: const AssetImage(AppImages.profile),
                              height: 50.w,
                              width: 50.h,
                            ),
                            progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(
                              value: downloadProgress.progress,
                            ),
                          ),
                  ),
                ),
                SizedBox(width: 15.w),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => ProfileScreen(userID: widget.userId));
                      },
                      child: Container(
                        width: 150.w,
                        height: 20.h,
                        color: Colors.transparent,
                        child: Text(
                          widget.name ?? '',
                          style: CustomTextStyles.text12SemiBoldW600.copyWith(
                            overflow: TextOverflow.ellipsis,
                            color: AppColor.white,
                          ),
                        ),
                      ),
                    ),
                    GetBuilder<UpdateTimeController>(builder: (_) {
                      return Text(
                        _.changedDate ?? "",
                        style: CustomTextStyles.text12SemiBoldW600.copyWith(
                          color: AppColor.white,
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
          // Top Right: More Menu
          if (widget.userId == AppConstants.myId)
            Positioned(
              top: 45.h,
              right: 5,
              child: PopupMenuButton(
                onSelected: (value) {
                  deleteStory(widget.storiesList![currentIndex].id);
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      value: 0,
                      child: Text(
                        'Delete Story',
                        style: CustomTextStyles.text12SemiBoldW600,
                      ),
                    )
                  ];
                },
                icon: const Icon(
                  Icons.more_vert,
                  color: AppColor.white,
                ),
                color: AppColor.white,
              ),
            ),
          // Bottom Center: Seen By / Reply
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: widget.userId == AppConstants.myId
                ? Center(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onVerticalDragUpdate: (_) {
                        _showSeen();
                      },
                      child: Container(
                        width: 150.w, // Narrower width so sides are clickable
                        color: AppColor.transparent,
                        height: 80.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.keyboard_arrow_up,
                              size: 30.r,
                              color: AppColor.white,
                            ),
                            Text(
                              'Seen By',
                              style: CustomTextStyles.text16SemiBoldW600.copyWith(color: AppColor.textWhiteColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onVerticalDragUpdate: (_) {
                        storyReply();
                        _replyController.clear();
                      },
                      child: Container(
                        width: 150.w, // Narrower width
                        color: AppColor.transparent,
                        height: 80.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.keyboard_arrow_up,
                              size: 30.r,
                              color: AppColor.white,
                            ),
                            Text(
                              'Reply',
                              style: CustomTextStyles.text16SemiBoldW600.copyWith(color: AppColor.textWhiteColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
          // Visit Link Positioned (existing, kept separate)
          GetBuilder<UpdateTimeController>(builder: (_) {
            return _.storyLink!.isNotEmpty
                ? Positioned(
                    top: 50.h,
                    right: 50.w,
                    child: CustomWidget.dialogButton(
                      name: 'Visit Link',
                      isBorderColor: true,
                      onClicked: () {
                        _launchInBrowser(_.storyLink ?? "");
                      },
                    ),
                  )
                : Container();
          }),
        ],
      ),
    );
    }

  _addStories(){
    storyItems.clear();
    for(int i=0; i<widget.storiesList!.length; i++){
      storyItems.add( widget.storiesList![i].storyImage!.endsWith('mp4')
          ? StoryItem.pageVideo(
        widget.storiesList![i].storyImage ?? '',
        controller: controller,
      )
          : StoryItem.pageImage(
        url: widget.storiesList![i].storyImage ?? '',
        controller: controller,
        duration: const Duration(seconds: 10),
      )
      );
    }
  }

  _showSeen() {
    controller.pause();
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        constraints: BoxConstraints.tight(
          Size(double.infinity, MediaQuery.of(context).size.height * 0.5),
        ),
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return GetBuilder<UpdateTimeController>(builder: (_){
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration:  BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Seen By',
                            style: CustomTextStyles.text16SemiBoldW600.copyWith(color: AppColor.textWhiteColor),
                          ),
                          Text(
                            ' (${_.seenUsers.length.toString()})',
                            style: CustomTextStyles.text16SemiBoldW600.copyWith(color: AppColor.textWhiteColor),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      itemCount: _.seenUsers.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            print("_seenUsers[index].userId= ${_.seenUsers[index].userId}");
                            Get.to(()=> ProfileScreen(userID: _.seenUsers[index].userId.toString(),));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                _profilePicture(
                                    _.seenUsers[index].image ?? '', index),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  _.seenUsers[index].name ?? '',
                                  style: TextStyle(fontSize: 14.sp),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10.h,)
                  ],
                ),
              );
            });
          });
        }).then((value) => controller.play());
  }

  storyReply() {
    controller.pause();
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        constraints: BoxConstraints.tight(
            Size(double.infinity, MediaQuery.of(context).size.height * 0.63)),
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration:  BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Reply',
                        style: CustomTextStyles.text16SemiBoldW600.copyWith(color: AppColor.textWhiteColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      autofocus: true,
                      controller: _replyController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: () async {
                              /// Chat add Collection
                              FirebaseFirestore.instance
                                  .collection('chats')
                                  .doc('chatsScreen')
                                  .collection('$largeId-$smallId')
                                  .doc(DateTime.now()
                                  .millisecondsSinceEpoch
                                  .toString())
                                  .set(
                                {
                                  'message': _replyController.text,
                                  "media_url": widget.storiesList![currentIndex].storyImage,
                                  'messageId': DateTime.now()
                                      .millisecondsSinceEpoch
                                      .toString(),
                                  'messageKey': "$largeId-$smallId",
                                  "read": false,
                                  "readStatus": '1',
                                  "received": true,
                                  "receiverId": "${widget.userId}",
                                  "send": true,
                                  "status": "",
                                  "senderId": AppConstants.myId,
                                  "type": 'storyReply',
                                  "timeStamp": DateFormat('yyyy/MM/dd HH:mm:ss')
                                      .format(DateTime.now()),
                                },
                              );

                              /// Message Keys Collection
                              FirebaseFirestore.instance
                                  .collection('messageKeys')
                                  .doc('keys')
                                  .collection(AppConstants.myId)
                                  .doc(widget.userId)
                                  .set(
                                {
                                  "id": widget.userId,
                                  "imageUrl": widget.image,
                                  "readStatus": '0',
                                  "lastText": "Story Reply",
                                  "messageKey": "$largeId-$smallId",
                                  "name": widget.name ?? '',
                                  "time": DateFormat('yyyy/MM/dd HH:mm:ss')
                                      .format(DateTime.now()),
                                },
                              );

                              await getNameAddress();

                              /// Message Keys Collection
                              FirebaseFirestore.instance
                                  .collection('messageKeys')
                                  .doc('keys')
                                  .collection(widget.userId ?? '')
                                  .doc(AppConstants.myId)
                                  .set({
                                "id": AppConstants.myId,
                                "imageUrl": pController.image,
                                "readStatus": readLength,
                                "lastText": "Story Reply",
                                "messageKey": "$largeId-$smallId",
                                "name": AppConstants.userName,
                                "time": DateFormat('yyyy/MM/dd HH:mm:ss')
                                    .format(DateTime.now()),
                              });
                              Get.back();
                              await Fluttertoast.showToast(msg: 'Replied..');
                              await sendPushNotification();
                            },
                            icon: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5.r)),
                                  color: AppColor.greyshade400,
                                ),
                                child:  Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 3.0, horizontal: 5.0),
                                  child: Icon(
                                    Icons.send_rounded,
                                    color: AppColor.primaryColor,
                                  ),
                                ))),
                      ),
                    ),
                  ),
                ),
              ],
            );
          });
        }).then((value) => controller.play());
  }

  Future<void> getNameAddress() async {
    final doc = await FirebaseFirestore.instance
        .collection('chats')
        .doc('chatsScreen')
        .collection('$largeId-$smallId')
        .where('readStatus', isNotEqualTo: '0')
        .get();
    setState(() {
      readLength = doc.docs.length.toString();
    });
  }

  Widget _profilePicture(String image, int index) {
    return SizedBox(
      height: 50.w,
      width: 50.w,
      child: CircleAvatar(
        backgroundColor: AppColor.white,
        child: image == ''
            ? Image(
          image: const AssetImage(AppImages.profile),
          width: 50.w,
          height: 50.w,
        )
            : CachedNetworkImage(
          imageUrl: image,
          imageBuilder: (context, imageProvider) => Container(
            height: 50.w,
            width: 50.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          errorWidget: (context, url, error) => Image(
            image: const AssetImage(AppImages.profile),
            height: 50.w,
            width: 50.w,
          ),
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
        ),
      ),
    );
  }

  Future<void> deleteStory(id) async {
    var response = await ApiCalls.deleteTimelineStory(storyId: id);
    if (response is ErrorEntity) {
    }
    else {
      AddStoryEntity storyEntity =
      AddStoryEntity.fromJson(jsonEncode(response));
      if (storyEntity.success == 1) {
        Get.offUntil(GetPageRoute(page: () => const BottomNavigationScreen()),
                (route) => false);
      }
    }
  }

  Future<void> storySeen(dynamic storyId) async {
    var response = await ApiCalls.seenStory(storyId: storyId);
    if (response is ErrorEntity) {
    }
    else {
      SeenStoryEntity storyEntity = SeenStoryEntity.fromJson(jsonEncode(response));
      if (storyEntity.success == 1) {
        print("Story has been seen");
      }
    }
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> sendPushNotification() async {
    print(_deviceTokens);
    Map<String, String> headers = {
      'content-type': 'application/json',
      'Authorization': AppConstants.pushNotificationKey,
    };
    Map map = {
      "registration_ids": _deviceTokens,
      "notification": {
        "body": "New message",
        "title": "${AppConstants.userName} replied to your story",
      }
    };

    var response = await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      body: jsonEncode(map),
      headers: headers,
    );
    print(response.body);
    if (response.statusCode == 200) {
      print("Sent Notification");
    }
    else {
      print("error");
    }
  }

  _initializeToken(){
    for (var element in replyUserDevices!) {
      if (element.status == "A") {
        _deviceTokens.add(element.token);
      }
    }
  }

}

class StoryUser {
  int? userId;
  String? name;
  String? image;

  StoryUser({
    this.userId,
    this.name,
    this.image,
  });
}

class UpdateTimeController extends GetxController{
  String? changedDate;
  String? storyLink;
  List<StoryUser> seenUsers = [];

  calculateDifference(String dateTime) {
    print("Date Passed= $dateTime");
    String? dif;
    DateFormat dft = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime d = dft.parse(dateTime);

    int difference = DateTime.now().difference(d).inSeconds;

    if (difference <= 60) {
      dif = "Now";
    }
    else if (difference <= 3600) {
      dif = DateTime.now().difference(d).inMinutes.toString();
      if (dif == "1") {
        dif = DateTime.now().difference(d).inMinutes.toString() + " min ago";
      }
      else {
        dif = DateTime.now().difference(d).inMinutes.toString() + " mins ago";
      }
    }
    else if (difference <= 86400) {
      dif = DateTime.now().difference(d).inHours.toString();
      if (dif == "1") {
        dif = DateTime.now().difference(d).inHours.toString() + " hour ago";
      } else {
        dif = DateTime.now().difference(d).inHours.toString() + " hours ago";
      }
    }
    else if (difference <= 2592000) {
      dif = DateTime.now().difference(d).inDays.toString();
      if (dif == "1") {
        dif = DateTime.now().difference(d).inDays.toString() + " day ago";
      } else {
        dif = DateTime.now().difference(d).inDays.toString() + " days ago";
      }
    }
    else {
      dif = dateTime;
    }
    changedDate =  dif;
    update();
  }

  fetchStoryLink(String link){
    storyLink = link;
    print("storyLink= $storyLink");
    update();
  }

  Future<void> seenByApi(dynamic storyId) async {
    var response = await ApiCalls.seenBy(storyId: storyId);
    if (response is ErrorEntity) {
    }
    else {
      SeenByEntity storyEntity = SeenByEntity.fromJson(jsonEncode(response));
      if (storyEntity.success == 1) {
        seenUsers.clear();
        for (var element in storyEntity.user!) {
          seenUsers.add(
            StoryUser(
              userId: element.userId,
              name: element.firstName,
              image: element.userImage,
            ),
          );
        }
        update();
        print("seenUsers= ${seenUsers.length}");
      }
    }
  }

}