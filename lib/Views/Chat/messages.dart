import 'dart:async';

import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:iobm/Views/Chat/chat_audio_player.dart';
import 'package:iobm/Views/Chat/chat_video_player.dart';
import 'package:iobm/Views/Chat/full_img_view.dart';
import 'package:iobm/Views/Chat/send_invation_screen.dart';
import 'package:iobm/Widgets/widget_styles.dart';

import 'package:get/get.dart';

import 'package:iobm/controllers/profile_controller.dart';

import 'package:iobm/networkcalls/response_models/upload_file_entity.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import '../../Widgets/custom_widgets.dart';
import '../../networkcalls/network_config.dart';
import '../../utils/app_utils.dart';
import '../buy_and_sell_tle/product_detail_screen.dart';

class MessagesScreen extends StatefulWidget {
  final String? image;
  final String? name;
  final String? messageKey;
  final List<UserDevices>? devices;
  final String? receiverId;
  const MessagesScreen({
    Key? key,
    this.image,
    this.name,
    this.messageKey,
    this.receiverId,
    this.devices,
  }) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final ProfileController _profileController = Get.put(ProfileController());
  final TextEditingController _chatController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  List _deviceTokens = [];

  bool recording = false;
  FlutterSoundPlayer? _myPlayer;
  FlutterSound flutterSound = FlutterSound();

  final ImagePicker _picker = ImagePicker();
  //XFile? _imageFile;
  String? _imagePath;

  File? _imageFile;
  // String? filePath;

  /// Video and Images

  late VideoPlayerController _controller;
  bool uploading = false;
  String _uploadPath = "";

  Future galleryImage() async {
    var pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      //   _imageFile = pickedFile;
      _imagePath = pickedFile!.path;
    });
    uploadChatFile(_imagePath);
  }

  Future cameraImage() async {
    var pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      // _imageFile = pickedFile;
      _imagePath = pickedFile!.path;
    });
    uploadChatFile(_imagePath);
  }

  _videoFromGallery() async {
    XFile? file = await _picker.pickVideo(
      source: ImageSource.gallery,
    );
    if (file != null) {
      _controller = VideoPlayerController.network(file.path)..initialize();
      setState(() {
        //  _imageFile = file;
        _imagePath = file.path;
      });
      uploadChatFile(_imagePath);
    }
  }

  filePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      lockParentWindow: true,
    );
    if (result != null) {
      File file = File(result.files.single.path!);
      if (file.path.endsWith('mp4') ||
          file.path.endsWith('png') ||
          file.path.endsWith('jpg') ||
          file.path.endsWith('docx') ||
          file.path.endsWith('pdf') ||
          file.path.endsWith('xls')) {
        if (file.path.endsWith('mp4')) {
          _controller = VideoPlayerController.network(file.path)..initialize();
        }
        setState(() {
          _imageFile = file;
          _imagePath = file.path;
          //  _imagePath = file!.path;
        });
        uploadChatFile(_imagePath);
      } else {
        await Fluttertoast.showToast(msg: 'Invalid Format');
      }
    } else {
      // User canceled the picker
    }
  }

  ///

  var nums = [];
  String? largeId;
  String? smallId;
  String? lastText;

  final FlutterSoundRecorder? _myRecorder = FlutterSoundRecorder();

  String? pathToAudio;
  String fileName = 'myAudio.aac';
  String path = "/storage/emulated/0";

  Codec _codec = Codec.aacMP4;
  String _mPath = 'tau_file.mp3';
  bool _mPlayerIsInited = false;
  bool _mRecorderIsInited = false;
  bool _mplaybackReady = false;

  record() async {
    Directory tempDir = await getTemporaryDirectory();
    File filePath = File('${tempDir.path}/audio.aac');
    // String path = await _myRecorder!.startRecorder(uri: filePath.path, codec: t_CODEC.CODEC_AAC);
    print('startRecorder: $path');
    // final directory = await getApplicationDocumentsDirectory();
    // _mPath = directory.path;
    _myRecorder!
        .startRecorder(
      toFile: filePath.path,
      codec: _codec,
    )
        .then((value) {
      setState(() {});
    });
  }

  Future stop() async {
    String? url = await _myRecorder!.stopRecorder();
    print(url);
    uploadChatFile(url);
    //_writeFileToStorage();
    print('stopped....');
  }

  Future<void> openTheRecorder() async {
    var status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Microphone permission not granted');
    }

    await _myRecorder!.openRecorder();
    if (!await _myRecorder!.isEncoderSupported(_codec)) {
      _codec = Codec.opusWebM;
      _mPath = 'tau_file.webm';
      if (!await _myRecorder!.isEncoderSupported(_codec)) {
        _mRecorderIsInited = true;
        return;
      }
    }

    _mRecorderIsInited = true;
  }

  /// Launch Document
  Future<void>? _launched;
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

  @override
  void initState() {
    if (widget.messageKey == "") {
      nums = [int.parse(AppConstants.myId), int.parse(widget.receiverId ?? '')];
      nums.sort();
      setState(() {
        largeId = nums.last.toString();
        smallId = nums.first.toString();
      });
    } else {
      final tagName = widget.messageKey;
      final split = tagName!.split('-');
      setState(() {
        largeId = split.first;
        smallId = split.last;
      });
    }

    for (var element in widget.devices!) {
      if (element.status == "A") {
        _deviceTokens.add(element.token);
      }
    }

    _scrollController.addListener(_scrollListener);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _bodyColumn(),
    );
  }

  Widget _bodyColumn() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        print(DateTime.now());
      },
      child: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('chats')
                  .doc('chatsScreen')
                  .collection('$largeId-$smallId')
                  .orderBy('timeStamp', descending: true)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Scrollbar(
                      thickness: 5.0,
                      controller: _scrollController,
                      child: ListView.builder(
                        reverse: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          if (snapshot.data!.docs[index]['senderId'] ==
                              AppConstants.myId) {
                            return GestureDetector(
                              onLongPress: () {
                                // listSlcTile.clear();
                                // isSelected = true;

                                print(snapshot.data!.docs[index].metadata);
                                var split = snapshot.data!.docs[index].reference.path.split('/');
                                String selected = split.last;
                                // listSlcTile.add(SlcMsgTile(selected, index));
                                // setState(() {});

                                deleteMessage(selected);
                              },
                              child: _send(
                                snapshot.data!.docs[index]['message'],
                                AppUtils()
                                    .chatDifference(
                                        snapshot.data!.docs[index]['timeStamp'])
                                    .toString(),
                                snapshot.data!.docs[index]['type'],
                                snapshot.data!.docs[index]['media_url'],
                                snapshot.data!.docs[index]['messageId'],
                                snapshot.data!.docs[index]['status'],
                                snapshot.data!.docs[index]['timeStamp'],
                              ),
                            );
                          } else {
                            return _receive(
                              snapshot.data!.docs[index]['message'],
                              AppUtils()
                                  .chatDifference(
                                      snapshot.data!.docs[index]['timeStamp'])
                                  .toString(),
                              snapshot.data!.docs[index]['type'],
                              snapshot.data!.docs[index]['media_url'],
                              snapshot.data!.docs[index]['messageId'],
                              snapshot.data!.docs[index]['status'],
                              snapshot.data!.docs[index]['timeStamp'],
                            );
                          }
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          buildInput(),
        ],
      ),
    );
  }

  Widget _send(String msg, String time, type, String media, String msgId,
      String status, String timeStamp) {
    String price = "";
    String message = "";
    String name = "";
    String description = "";
    if (type == "offer") {
      List sp = msg.split('*-');
      price = sp.first;
      name = sp[2];
      message = sp[1];
      description = sp.last;
    }
    else if (type == 'storyReply') {
      return Align(
        alignment: Alignment.bottomRight,
        child: Container(
          margin: const EdgeInsets.only(top: 10, left: 10, bottom: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColor.primaryColor.withOpacity(0.15),
            border: Border.all(color: AppColor.black54),
          ),
          child: IntrinsicWidth(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 270.w),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 70.w,
                        width: 100.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: media ?? '',
                          height: 50.w,
                          width: 100.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Divider(
                      height: 5,
                      color: AppColor.grey,
                    ),
                    Text(
                      msg,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(15),
                        color: AppColor.black,
                        fontFamily: 'Gotham',
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          time,
                          style: WidgetStyle.forgotTExtStyle(
                            color: AppColor.white,
                            fontSize: 10.0.sp,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_circle_rounded,
                              color: AppColor.grey,
                              size: 12.r,
                            ),
                            const SizedBox(
                              width: 2,
                            ),

                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    if (type == 'offer') {
      return Align(
        alignment: Alignment.bottomRight,
        child: Container(
          margin: const EdgeInsets.only(top: 10, right: 10, bottom: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColor.primaryColor.withOpacity(0.15),
            border: Border.all(color: AppColor.black54),
          ),
          child: IntrinsicWidth(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 270.w),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 200.w,
                        width: 200.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: media,
                          height: 200.w,
                          width: 200.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Product name : ',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(15),
                            color: AppColor.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Gotham',
                          ),
                        ),
                        TextSpan(
                          text: name,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(15),
                            color: AppColor.black,
                            fontFamily: 'Gotham',
                          ),
                        )
                      ]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Product Description : ',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(15),
                              color: AppColor.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Gotham',
                            ),
                          ),
                          TextSpan(
                            text: description,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(15),
                              color: AppColor.black,
                              fontFamily: 'Gotham',
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Offer Price : ',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(15),
                            color: AppColor.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Gotham',
                          ),
                        ),
                        TextSpan(
                          text: price,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(15),
                            color: AppColor.black,
                            fontFamily: 'Gotham',
                          ),
                        )
                      ]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Offer Details : ',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(15),
                            color: AppColor.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Gotham',
                          ),
                        ),
                        TextSpan(
                          text: message,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(15),
                            color: AppColor.black,
                            fontFamily: 'Gotham',
                          ),
                        )
                      ]),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => ProductDetailScreen(
                                productId: int.parse(msgId),
                              ));
                        },
                        child: Text(
                          "View Product",
                          style: WidgetStyle.forgotTExtStyle(
                            fontSize: ScreenUtil().setSp(12),
                            color: AppColor.white,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            AppColor.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    status == ''
                        ? Text(
                            'Waiting for response',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : status == 'accept'
                            ? Text(
                                'Your offer has been accepted',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(14),
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Text(
                                'Your offer has been rejected',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(14),
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Bubble(
        radius: const Radius.circular(15),
        margin: const BubbleEdges.only(top: 10, right: 5),
        alignment: Alignment.topRight,
        nip: BubbleNip.rightTop,
        color: AppColor.primaryColor,
        child: IntrinsicWidth(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 270.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                msg == ""
                    ? const SizedBox()
                    : Text(
                        msg,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                          color: AppColor.white,
                        ),
                      ),
                type == 'image'
                    ? GestureDetector(
                        onTap: () {
                          Get.to(
                            () => FullFileView(
                              image: media,
                              type: type,
                            ),
                          );
                        },
                        child: CachedNetworkImage(
                          imageUrl: media,
                          width: 200.w,
                          height: 200.w,
                          fit: BoxFit.cover,
                        ),
                      )
                    : type == 'video'
                        ? GestureDetector(
                            onTap: () {
                              Get.to(
                                () => FullFileView(
                                  image: media,
                                  type: type,
                                ),
                              );
                            },
                            child: ChatVideoPlayer(url: media),
                          )
                        : type == 'audio'
                            ? ChatAudioPlayer(
                                url: media,
                                user: 'sender',
                              )
                            : type == 'pdf'
                                ? GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _launched = _launchInBrowser(media);
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          AppImages.pdfIcon,
                                          height: 40.w,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Pdf',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(15),
                                            color: AppColor.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 35,
                                        ),
                                      ],
                                    ),
                                  )
                                : type == 'xls'
                                    ? GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _launched = _launchInBrowser(media);
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              AppImages.excelIcon,
                                              height: 40.w,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Excel',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize:
                                                    ScreenUtil().setSp(15),
                                                color: AppColor.white,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 35,
                                            ),
                                          ],
                                        ),
                                      )
                                    : type == 'docx'
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _launched =
                                                    _launchInBrowser(media);
                                              });
                                            },
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  AppImages.wordIcon,
                                                  height: 40.w,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Word',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontSize:
                                                        ScreenUtil().setSp(15),
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 35,
                                                ),
                                              ],
                                            ),
                                          )
                                        : type != 'text'
                                            ? GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _launched =
                                                        _launchInBrowser(media);
                                                  });
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.file_open,
                                                      color: AppColor.white,
                                                      size: 30.h,
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      'File',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontSize: ScreenUtil()
                                                            .setSp(15),
                                                        color: AppColor.white,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 35,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : const SizedBox(),
                const SizedBox(
                  height: 2,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    time,
                    style: WidgetStyle.forgotTExtStyle(
                      color: AppColor.white,
                      fontSize: 10.0.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget _receive(String msg, String time, String type, String media,
      String msgId, String status, String timeStamp) {
    String price = "";
    String message = "";
    String name = "";
    String description = "";
    DateTime msgTime = DateFormat('yyyy/MM/dd HH:mm:ss').parse(timeStamp);

    if (type == "offer") {
      List sp = msg.split('*-');
      price = sp.first;
      name = sp[2];
      message = sp[1];
      description = sp.last;
    }
    if (type == 'offer') {
      return Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: const EdgeInsets.only(top: 10, left: 10, bottom: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColor.white,
            border: Border.all(color: AppColor.black54),
          ),
          child: IntrinsicWidth(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 270.w),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 200.w,
                        width: 200.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: media,
                          height: 200.w,
                          width: 200.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Product name : ',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(15),
                            color: AppColor.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Gotham',
                          ),
                        ),
                        TextSpan(
                          text: name,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(15),
                            color: AppColor.black,
                            fontFamily: 'Gotham',
                          ),
                        )
                      ]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Product Description : ',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(15),
                              color: AppColor.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Gotham',
                            ),
                          ),
                          TextSpan(
                            text: description,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(15),
                              color: AppColor.black,
                              fontFamily: 'Gotham',
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Offer Price : ',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(15),
                            color: AppColor.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Gotham',
                          ),
                        ),
                        TextSpan(
                          text: price,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(15),
                            color: AppColor.black,
                            fontFamily: 'Gotham',
                          ),
                        )
                      ]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Offer Details : ',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(15),
                            color: AppColor.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Gotham',
                          ),
                        ),
                        TextSpan(
                          text: message,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(15),
                            color: AppColor.black,
                            fontFamily: 'Gotham',
                          ),
                        )
                      ]),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => ProductDetailScreen(
                                productId: int.parse(msgId),
                              ));
                        },
                        child: Text(
                          "View Product",
                          style: WidgetStyle.forgotTExtStyle(
                            fontSize: ScreenUtil().setSp(12),
                            color: AppColor.white,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            AppColor.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    status == ""
                        ? Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection('chats')
                                        .doc('chatsScreen')
                                        .collection('$largeId-$smallId')
                                        .where('timeStamp',
                                            isEqualTo: timeStamp)
                                        .get()
                                        .then((value) {
                                      var thing = value.docs[0];
                                      var temp = thing.data();
                                      temp['status'] = 'accept';
                                      thing.reference.update(temp);
                                    });
                                  },
                                  child: Text(
                                    "Accept",
                                    style: WidgetStyle.forgotTExtStyle(
                                      fontSize: ScreenUtil().setSp(12),
                                      color: AppColor.white,
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection('chats')
                                        .doc('chatsScreen')
                                        .collection('$largeId-$smallId')
                                        .where('timeStamp',
                                            isEqualTo: timeStamp)
                                        .get()
                                        .then((value) {
                                      var thing = value.docs[0];
                                      var temp = thing.data();
                                      temp['status'] = 'reject';
                                      thing.reference.update(temp);
                                    });
                                  },
                                  child: Text(
                                    "Reject",
                                    style: WidgetStyle.forgotTExtStyle(
                                      fontSize: ScreenUtil().setSp(12),
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    side: MaterialStateProperty.all(
                                        const BorderSide(
                                            color: AppColor.primaryColor)),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      AppColor.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : status == "accept"
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'You accepted the offer',
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(14),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'You rejected the offer',
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(14),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    else if (type == 'storyReply') {
      return Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: const EdgeInsets.only(top: 10, left: 10, bottom: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColor.white.withOpacity(0.15),
            border: Border.all(color: AppColor.black54),
          ),
          child: IntrinsicWidth(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 270.w),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50.w,
                        width: 100.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                        ),
                        child: media == null
                            ? const SizedBox()
                            : CachedNetworkImage(
                          imageUrl: media,
                          height: 50.w,
                          width: 100.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Divider(
                      height: 5,
                      color: AppColor.grey,
                    ),
                    Text(
                      msg,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(15),
                        color: AppColor.black,
                        fontFamily: 'Gotham',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    else {
      return Bubble(
        radius: const Radius.circular(15),
        margin: const BubbleEdges.only(top: 10, left: 5),
        alignment: Alignment.topLeft,
        nip: BubbleNip.leftTop,
        color: AppColor.white,
        child: IntrinsicWidth(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 270.w,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  msg,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(15),
                    color: AppColor.black,
                  ),
                ),
                type == 'image'
                    ? GestureDetector(
                        onTap: () {
                          Get.to(
                            () => FullFileView(
                              image: media,
                              type: type,
                            ),
                          );
                        },
                        child: CachedNetworkImage(
                          imageUrl: media,
                          width: 200.w,
                          height: 200.w,
                          fit: BoxFit.cover,
                        ),
                      )
                    : type == 'video'
                        ? GestureDetector(
                            onTap: () {
                              Get.to(
                                () => FullFileView(
                                  image: media,
                                  type: type,
                                ),
                              );
                            },
                            child: ChatVideoPlayer(url: media),
                          )
                        : type == 'audio'
                            ? ChatAudioPlayer(
                                url: media,
                                user: 'receiver',
                              )
                            : type == 'pdf'
                                ? GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _launched = _launchInBrowser(media);
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          AppImages.pdfIcon,
                                          height: 40.w,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Pdf',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(15),
                                            color: AppColor.black,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 35,
                                        ),
                                      ],
                                    ),
                                  )
                                : type == 'xls'
                                    ? GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _launched = _launchInBrowser(media);
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              AppImages.excelIcon,
                                              height: 40.w,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Excel',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize:
                                                    ScreenUtil().setSp(15),
                                                color: AppColor.black,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 35,
                                            ),
                                          ],
                                        ),
                                      )
                                    : type == 'docx'
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _launched =
                                                    _launchInBrowser(media);
                                              });
                                            },
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  AppImages.wordIcon,
                                                  height: 40.w,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Word',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontSize:
                                                        ScreenUtil().setSp(15),
                                                    color: AppColor.black,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 35,
                                                ),
                                              ],
                                            ),
                                          )
                                        : type != 'text'
                                            ? GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _launched =
                                                        _launchInBrowser(media);
                                                  });
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.file_open,
                                                      color:
                                                          AppColor.primaryColor,
                                                      size: 30.h,
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      'File',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontSize: ScreenUtil()
                                                            .setSp(15),
                                                        color: AppColor.black,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 35,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : const SizedBox(),
                const SizedBox(
                  height: 2,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    time,
                    style: WidgetStyle.forgotTExtStyle(
                      color: AppColor.black,
                      fontSize: 10.0.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget buildInput() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 5, bottom: 10, top: 5),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: recording
                      ? Text(
                          'Recording',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : TextField(
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(fontSize: 13.sp),
                          textCapitalization: TextCapitalization.sentences,
                          controller: _chatController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: uploading
                                ? const SizedBox()
                                : IconButton(
                                    onPressed: () async {
                                      if (_chatController.text == "" &&
                                          _imageFile == null) {
                                      } else {
                                        String message = _chatController.text;
                                        _chatController.clear();
                                        await sendMessage(message);

                                        setState(() {
                                          _uploadPath = "";
                                          _imagePath = null;
                                          _imageFile = null;
                                        });
                                      }
                                    },
                                    icon: Icon(
                                      Icons.send,
                                      size: 20.h,
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                            isDense: true,
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Write Here',
                            hintStyle: TextStyle(fontSize: 13.sp),
                          ),
                        ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              // GestureDetector(
              //   onTap: () {
              //     //cameraImage();
              //     filePicker();
              //   },
              //   child: Image.asset(
              //     AppImages.cameraIcon,
              //     width: 25.w,
              //   ),
              // ),
              // SizedBox(
              //   width: 10.w,
              // ),
              GestureDetector(
                onTap: () {
                  ///
                  filePicker();
                },
                child: Image.asset(
                  AppImages.galleryIcon,
                  width: 25.w,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              // GestureDetector(
              //   onTap: () {
              //     _videoFromGallery();
              //   },
              //   child: Image.asset(
              //     AppImages.videoIcon,
              //     width: 20.w,
              //   ),
              // ),
              // SizedBox(
              //   width: 10.w,
              // ),
              GestureDetector(
                onTap: () {
                  _myRecorder!.openRecorder().then((value) {});
                  openTheRecorder().then((value) {
                    setState(() {
                      _mRecorderIsInited = true;
                    });
                  });
                },
                onLongPressStart: (s) {
                  _myRecorder!.openRecorder().then((value) {});
                  openTheRecorder().then((value) {
                    setState(() {
                      _mRecorderIsInited = true;
                    });
                  });
                  setState(() {
                    recording = true;
                  });
                  record();
                },
                onLongPressEnd: (L) {
                  stop();
                  setState(() {
                    recording = false;
                  });
                },
                child: Image.asset(
                  AppImages.micIcon,
                  width: 25.w,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
            ],
          ),
          if (_imageFile != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _imagePath!.endsWith('mp4')
                      ? GestureDetector(
                          onTap: () {
                            if (_controller.value.isPlaying) {
                              _controller.pause();
                            } else {
                              _controller.play();
                            }
                          },
                          child: SizedBox(
                            height: 100.w,
                            width: 100.w,
                            child: Stack(
                              children: [
                                VideoPlayer(_controller),
                                uploading
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          color: AppColor.white,
                                          strokeWidth: 2.0,
                                        ),
                                      )
                                    : const SizedBox()
                              ],
                            ),
                          ),
                        )
                      : _imagePath!.endsWith('pdf')
                          ? Stack(
                              children: [
                                Image.asset(
                                  AppImages.pdfIcon,
                                  height: 100.w,
                                ),
                                uploading
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          color: AppColor.white,
                                          strokeWidth: 2.0,
                                        ),
                                      )
                                    : const SizedBox()
                              ],
                            )
                          : _imagePath!.endsWith('docx')
                              ? Stack(
                                  children: [
                                    Image.asset(
                                      AppImages.wordIcon,
                                      height: 100.w,
                                    ),
                                    uploading
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                              color: AppColor.white,
                                              strokeWidth: 2.0,
                                            ),
                                          )
                                        : const SizedBox()
                                  ],
                                )
                              : _imagePath!.endsWith('xls')
                                  ? Stack(
                                      children: [
                                        Image.asset(
                                          AppImages.excelIcon,
                                          height: 100.w,
                                        ),
                                        uploading
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: AppColor.white,
                                                  strokeWidth: 2.0,
                                                ),
                                              )
                                            : const SizedBox()
                                      ],
                                    )
                                  : _imagePath!.endsWith('png') ||
                                          _imagePath!.endsWith('jpg')
                                      ? SizedBox(
                                          height: 100.w,
                                          width: 80.w,
                                          child: Stack(
                                            children: [
                                              Image.file(
                                                File(
                                                  _imagePath ?? '',
                                                ),
                                              ),
                                              uploading
                                                  ? const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: AppColor.white,
                                                        strokeWidth: 2.0,
                                                      ),
                                                    )
                                                  : const SizedBox()
                                            ],
                                          ),
                                        )
                                      : SizedBox(
                                          height: 100.w,
                                          width: 80.w,
                                          child: Stack(
                                            children: [
                                              Icon(
                                                Icons.file_open,
                                                size: 50.h,
                                              ),
                                              uploading
                                                  ? const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: AppColor.white,
                                                        strokeWidth: 2.0,
                                                      ),
                                                    )
                                                  : const SizedBox()
                                            ],
                                          ),
                                        ),
                  GestureDetector(
                    onTap: () {
                      if (_imagePath!.endsWith('mp4')) {
                        _controller.dispose();
                      }
                      setState(() {
                        _imageFile = null;
                        _imagePath = null;
                      });
                    },
                    child: Icon(
                      Icons.close,
                      size: 20.w,
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }

  Future<void> sendMessage(message) async {
    /// Chat add Collection
    FirebaseFirestore.instance
        .collection('chats')
        .doc('chatsScreen')
        .collection('$largeId-$smallId')
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set(
      {
        'message': message,
        "media_url": _uploadPath,
        'messageId': DateTime.now().millisecondsSinceEpoch.toString(),
        'messageKey': "$largeId-$smallId",
        "read": false,
        "received": true,
        "receiverId": "${widget.receiverId}",
        "send": true,
        "senderId": AppConstants.myId,
        "status": "",
        "type": _uploadPath.isEmpty
            ? 'text'
            : _uploadPath.endsWith('mp4')
                ? "video"
                : _uploadPath.endsWith('aac')
                    ? 'audio'
                    : _uploadPath.endsWith('pdf')
                        ? 'pdf'
                        : _uploadPath.endsWith('docx')
                            ? 'docx'
                            : _uploadPath.endsWith('xls')
                                ? 'xls'
                                : "image",
        "timeStamp": DateFormat('yyyy/MM/dd HH:mm:ss').format(DateTime.now()),
      },
    );

    /// Message Keys Collection
    FirebaseFirestore.instance
        .collection('messageKeys')
        .doc('keys')
        .collection(AppConstants.myId)
        .doc(widget.receiverId)
        .set(
      {
        "id": widget.receiverId,
        "imageUrl": widget.image,
        "lastText": message != ""
            ? message
            : _uploadPath.endsWith('mp4')
                ? "Video"
                : _uploadPath.endsWith('aac')
                    ? "Audio"
                    : _uploadPath.endsWith('png') || _uploadPath.endsWith('jpg')
                        ? "Photo"
                        : "Document",
        "unread": 0,
        "messageKey": "$largeId-$smallId",
        "name": widget.name,
        "time": DateFormat('yyyy/MM/dd HH:mm:ss').format(DateTime.now()),
      },
    );

    /// Message Keys Collection
    FirebaseFirestore.instance
        .collection('messageKeys')
        .doc('keys')
        .collection(widget.receiverId ?? '')
        .doc(AppConstants.myId)
        .set(
      {
        "id": AppConstants.myId,
        "imageUrl": _profileController.image,
        "lastText": message != ""
            ? message
            : _uploadPath.endsWith('mp4')
                ? "Video"
                : _uploadPath.endsWith('aac')
                    ? "Audio"
                    : _uploadPath.endsWith('png') || _uploadPath.endsWith('jpg')
                        ? "Photo"
                        : "Document",
        "unread": 1,
        "messageKey": "$largeId-$smallId",
        "name": AppConstants.userName,
        "time": DateFormat('yyyy/MM/dd HH:mm:ss').format(DateTime.now()),
      },
    );
    // await sendPushNotification();
  }

  Future<void> uploadChatFile(path) async {
    setState(() {
      uploading = true;
    });
    print("sending");
    String url = AppConstants.baseUrl + 'api/upload_chat_files';
    Map map = {
      'user_id': AppConstants.myId,
    };
    ApiResponse apiResponse =
        await NetworkConfig.uploadFileWithToken(url, map, path);

    if (apiResponse.done ?? false) {
      UploadFileEntity response =
          UploadFileEntity.fromJson(apiResponse.responseString ?? '');

      if (response.success == 1) {
        print(response.images);
        setState(() {
          uploading = false;
          _uploadPath = response.images ?? '';
        });
        if (response.images!.endsWith('aac')) {
          /// Chat add Collection
          FirebaseFirestore.instance
              .collection('chats')
              .doc('chatsScreen')
              .collection('$largeId-$smallId')
              .doc(DateTime.now().millisecondsSinceEpoch.toString())
              .set(
            {
              'message': '',
              "media_url": _uploadPath,
              'messageId': DateTime.now().millisecondsSinceEpoch.toString(),
              'messageKey': "$largeId-$smallId",
              "read": false,
              "received": true,
              "receiverId": "${widget.receiverId}",
              "send": true,
              "senderId": AppConstants.myId,
              "type": 'audio',
              "status": "",
              "timeStamp":
                  DateFormat('yyyy/MM/dd HH:mm:ss').format(DateTime.now()),
            },
          );

          /// Message Keys Collection
          FirebaseFirestore.instance
              .collection('messageKeys')
              .doc('keys')
              .collection(AppConstants.myId)
              .doc(widget.receiverId)
              .set(
            {
              "id": widget.receiverId,
              "imageUrl": widget.image,
              "lastText": "Audio",
              "messageKey": "$largeId-$smallId",
              "name": widget.name,
              "time": DateFormat('yyyy/MM/dd HH:mm:ss').format(DateTime.now()),
            },
          );

          /// Message Keys Collection
          FirebaseFirestore.instance
              .collection('messageKeys')
              .doc('keys')
              .collection(widget.receiverId ?? '')
              .doc(AppConstants.myId)
              .set(
            {
              "id": AppConstants.myId,
              "imageUrl": _profileController.image,
              "lastText": "Audio",
              "messageKey": "$largeId-$smallId",
              "name": AppConstants.userName,
              "time": DateFormat('yyyy/MM/dd HH:mm:ss').format(DateTime.now()),
            },
          );
        }
        setState(() {
          _imageFile = null;
          _imagePath = null;
          uploading = false;
        });
      } else {
        await Fluttertoast.showToast(msg: response.message ?? '');
        setState(() {
          _imageFile = null;
          _imagePath = null;
          uploading = false;
        });
      }
    } else {
      setState(() {
        _imageFile = null;
        _imagePath = null;
        uploading = false;
      });
    }
  }

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      //    message = "reach the bottom";

    }
    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      //  message = "reach the top";
    }
  }

  Future<void> sendPushNotification() async {
    Map<String, String> headers = {
      'content-type': 'application/json',
      'Authorization':
          'key=AAAAsgp6bIs:APA91bFB3yMPrQDdiTQ7TvNkQijEuZaXFqEtchHutoNuJf5wYWlfQ5hc8gaydHlpZh6gQaY63cO6jXz82qirXxARWoyRrf-k056aT3xi51Bia4jx6eSvBgyvHdqAk98LILWNwxUbFauN'
    };
    Map map = {
      "registration_ids": _deviceTokens,
      "notification": {
        "body": "New message",
        "title": "You have received a new message",
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
    } else {
      print("error");
    }
  }

  deleteMessage(selected) {
    return Get.defaultDialog(
        middleText: 'Are you sure you want to unsend message?',
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomWidget.dialogButton(
                  name: 'Cancel',
                  isBorderColor: true,
                  onClicked: () {
                    Get.back();
                  }),
              SizedBox(width: 10.w,),
              CustomWidget.dialogButton(
                name: 'Unsend',
                isBorderColor: false,
                onClicked: () async {
                  Get.back();
                  await FirebaseFirestore.instance
                      .collection('chats')
                      .doc('chatsScreen')
                      .collection('$largeId-$smallId')
                      .doc(selected)
                      .delete();
                },
              ),
            ],
          ),
        ]);
  }


}
