import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:iobm/Views/Chat/send_invation_screen.dart';
import 'package:iobm/Widgets/app_bar.dart';
import 'package:iobm/controllers/profile_controller.dart';
import 'package:iobm/main.dart';

import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/app_utils.dart';
import 'package:iobm/utils/strings.dart';

import '../../Widgets/custom_widgets.dart';
import '../../helper_classes/ui_helper.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool check = true;
  String? largeId;
  String? smallId;
  var nums = [];
  String? lastText;
  List<Color> listColor = [];
  final ProfileController _profileController = Get.put(ProfileController());

  List<SelectedTile> listSlcTile = [];
  bool isSelected = false;

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
    _profileController.updateFirebaseCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: const Text(Strings.chat),
        context: context,
      ),
      floatingActionButton: isSelected ? Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: () {
            setState(() {
              isSelected = false;
            });
            deleteMessage();
          },
            child: const Icon(Icons.delete, color: AppColor.white,),
          ),
          SizedBox(height: 15.w,),
          FloatingActionButton(
            backgroundColor: AppColor.grey,
            onPressed: () {
              for(int i= 0; i<listSlcTile.length; i++){
                listColor[listSlcTile[i].slcIndex] = AppColor.white;
              }
              isSelected = false;
              listSlcTile.clear();
              setState(() {});
            },
            child: const Icon(Icons.close,color: AppColor.white,),
          ),
        ],
      ) : null,
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
        }
        else {
          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                'No Chats Available',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                ),
              ),
            );
          }
          else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                for(int i=0; i<snapshot.data!.docs.length; i++){
                  listColor.add(AppColor.white);
                }
                print('unReadCountOnChat: ${snapshot.data!.docs[index]['readStatus']}');
                return GestureDetector(
                  onLongPress: () {
                    listSlcTile.clear();
                    isSelected = true;

                    var split = snapshot.data!.docs[index].reference.path.split('/');
                    String selected = split.last;

                    nums = [int.parse(AppConstants.myId), int.parse(selected)];
                    nums.sort();
                    largeId = nums.last.toString();
                    smallId = nums.first.toString();
                    listSlcTile.add(SelectedTile(
                        selected,
                        largeId!,
                        smallId!,
                        index
                    ));
                    if(listColor[index] == AppColor.greyshade300){
                      listColor[index] = AppColor.white;
                    }
                    else{
                      listColor[index] = AppColor.greyshade300;
                    }
                    setState(() {});
                    //deleteMessage(selected);
                  },
                  child: user(
                    onPressed: () {
                      if(isSelected){
                        var split = snapshot
                            .data!.docs[index].reference.path
                            .split('/');
                        String selected = split.last;

                        nums = [int.parse(AppConstants.myId), int.parse(selected)];
                        nums.sort();
                        largeId = nums.last.toString();
                        smallId = nums.first.toString();
                        listSlcTile.add(SelectedTile(
                            selected,
                            largeId!,
                            smallId!,
                            index
                        ));
                        if(listColor[index] == AppColor.greyshade300){
                          listColor[index] = AppColor.white;
                          for(int i=0; i<listSlcTile.length; i++){
                            if(index == listSlcTile[i].slcIndex){
                              listSlcTile.removeAt(i);
                            }
                          }
                        }
                        else{
                          listColor[index] = AppColor.greyshade300;
                        }
                        setState(() {});
                      }
                      else{
                        Get.to(
                              () => ChatInvitationScreen(
                            name: snapshot.data!.docs[index]['name'],
                            image: snapshot.data!.docs[index]['imageUrl'],
                            receiverId: snapshot.data!.docs[index]['id'],
                          ),
                        );
                      }
                    },
                    unreadCount: snapshot.data!.docs[index]['readStatus'],
                    name: snapshot.data!.docs[index]['name'],
                    image: snapshot.data!.docs[index]['imageUrl'],
                    msg: snapshot.data!.docs[index]['lastText'],
                    slcColor: listColor[index],
                    time: AppUtils().chatDifference(snapshot.data!.docs[index]['time']),
                  ),
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
        Color? slcColor,
        String? unreadCount,
        int? index,
        Function()? onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          Container(
            color: slcColor,
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
                        ),
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
                ),
              ],
            ),
          ),
          unreadCount != '0'
              ? Positioned(
            right: 20,
            top: 5,
            child: Container(
              decoration:  BoxDecoration(
                  color: AppColor.primaryColor, shape: BoxShape.circle),
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      unreadCount ?? '',
                      style:
                      TextStyle(color: AppColor.white, fontSize: 10.sp),
                    ),
                  )),
            ),
          )
              : const SizedBox(),
        ],
      ),
    );
  }

  deleteMessage() async{
    return Get.defaultDialog(
        middleText: 'Do you want to delete this chat?',
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomWidget.dialogButton(
                  name: 'Cancel',
                  isBorderColor: true,
                  onClicked: () {
                    Get.back();
                    // snapshots.docs[i].reference.delete();
                    for(int i= 0; i<listSlcTile.length; i++){
                      listColor[listSlcTile[i].slcIndex] = AppColor.white;
                    }
                    listSlcTile.clear();
                    setState(() {});
                  }),
              SizedBox(width: 10.w,),
              CustomWidget.dialogButton(
                name: 'Delete',
                isBorderColor: false,
                onClicked: () async{
                  Get.back();
                  Future.delayed(const Duration(milliseconds: 900),()async{
                    for(int i=0; i<listSlcTile.length; i++){
                      //deleting sender list
                      FirebaseFirestore.instance
                          .collection('messageKeys')
                          .doc('keys')
                          .collection(AppConstants.myId)
                          .doc(listSlcTile[i].selectedId).delete();

                      //deleting receiver list
                      FirebaseFirestore.instance
                          .collection('messageKeys')
                          .doc('keys')
                          .collection(listSlcTile[i].slcLarger).doc(AppConstants.myId).delete();

                      //deleting chats
                      var collection =  FirebaseFirestore.instance
                          .collection('chats')
                          .doc('chatsScreen')
                          .collection('${listSlcTile[i].slcLarger}-${listSlcTile[i].slcSmaller}');

                      var snapshots = await collection.get();
                      for (var doc in snapshots.docs) {
                        await doc.reference.delete();
                      }
                      listColor[listSlcTile[i].slcIndex] = AppColor.white;
                    }

                    listSlcTile.clear();
                    setState(() {});
                  });
                },
              ),
            ],
          ),
        ]);
  }

}

class SelectedTile{
  int slcIndex;
  String selectedId;
  String slcLarger;
  String slcSmaller;

  SelectedTile(this.selectedId, this.slcLarger, this.slcSmaller,this.slcIndex);
}
