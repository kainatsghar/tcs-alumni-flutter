import 'package:cached_network_image/cached_network_image.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/more/profile_screen.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/response_models/get_invitation_entity.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/strings.dart';

import 'messages.dart';

class ChatInvitationScreen extends StatefulWidget {
  final String? image;
  final String? name;
  final String? receiverId;
  const ChatInvitationScreen({Key? key, this.image, this.name, this.receiverId})
      : super(key: key);

  @override
  _ChatInvitationScreenState createState() => _ChatInvitationScreenState();
}

class _ChatInvitationScreenState extends State<ChatInvitationScreen> {
  late Future _fetchData;

  late ChatInvitation _status;
  late List<UserDevices> _userDevices;
  bool wait = false;
  String senderId = '';
  String receiverId = '';
  bool check = true;
  String? name = '';
  String? userImage = '';

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
    // if (widget.messageKey == "") {
    //   nums = [int.parse(AppConstants.myId), int.parse(widget.receiverId ?? '')];
    //   nums.sort();
    //   setState(() {
    //     largeId = nums.last.toString();
    //     smallId = nums.first.toString();
    //   });
    // } else {
    //   final tagName = widget.messageKey;
    //   final split = tagName!.split('-');
    //   setState(() {
    //     largeId = split.first;
    //     smallId = split.last;
    //   });
    // }

    _userDevices = [];
    checkConnectivity();

    _fetchData = _fetchInvitationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: check
          ? FutureBuilder(
              future: _fetchData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return _bodyContainer();
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.noInternet,
                      ),
                      Text(
                        'Something went wrong. Please try again later',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(14),
                        ),
                      ),
                    ],
                  );
                }
              },
            )
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

  _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            height: 32,
            width: 32,
            child: widget.image == ''
                ? CircleAvatar(
                    child: userImage == ''
                        ? const Image(
                            image: AssetImage(AppImages.profile),
                            height: 32,
                            width: 32,
                          )
                        : CachedNetworkImage(
                            imageUrl: userImage ?? '',
                            imageBuilder: (context, imageProvider) => Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) => const Image(
                              image: AssetImage(AppImages.profile),
                              height: 32,
                              width: 32,
                            ),
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                          ),
                  )
                : CircleAvatar(
                    child: widget.image == ''
                        ? const Image(
                            image: AssetImage(AppImages.profile),
                            height: 32,
                            width: 32,
                          )
                        : CachedNetworkImage(
                            imageUrl: widget.image ?? '',
                            imageBuilder: (context, imageProvider) => Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) => const Image(
                              image: AssetImage(AppImages.profile),
                              height: 32,
                              width: 32,
                            ),
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                          ),
                  ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              widget.name != '' ? widget.name ?? '' : name ?? '',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(15),
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
      actions: [
        PopupMenuButton(
          onSelected: (result) {
            if (result == 0) {
              Get.to(
                () => ProfileScreen(
                  userID: widget.receiverId,
                ),
              );
            }
            if (result == 1) {
              sendInvitation(AppConstants.ACCEPT);
            }
            if (result == 2) {
              sendInvitation(AppConstants.BLOCK);
            }
            if (result == 3) {
              sendInvitation(AppConstants.UNBLOCK);
            }
            if (result == 4) {
              // FirebaseDatabase.instance.ref().remove();
            }
          },
          itemBuilder: (BuildContext context) {
            if (_status.status == "" || _status.status == AppConstants.INVITE) {
              return [
                const PopupMenuItem(
                  value: 0,
                  child: Text('View Profile'),
                )
              ];
            } else if (_status.status == AppConstants.REJECT &&
                _status.blockBy == AppConstants.myId) {
              return [
                const PopupMenuItem(
                  value: 1,
                  child: Text('Accept'),
                ),
                const PopupMenuItem(
                  value: 0,
                  child: Text('View Profile'),
                )
              ];
            } else if (_status.status == AppConstants.ACCEPT ||
                _status.status == AppConstants.UNBLOCK) {
              return [
                const PopupMenuItem(
                  value: 0,
                  child: Text('View Profile'),
                ),
                // const PopupMenuItem(
                //   value: 4,
                //   child: Text('Clear Chat'),
                // ),
                const PopupMenuItem(
                  value: 2,
                  child: Text('Block'),
                ),
              ];
            } else if (_status.status == AppConstants.BLOCK &&
                _status.blockBy == AppConstants.myId) {
              return [
                const PopupMenuItem(
                  value: 3,
                  child: Text('Unblock'),
                ),
                const PopupMenuItem(
                  value: 0,
                  child: Text('View Profile'),
                ),
              ];
            } else {
              return [
                const PopupMenuItem(
                  value: 0,
                  child: Text('View Profile'),
                ),
              ];
            }
          },
        ),
      ],
    );
  }

  Widget _bodyContainer() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: AppColor.white60,
            image: DecorationImage(
              image: AssetImage(AppImages.chatBackgroundpng),
              fit: BoxFit.cover,
            ),
          ),
          child: _status.status == ""
              ? _sendInviteContainer()
              : _status.status == AppConstants.INVITE
                  ? _status.senderId == AppConstants.myId
                      ? _inviteSentContainer()
                      : _inviteReceivedContainer()
                  : _status.status == AppConstants.REJECT
                      ? _requestRejectContainer()
                      : _status.status == AppConstants.BLOCK
                          ? _blockContainer()
                          : MessagesScreen(
                              name: widget.name,
                              image: widget.image,
                              receiverId: widget.receiverId,
                              messageKey: "",
                              devices: _userDevices,
                            ),
        ),
        wait
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const SizedBox(),
      ],
    );
  }

  Widget _sendInviteContainer() {
    return Column(
      children: [
        const Spacer(),
        SvgPicture.asset(AppImages.sendInvitation),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: SizedBox(
            height: 35,
            width: 165,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColor.primaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: AppColor.primaryColor),
                  ),
                ),
              ),
              onPressed: () {
                sendInvitation("invite");
              },
              child: Center(
                child: Text(
                  'Send Invitation',
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: ScreenUtil().setSp(14),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _inviteSentContainer() {
    return Column(
      children: [
        const Spacer(),
        SvgPicture.asset(AppImages.sentInvitation),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                color: AppColor.white,
                border: Border.all(color: AppColor.primaryColor),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  Strings.invitationSent,
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: ScreenUtil().setSp(14),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _inviteReceivedContainer() {
    return Column(
      children: [
        const Spacer(),
        SvgPicture.asset(AppImages.receiveInvitation),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 35.w,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColor.primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: AppColor.primaryColor),
                      ),
                    ),
                  ),
                  onPressed: () {
                    sendInvitation(AppConstants.ACCEPT);
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        Strings.accept,
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: ScreenUtil().setSp(15),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                height: 35.w,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColor.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: AppColor.primaryColor),
                      ),
                    ),
                  ),
                  onPressed: () {
                    sendInvitation(AppConstants.REJECT);
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        Strings.reject,
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: ScreenUtil().setSp(15),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _requestRejectContainer() {
    return Column(
      children: [
        const Spacer(),
        SvgPicture.asset(AppImages.chatBlocked),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                color: AppColor.white,
                border: Border.all(color: AppColor.primaryColor),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  _status.blockBy == AppConstants.myId
                      ? 'You Rejected this Message Request'
                      : 'Your Request for Message is Rejected',
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: ScreenUtil().setSp(14),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _blockContainer() {
    return Column(
      children: [
        const Spacer(),
        SvgPicture.asset(AppImages.chatBlocked),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                color: AppColor.white,
                border: Border.all(color: AppColor.primaryColor),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  _status.blockBy == AppConstants.myId
                      ? 'You block the chat'
                      : 'Your chat has been blocked',
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: ScreenUtil().setSp(14),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Future<void> sendInvitation(status) async {
    setState(() {
      wait = true;
    });
    var response = await ApiCalls.insertUserInvitation(
      senderId: AppConstants.myId,
      receiverId: widget.receiverId,
      status: status,
    );
    if (response is ErrorEntity) {
    } else {
      GetInvitationEntity entity = GetInvitationEntity().fromJson(response);
      if (entity.success == 1) {
        _status = ChatInvitation(
          senderId: entity.result.senderId,
          receiverId: entity.result.senderId,
          status: entity.result.status,
          blockBy: entity.result.blockBy,
        );
      }
    }
    setState(() {
      wait = false;
    });
  }

  Future<void> _fetchInvitationData() async {
    var response = await ApiCalls.getUserInvitation(
      senderId: AppConstants.myId,
      receiverId: widget.receiverId,
    );
    if (response is ErrorEntity) {
      print('api is not working');
    } else {
      GetInvitationEntity invitationEntity =
          GetInvitationEntity().fromJson(response);
      if (invitationEntity.success == 1) {
        _status = ChatInvitation(
          senderId: invitationEntity.result.senderId,
          receiverId: invitationEntity.result.senderId,
          status: invitationEntity.result.status,
          blockBy: invitationEntity.result.blockBy,
          name: invitationEntity.result.receiver.firstName,
          image: invitationEntity.result.receiver.image,
          // devices: invitationEntity.result.devices,
        );
        for (var element in invitationEntity.result.devices) {
          _userDevices.add(
            UserDevices(
              token: element.token,
              status: element.status,
            ),
          );
        }
        setState(() {
          name = invitationEntity.result.receiver.firstName;
          userImage = invitationEntity.result.receiver.image;
        });

        // SharedPreferences localStorage = await SharedPreferences.getInstance();
        // database.deleteChatStatus(senderId, receiverId);
        // DBChatStatus chatStatus = DBChatStatus(
        //   senderId: invitationEntity.result.senderId,
        //   receiverId: invitationEntity.result.reciverId,
        //   status: invitationEntity.result.status,
        //   blockBy: invitationEntity.result.blockBy,
        // );
        // database.insertChatStatus(chatStatus);
        // localStorage.setString('senderID', invitationEntity.result.senderId);
        // localStorage.setString("receiverID", invitationEntity.result.reciverId);
      }
    }
  }

}

class ChatInvitation {
  String? senderId;
  String? receiverId;
  String? blockBy;
  String? status;
  String? image;
  String? name;
  List<UserDevices>? devices;
  ChatInvitation({
    this.senderId,
    this.receiverId,
    this.blockBy,
    this.status,
    this.image,
    this.name,
    this.devices,
  });
}

class UserDevices {
  String? token;
  String? status;
  UserDevices({
    this.token,
    this.status,
  });
}
