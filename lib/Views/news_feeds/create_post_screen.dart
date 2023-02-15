import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mentions/flutter_mentions.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:iobm/Views/news_feeds/tag_people_create.dart';
import 'package:iobm/Widgets/custom_widgets.dart';

import 'package:iobm/controllers/profile_controller.dart';
import 'package:iobm/controllers/tag_users_controller.dart';
import 'package:iobm/helper_classes/ui_helper.dart';
import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:iobm/models/upload_image_response.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/network_config.dart';
import 'package:iobm/networkcalls/response_models/add_post_entity.dart';
import 'package:iobm/networkcalls/response_models/all_users_entity.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:video_player/video_player.dart';

import '../../controllers/checkin_cities_controller.dart';
import '../../controllers/feeling_controller.dart';
import '../../networkcalls/api_path.dart';
import '../../utils/text_styles.dart';
import '../bottom_navigationbar.dart';
import 'check_in_city_screen.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final TagController _tagController = Get.put(TagController());
  final CityController _cityController = Get.put(CityController());
  final FeelingController _feelingController = Get.put(FeelingController());
  bool isPostingStory = true;

  GlobalKey<FlutterMentionsState> key = GlobalKey<FlutterMentionsState>();

  late VideoPlayerController _controller;

  final picker = ImagePicker();
  late List<DBAllUser> _tagUsers;
  List imageFiles = [];
  List<File> _images = [];
  late List<SelectableUser> _users;
  late Future _fetchData;

  List words = [];
  String str = '';
  String postText = '';

  bool wait = false;
  var _dropValue = 'Public';
  final List<ListItem> _dropdownItems = [
    ListItem(
      1,
      "Public",
      const Icon(
        Icons.public_sharp,
        color: AppColor.grey,
      ),
    ),
    ListItem(
      2,
      "My Connections",
      const Icon(
        Icons.people_rounded,
        color: AppColor.grey,
      ),
    ),
  ];
  var map1 = <Map<String, dynamic>>[];
  @override
  void initState() {
    _users = [];
    _fetchData = getConnectedUsers();
    super.initState();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _tagController.tagList.clear();
        return true;
      },
      child: GestureDetector(
        onTap: () {
          print(_feelingController.feelingId.value);
          print(_cityController.cityId.value);
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Create Post',
              style: CustomTextStyles.text16SemiBoldW600,
            ),
            leading: IconButton(
              onPressed: () {
                Get.back();
                _tagController.tagList.clear();
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
            actions: [
              isPostingStory?
              IconButton(
                onPressed: () {
                  if (key.currentState!.controller!.text != "") {
                    _insertPost();
                  } else {
                    UIHelper.showErrorAlert(context, "Please enter something");
                  }
                },
                icon: const Icon(
                  Icons.check,
                ),
              ) :
              Container(
                  width: 50,
                  margin: EdgeInsets.only(right: 10.w),
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(15),
                  child: const CircularProgressIndicator(color: Colors.white,)),
            ],
          ),
          body: FutureBuilder(
            future: _fetchData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return _bodyColumn();
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _bodyColumn() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _nameContainer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: FlutterMentions(
                    style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.grey),
                    textCapitalization: TextCapitalization.sentences,
                    key: key,
                    minLines: 1,
                    maxLines: 50,
                    suggestionPosition: SuggestionPosition.Bottom,
                    decoration:  InputDecoration(
                      hintText: "Write Something ... ",
                      hintStyle: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.greyshade400),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    mentions: [
                      Mention(
                          trigger: '@',
                          style: const TextStyle(
                            color: AppColor.blue,
                          ),
                          data: map1,
                          markupBuilder:
                              (String trigger, String mention, String value) {
                            return """{"user_id":$mention,"name":"$value"}""";
                          },
                          matchAll: false,
                          suggestionBuilder: (data) {
                            return Container(
                              padding: const EdgeInsets.all(10.0),
                              child: ListTile(
                                leading: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircleAvatar(
                                    child: data["image"] == ''
                                        ? const Image(
                                            image:
                                                AssetImage(AppImages.profile),
                                            width: 30,
                                            height: 30,
                                          )
                                        : CachedNetworkImage(
                                            imageUrl: data["image"],
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
                                                CircularProgressIndicator(
                                                    value: downloadProgress
                                                        .progress),
                                          ),
                                  ),
                                ),
                                title: Text(
                                  data['name'],
                                  style: const TextStyle(color: AppColor.black),
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: _images.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: _images[index].toString().contains('mp4')
                                ? GestureDetector(
                                    onTap: () {
                                      if (_controller.value.isPlaying) {
                                        _controller.pause();
                                      } else {
                                        _controller.play();
                                      }
                                    },
                                    child: Stack(
                                      children: [
                                        VideoPlayer(VideoPlayerController.network(_images[index].path)..initialize()),
                                      ],
                                    ),
                                  )
                                : Image.file(
                                    _images[index],
                                    fit: BoxFit.fitWidth,
                                  ),
                          ),
                          Positioned(
                            right: 10,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _images.remove(_images[index]);
                                  imageFiles.removeAt(index);
                                });
                              },
                              child: const Icon(
                                Icons.close,
                                color: AppColor.black,
                                size: 20,
                              ),
                            ),
                          ),
                          wait
                              ? const Center(
                                  child: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: AppColor.white,
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        _bottomRow(),
      ],
    );
  }

  Widget _nameContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColor.black,
          ),
        ),
      ),
      child: Row(
        children: [
          GetBuilder<ProfileController>(
            init: ProfileController(),
            builder: (_) {
              return CircleAvatar(
                child: _.image == ''
                    ? Image(
                        image: const AssetImage(AppImages.profile),
                        width: 70.w,
                        height: 70.w,
                      )
                    : CachedNetworkImage(
                        imageUrl: _.image ?? '',
                        imageBuilder: (context, imageProvider) => Container(
                          width: 70.w,
                          height: 70.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            //   color: AppColor.white,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress),
                          ),
                        ),
                        errorWidget: (context, url, error) => CircleAvatar(
                          //profile image
                          backgroundColor: AppColor.white,
                          backgroundImage: const AssetImage(
                            AppImages.profile,
                          ),
                          radius: 33.r,
                        ),
                      ),
                radius: 33.r,
                //backgroundColor: AppColor.black,
              );
            },
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
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
                    GetBuilder<ProfileController>(
                      init: ProfileController(),
                      builder: (_) {
                        return Text(
                          "${_.firstName} ${_.lastName}",
                          style: CustomTextStyles.text14SemiBoldW600,
                        );
                      },
                    ),
                    Obx(
                      () => _feelingController.feelingName.toString() == '' &&
                              _tagController.tagList.isEmpty &&
                              _cityController.selectedName.toString() == ""
                          ? const SizedBox()
                          : const Text('- '),
                    ),
                    Obx(
                      () => _feelingController.feelingName.toString() != ''
                          ? CachedNetworkImage(
                              height: 16.w,
                              width: 16.w,
                              imageUrl:
                                  _feelingController.feelingIcon.toString(),
                            )
                          : const SizedBox(),
                    ),
                    Obx(
                      () => _feelingController.feelingName.toString() != ''
                          ? Text(
                              "Feeling "
                              '${_feelingController.feelingName} ',
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(13),
                              ),
                            )
                          : const SizedBox(),
                    ),
                    Obx(
                      () => _tagController.tagList.isNotEmpty
                          ? GestureDetector(
                              onTap: () {
                                Get.to(() => TagUsersScreen(tags: _users));
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "with ",
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(13),
                                    ),
                                  ),
                                  _tagController.tagList.length > 1
                                      ? Text(
                                          _tagController.tagList[0].firstName
                                                  .toString() +
                                              " & ${_tagController.tagList.length - 1} more ",
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(13),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : Text(
                                          _tagController.tagList[0].firstName
                                                  .toString() +
                                              ' ',
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(13),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                ],
                              ),
                            )
                          : const SizedBox(),
                    ),
                    Obx(
                      () => _cityController.selectedName.toString() != ""
                          ? Text(
                              "in " '${_cityController.selectedName}',
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(13),
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 35,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.black,
                      width: 0.3,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButton(
                    underline: Container(),
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    value: _dropValue,
                    onChanged: (newValue) {
                      setState(
                        () {
                          _dropValue = newValue.toString();
                          print(_dropValue);
                        },
                      );
                    },
                    items: _dropdownItems.map(
                      (itemValue) {
                        return DropdownMenuItem(
                          value: itemValue.name,
                          child: Row(
                            children: [
                              itemValue.icon,
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                itemValue.name,
                                style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.grey,),
                              ),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _bottomRow() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: AppColor.black,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  _imgFromCamera();
                },
                child: Image.asset(
                  AppImages.cameraIcon,
                  height: 25.w,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  _imgFromGallery();
                },
                child: Image.asset(
                  AppImages.galleryIcon,
                  height: 25.w,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  _videoFromGallery();
                },
                child: Image.asset(
                  AppImages.videoIcon,
                  height: 25.w,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  CustomWidget.feelingsDialog(context: context);
                  // showDialog(
                  //     context: context,
                  //     builder: (BuildContext context) {
                  //       return _feelingsDialog();
                  //     });
                },
                child: Image.asset(
                  AppImages.wowIcon,
                  height: 25.w,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(
                    () => TagUsersScreen(
                      tags: _users,
                    ),
                  );
                },
                child: Image.asset(
                  AppImages.tagIcon,
                  height: 25.w,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const CheckinScreen());
                },
                child: Image.asset(
                  AppImages.checkInIcon,
                  height: 25.w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _feelingsDialog() {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'How are you feeling?',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(14),
            ),
          )
        ],
      ),
    );
  }

  _imgFromGallery() async {
    // ignore: deprecated_member_use
    List<XFile>? files = await picker.pickMultiImage(
      imageQuality: 50,
    );
    if (files != null) {
      List<File> temp = [];

      for (var element in files) {
        setState(() {
          _images.add(File(element.path));
        });
      }

      for (var element in files) {
        temp.add(
          File(element.path),
        );
      }

      for (var element in temp) {
        _uploadImage(element.path);
      }
    } else {}
  }

  _videoFromGallery() async {
    XFile? file = await picker.pickVideo(
      source: ImageSource.gallery,
    );
    if (file != null) {
      _controller = VideoPlayerController.network(file.path)..initialize();
      setState(() {
        _images.add(File(file.path));
      });
      _uploadImage(file.path);
    }
  }

  _imgFromCamera() async {
    XFile? file = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    if (file != null) {
      setState(() {
        _images.add(File(file.path));
      });
      _uploadImage(file.path);
    } else {}
  }

  Future<void> _uploadImage(file) async {
    setState(() {
      wait = true;
    });
    Map<String, dynamic> map = {};
    ApiResponse data = await NetworkConfig.uploadFileWithToken(
      AppConstants.baseUrl + apiInsertTimelineImage,
      map,
      file,
    );
    if (data.done ?? false) {
      UploadImageResponse fileResponse =
          UploadImageResponse.fromJson(data.responseString ?? '');
      if (fileResponse.success == 1) {
        print(fileResponse.message);
        setState(
          () {
            imageFiles.add(fileResponse.image);
            wait = false;
          },
        );
      } else {
        print(data.responseString);
      }
    } else {
      print(data.responseString);
    }
    // setState(() {
    //   wait = false;
    // });
  }

  Future<void> _insertPost() async {
    setState(() {
      isPostingStory = false;
    });
    var tagIds = [];
    if (_tagController.tagList.isNotEmpty) {
      for (var element in _tagController.tagList) {
        tagIds.add(element.userId);
      }
    }
    var response = await ApiCalls.insertTimelinePost(
      userId: AppConstants.myId,
      postText: key.currentState!.controller!.markupText,
      postMedia: jsonEncode(imageFiles),
      tag: tagIds.toString(),
      postType: _dropValue == 'Public' ? "Public" : "my_connections",
      feeling: _feelingController.feelingId.value,
      checkin: _cityController.cityId.value,
    );
    if (response is ErrorEntity) {
      setState(() {
        isPostingStory = true;
      });
      UIHelper.showErrorAlert(context, response.message);
    } else {
      AddPostEntity postEntity = AddPostEntity().fromJson(response);
      if (postEntity.success == 1) {
        await Fluttertoast.showToast(msg: "Post added successfully");
        setState(() {
          isPostingStory = true;
        });
        Get.offUntil(
            GetPageRoute(
              page: () => const BottomNavigationScreen(),
            ),
            (route) => false);
      }
    }
  }

  Future<void> getConnectedUsers() async {
    _tagUsers = await database.getConnected(
      connected: 'Y',
      status: AppConstants.connect,
    );

    var response = await ApiCalls.getAllUsers(
        url:
            "api/get_users?next_page=0&name=&country=&city=&industry=&graduation_year=&branch=&is_mentor=&user_id=${AppConstants.myId}&company_id=&connected=Y&is_networking=");
    if (response is ErrorEntity) {
    } else {
      AllUsersEntity usersEntity = AllUsersEntity().fromJson(response);
      if (usersEntity.success == 1) {
        await database.insertAllUsers(usersEntity.result!);
        _tagUsers = await database.getConnected(
          connected: 'Y',
          status: AppConstants.connect,
        );
        for (var element in _tagUsers) {
          _users.add(
            SelectableUser(
              allUser: element,
              isSelected: false,
            ),
          );
        }

        setState(
          () {
            map1 = _tagUsers
                .map((h) => {
                      "display": h.firstName,
                      "id": h.userId,
                      "name": h.firstName,
                      "image": h.image,
                    })
                .toList();
          },
        );
      }
    }
  }
}

class SelectableUser {
  DBAllUser allUser;
  bool isSelected;
  SelectableUser({
    required this.allUser,
    required this.isSelected,
  });
}

class ListItem {
  int value;
  String name;
  Icon icon;

  ListItem(this.value, this.name, this.icon);
}
