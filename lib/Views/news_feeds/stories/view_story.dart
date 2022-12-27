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
import 'package:iobm/utils/app_utils.dart';
import 'package:story_view/story_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Widgets/custom_widgets.dart';
import '../../../controllers/profile_controller.dart';
import '../../../networkcalls/api_helper.dart';
import '../../../networkcalls/response_models/seen_story_entity.dart';
import '../../../networkcalls/response_models/stories_entity.dart';
import '../../../networkcalls/response_models/story_seen_by.dart';
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
  Timer? timeCounter;
  int currentIndex = 0;
  List<StoryItem> storyItems = [];

  @override
  void initState() {
    //region Story Index changing
    dateController.calculateDifference(widget.storiesList![0].storyTime.toString());
    dateController.fetchStoryLink(widget.storiesList![0].link??"");
    if(widget.userId == AppConstants.myId){
      dateController.seenByApi(widget.storiesList![0].id??"0");
    }
    else{
      storySeen(widget.storiesList![0].id);
    }
    timeCounter = Timer.periodic( const Duration(seconds: 10), (timeCounter){
      if(currentIndex < widget.storiesList!.length){
        try{
          currentIndex ++;
          dateController.calculateDifference(widget.storiesList![currentIndex].storyTime.toString());
          dateController.fetchStoryLink(widget.storiesList![currentIndex].link??"");
          if(widget.userId == AppConstants.myId){
            dateController.seenByApi(widget.storiesList![currentIndex].id??"0");
          }
          else{
            storySeen(widget.storiesList![currentIndex].id);
          }
          print("Timer currentIndex= $currentIndex");
        }catch(e){
          print("Exception= $e");
        }
      }
      else{
        timeCounter.cancel();
        FocusScope.of(context).unfocus();
        currentIndex = 0;
      }
    });
    //endregion
    _initializeToken();

    //region Other Code
    nums = [int.parse(AppConstants.myId), int.parse(widget.userId ?? '')];
    nums.sort();
    setState(() {
      largeId = nums.last.toString();
      smallId = nums.first.toString();
    });
    _addStories();
    //endregion
    super.initState();
  }

  @override
  void dispose() {
    timeCounter!.cancel();
    print("Timer has been cancelled");
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

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            GestureDetector(
              onTap: (){
                print("clicked");
              },
              child: StoryView(
                storyItems: storyItems,
                onComplete: () {
                  //timer!.cancel();
                  Get.back();
                },
                controller: controller,
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(right: 5, left: 3).copyWith(top: 45.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColor.white,
                          size: 25.w,
                        ),
                      ),
                      CircleAvatar(
                        child: widget.image == ''
                            ? Image(
                          image: const AssetImage(AppImages.profile),
                          width: 45.w,
                          height: 45.h,
                        )
                            : CachedNetworkImage(
                          imageUrl: widget.image ?? '',
                          imageBuilder: (context, imageProvider) =>
                              Container(
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
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                value: downloadProgress.progress,
                              ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150.w,
                            height: 18.h,
                            color: Colors.transparent,
                            child: Text(
                              widget.name ?? '',
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 14.sp,
                                color: AppColor.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          GetBuilder<UpdateTimeController>(builder: (_){
                            return Text(
                              _.changedDate??"",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColor.white,
                              ),
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                  if (widget.userId == AppConstants.myId)
                    PopupMenuButton(
                      onSelected: (value) {
                        // if (value == 0) {
                        //
                        // }
                        deleteStory(widget.storiesList![currentIndex].id);
                        // Get.back();
                      },
                      itemBuilder: (BuildContext context) {
                        return const [
                          PopupMenuItem(
                            value: 0,
                            child: Text('Delete Story'),
                          )
                        ];
                      },
                      icon: const Icon(
                        Icons.more_vert,
                        color: AppColor.white,
                      ),
                      color: AppColor.white,
                    ),
                ],
              ),
            ),
            Positioned(
              top: 85.h,
              left: 0,
              right: 0,
              child: Container(
                height: 300.h,
                color: Colors.transparent,
              ),
            ),
            GetBuilder<UpdateTimeController>(builder: (_){
              return _.storyLink!.isNotEmpty
                  ? Positioned(
                top: 50.h,
                right: 50.w,
                child: CustomWidget.dialogButton(
                    name: 'Visit Link',
                    isBorderColor: true,
                    onClicked: () {
                      _launchInBrowser(_.storyLink??"");
                    }),
              )
                  : Container();
            }),
            widget.userId == AppConstants.myId
                ? Positioned(
              bottom: 50,
              child: GestureDetector(
                onVerticalDragUpdate: (_) {
                  _showSeen();
                },
                child: Container(
                  width: Get.width,
                  color: AppColor.transparent,
                  height: 350.h,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.keyboard_arrow_up,
                          size: 30.r,
                          color: AppColor.white,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Seen By',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                            // Text(
                            //   ' (${_seenUsers.length.toString()})',
                            //   style: TextStyle(
                            //     fontSize: 16.sp,
                            //     color: Colors.white,
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
                : Positioned(
              bottom: 50,
              child: GestureDetector(
                onVerticalDragUpdate: (_) {
                  storyReply();
                  _replyController.clear();
                },
                child: Container(
                  width: Get.width,
                  color: AppColor.transparent,
                  height: 350,
                  child: Align(
                    alignment: Alignment.bottomCenter,
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
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
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
                      decoration: const BoxDecoration(
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
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 18.sp,
                            ),
                          ),
                          Text(
                            ' (${_.seenUsers.length.toString()})',
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 18.sp,
                            ),
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
        });
  }

  storyReply() {
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
                  decoration: const BoxDecoration(
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
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 18.sp,
                        ),
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
                                child: const Padding(
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
        });
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
      'Authorization':
      'key=AAAArlvuZY0:APA91bFUXWxp69gz1c1Y7CaOCVVG_0w15zRAKhf0OvR9gwUIU6F_ZFsnNsda9WG8soMMBFuHQAFKcQPb73baHDDtFjyKqDAzkuVN2afz37yyE-ndXZjPpW43FTQKJHUXglE8rmFw52is'
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
      print("Sent Notifiaction");
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