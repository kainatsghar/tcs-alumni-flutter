import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:iobm/Views/Chat/send_invation_screen.dart';
import 'package:iobm/Widgets/app_bar.dart';

import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/app_utils.dart';
import 'package:iobm/utils/strings.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool check = true;

  void checkConnectivity() async {
    var connectivity = await (Connectivity().checkConnectivity());
    if (connectivity == ConnectivityResult.none) {
      //return false;
      setState(() {
        check = false;
      });
    } else {
      setState(() {
        check = true;
      });
    }
  }

  @override
  void initState() {
    checkConnectivity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: const Text(Strings.chat),
        context: context,
      ),
      body: check
          ? _chatList()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.noInternet,
                ),
                Text(
                  'No Network Connection',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(18),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _chatList() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('messageKeys')
          .doc('keys')
          .collection(AppConstants.myId)
          .orderBy('time', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                'No Chats Available',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return user(
                  onPressed: () {
                    Get.to(
                      () => ChatInvitationScreen(
                        name: snapshot.data!.docs[index]['name'],
                        image: snapshot.data!.docs[index]['imageUrl'],
                        receiverId: snapshot.data!.docs[index]['id'],
                      ),
                    );
                  },
                  // unreadCount: snapshot.data!.docs[index]['unread'].toString(),
                  name: snapshot.data!.docs[index]['name'],
                  image: snapshot.data!.docs[index]['imageUrl'],
                  msg: snapshot.data!.docs[index]['lastText'],
                  time: AppUtils()
                      .chatDifference(snapshot.data!.docs[index]['time']),
                );
              },
            );
          }
        }
      },
    );
    // return FirebaseAnimatedList(
    //   defaultChild: const Center(child: CircularProgressIndicator()),
    //   query: FirebaseDatabase.instance.ref(
    //     "message_keys/${AppConstants.myId}",
    //   ),
    //   itemBuilder:
    //       (_, DataSnapshot snapshot, Animation<double> animation, int index) {
    //     var data = jsonEncode(snapshot.value);
    //     ChatsModel message = ChatsModel.fromJson(
    //       data.toString(),
    //     );
    //
    //     return Column(
    //       children: [
    //         user(
    //             image: message.imageUrl,
    //             msg: message.lastText,
    //             name: message.name,
    //             time: AppUtils().chatDifference(message.time.toString()),
    //             onPressed: () {
    //               Get.to(
    //                 () => ChatInvitationScreen(
    //                   name: message.name,
    //                   image: message.imageUrl,
    //                   receiverId: snapshot.key,
    //                 ),
    //               );
    //             }),
    //         const Divider(
    //           height: 1,
    //           thickness: 1,
    //         ),
    //       ],
    //     );
    //   },
    // );
  }

  user(
      {String? image,
      String? name,
      String? msg,
      String? time,
      String? unreadCount,
      Function()? onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: AppColor.white,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: CircleAvatar(
                child: image == ''
                    ? Image(
                        image: const AssetImage(AppImages.profile),
                        width: 50.w,
                        height: 50.h,
                      )
                    : CachedNetworkImage(
                        imageUrl: image ?? '',
                        imageBuilder: (context, imageProvider) => Container(
                          height: 50.h,
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
                          width: 50.h,
                        ),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                          value: downloadProgress.progress,
                        ),
                      ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name!,
                  style: TextStyle(
                    // //Family: 'Nunito',
                    fontWeight: FontWeight.w600,
                    fontSize: 13.sp,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    //
                    Expanded(
                      child: Text(
                        msg ?? '',
                        style: TextStyle(
                            fontSize: 12.sp,
                            overflow: TextOverflow.ellipsis,
                            color: AppColor.grey),
                      ),
                    ),
                  ],
                )
              ],
            )),
            // Text(
            //   unreadCount ?? '',
            //   style: TextStyle(
            //     fontSize: ScreenUtil().setSp(12),
            //     color: AppColor.grey,
            //   ),
            // ),
            Text(
              time ?? '',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(12),
                color: AppColor.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
