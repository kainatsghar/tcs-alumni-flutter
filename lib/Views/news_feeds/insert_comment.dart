import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart' as html;
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iobm/Views/news_feeds/full_image_view.dart';
import 'package:iobm/Views/news_feeds/reactions_details.dart';
import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/data_fetched.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:html/parser.dart' show parse;
import 'package:iobm/networkcalls/api_calls.dart';

import 'package:iobm/networkcalls/api_helper.dart';
import 'package:iobm/networkcalls/response_models/all_users_entity.dart';
import 'package:iobm/networkcalls/response_models/insert_comment_entity.dart';
import 'package:iobm/networkcalls/response_models/reply_entity.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/app_utils.dart';

import '../../helper_classes/ui_helper.dart';
import '../../networkcalls/response_models/delete_post_entity.dart';
import '../../networkcalls/response_models/like_post_entity.dart';
import '../../utils/text_styles.dart';
import '../more/profile_screen.dart';
import 'create_post_screen.dart';

class InsertComments extends StatefulWidget {
  const InsertComments(
      {Key? key, required this.postId, required this.totalLikes})
      : super(key: key);
  final String postId;
  final String totalLikes;

  @override
  _InsertCommentsState createState() => _InsertCommentsState();
}

class _InsertCommentsState extends State<InsertComments> {
  TextEditingController commentText = TextEditingController();
  GlobalKey<FlutterMentionsState> key = GlobalKey<FlutterMentionsState>();

  bool isLoading = false;

  ///Reactions List
  List<Reaction<String>> reactions = [
    Reaction(icon: _emojis(AppImages.likeIcon), value: 'Like'),
    Reaction(icon: _emojis(AppImages.heartIcon), value: 'Love'),
    Reaction(icon: _emojis(AppImages.hahaIcon), value: 'HaHa'),
    Reaction(icon: _emojis(AppImages.wowIcon), value: 'Wow'),
    Reaction(icon: _emojis(AppImages.sadIcon), value: 'Sad'),
    Reaction(icon: _emojis(AppImages.angryIcon), value: 'Angry'),
  ];

  late List<DBComment> _comments;
  late List<DBCommentReplie> _replies;
  late Future _fetchData;
  int count = 0;
  var map1 = <Map<String, dynamic>>[];
  late List<DBAllUser> _tagUsers;
  late List<SelectableUser> _users;
  late List tagUsersList;

  bool commentsVisible = true;
  int _currentindex = 0;

  ///Reply Feature
  bool replying = false;
  String replyName = '';
  String commentId = '';
  String replyId = '';
  bool updateComment = false;

  /// Image Picker
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
    print("widget.postId= ${widget.postId}");
    _comments = [];
    _replies = [];
    tagUsersList = [];
    _users = [];
    _fetchData = getComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back(result: count);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          shape: Border(
            bottom: BorderSide(color: AppColor.secAppBar, width: 3.w),
          ),
          title: const Text('All Comments'),
        ),

        /// endregion
        body: FutureBuilder(
          future: _fetchData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return _bodyContainer();
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _bodyContainer() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(
                  () => ReactionsDetail(
                postId: widget.postId,
                totalCount: widget.totalLikes,
                commentId: '',
                replyId: '',
              ),
              transition: Transition.rightToLeft,
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5, left: 15),
            child: Row(
              children: [
                const Icon(
                  Icons.thumb_up_alt_outlined,
                  size: 15,
                ),
                const SizedBox(width: 5),
                Text(
                  'Total likes: ${widget.totalLikes}',
                  style: CustomTextStyles.text12RegularW400,
                ),
              ],
            ),
          ),
        ),
        const Divider(
          thickness: 1,
        ),
        Expanded(
          child: _loadComments(),
        ),
        buildInput(),
      ],
    );
  }

  Widget _loadComments() {
    if (_comments.isEmpty) {
      return Center(
        child: Text(
          'No Comments Found',
          style: CustomTextStyles.text14SemiBoldW600,
        ),
      );
    } else {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: _comments.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(
                              () => ProfileScreen(
                            userID: _comments[index].commentedBy,
                          ),
                        );
                      },
                      child: CachedNetworkImage(
                        imageUrl: _comments[index].userImage ?? '',
                        imageBuilder: (context, imageProvider) => Container(
                          width: 45.w,
                          height: 45.w,
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
                            (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                        errorWidget: (context, url, error) => CircleAvatar(
                          //profile image
                          backgroundColor: AppColor.white,
                          backgroundImage: const AssetImage(AppImages.profile),
                          radius: 25.r,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onLongPress: (){
                              setState(() {
                                _currentindex = index;
                                print('_currentindex on longPress: $_currentindex');
                              });
                              showModalBottomSheet(
                                  context: context,
                                  shape:  RoundedRectangleBorder( // <-- SEE HERE
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20.r),
                                    ),
                                  ),
                                  builder: (BuildContext context){
                                    return Container(
                                      height: Get.height * 0.18,
                                      child: Padding(
                                        padding:  EdgeInsets.only(left: 16.w,top: 16.h),
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () async{
                                                print("Click on Report Comment");
                                                // await showDialog(
                                                //     barrierDismissible: false,
                                                //     context: context,
                                                //     builder: (BuildContext context) {
                                                //   return _bodyColumn(
                                                //       _reportTypes[index].id);
                                                // });
                                              },
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(AppImages.reportIcon),
                                                  SizedBox(width: 10.w,),
                                                  Text('Report Comment', style: CustomTextStyles.text14SemiBoldW600,),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 20.h,),
                                            GestureDetector(
                                              onTap: (){
                                                print("Click on Hide Comment");
                                                print("CurrentIndex=$_currentindex");

                                                Navigator.pop(context);
                                                if(commentsVisible && _currentindex == index){
                                                  setState(() {
                                                    commentsVisible = false;
                                                    print('index in If: $_currentindex');
                                                  });
                                                }
                                                else {
                                                  setState(() {
                                                    commentsVisible = true;
                                                    print('index in Else: $_currentindex');
                                                  });
                                                }
                                              },
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(AppImages.hideIcon),
                                                  SizedBox(width: 15.w,),
                                                  commentsVisible && _currentindex == index ? Text('Hide Comment', style: CustomTextStyles.text14SemiBoldW600,)
                                                      : Text('Unhide Comment', style: CustomTextStyles.text14SemiBoldW600,),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: AppColor.greyshade200,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(
                                                () => ProfileScreen(
                                              userID:
                                              _comments[index].commentedBy,
                                            ),
                                          );
                                        },
                                        child: Text(
                                          '${_comments[index].firstName}',
                                          style: CustomTextStyles.text14SemiBoldW600.copyWith(color: AppColor.greyshade800,),
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        '${AppUtils().calculateFormatDifference(_comments[index].createdDate ?? '')}',
                                        style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.greyshade600,),
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: _comments[index].commentedBy == AppConstants.myId
                                            ? PopupMenuButton(onSelected: (result) {
                                              if (result == 1) {
                                                deleteTimeLineComment(_comments[index].id ?? '', "");
                                                setState(() {
                                                  count--;
                                                });
                                              } else if (result == 0) {
                                                print("clicked 1");
                                                setState(() {
                                                  updateComment = true;
                                                  commentId = _comments[index].id ?? '';
                                                });
                                                String text = _comments[index].comment ?? '';
                                                String finalText = "";
                                                if (text.contains("{")) {
                                                  final startIndex = text.indexOf("{");
                                                  final endIndex = text.indexOf("}");
                                                  final jsonString = text.substring(startIndex, endIndex + 1);
                                                  final decodedMap = json.decode(jsonString);
                                                  finalText = text.replaceAll(jsonString, "@${decodedMap['name']}");
                                                  key.currentState!.controller!.text = finalText;
                                                } else {
                                                  setState(() {
                                                    key.currentState!.controller!.text = _parseHtmlString(text).replaceAll('"', '');
                                                  });
                                                }
                                              }
                                            }, itemBuilder: (context) {
                                              return [
                                            PopupMenuItem(
                                                value: 0,
                                                child: Text('Edit', style: CustomTextStyles.text12RegularW400,)),
                                            PopupMenuItem(
                                                value: 1,
                                                child: Text('Delete', style: CustomTextStyles.text12RegularW400,)),
                                          ];
                                        })
                                            : const SizedBox(),
                                      ),
                                    ],
                                  ),
                                  html.HtmlWidget(
                                    AppUtils().commentString(_comments[index].comment ?? ''),
                                    textStyle: CustomTextStyles.text12RegularW400,
                                  ),

                                  // Text(
                                  //   AppUtils().commentString(
                                  //       _comments[index].comment ?? ''),
                                  //   style: TextStyle(
                                  //     color:
                                  //          AppColor.greyshade800,
                                  //     fontSize: ScreenUtil().setSp(13),
                                  //   ),
                                  //   textAlign: TextAlign.left,
                                  // ),
                                  // AppUtils().commentString(_comments[index].comment ?? '').startsWith('@') ? AppColor.blue :
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  if (_comments[index].commentImage != "")
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(
                                                () => FullViewImage(
                                              image: _comments[index]
                                                  .commentImage ??
                                                  '',
                                            ),
                                            duration:
                                            const Duration(milliseconds: 300),
                                            curve: Curves.easeIn);
                                      },
                                      child: Hero(
                                        tag: 'fullImage',
                                        child: CachedNetworkImage(
                                          imageUrl:
                                          _comments[index].commentImage ?? '',
                                          height: 200,
                                          progressIndicatorBuilder:
                                              (context, url, downloadProgress) =>
                                              Center(
                                                child: CircularProgressIndicator(
                                                  value: downloadProgress.progress,
                                                  strokeWidth: 2.0,
                                                ),
                                              ),
                                          errorWidget: (context, url, error) =>
                                              Image.asset(
                                                AppImages.noImage,
                                              ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 8.w,
                              ),
                              _commentReaction(index),
                              SizedBox(
                                width: 8.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    replying = true;
                                    replyName =
                                        _comments[index].firstName ?? '';
                                    commentId = _comments[index].id ?? '';
                                  });
                                },
                                child: Text(
                                  'Reply',
                                  style: CustomTextStyles.text12RegularW400,
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                              if (int.parse(_comments[index].likeCount ?? '') >
                                  0)
                                GestureDetector(
                                  onTap: () {
                                    Get.to(
                                          () => ReactionsDetail(
                                        postId: widget.postId,
                                        totalCount:
                                        _comments[index].likeCount ?? '',
                                        commentId: _comments[index].id ?? '',
                                        replyId: '',
                                      ),
                                      transition: Transition.rightToLeft,
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        _comments[index].likeCount ?? '',
                                        style: CustomTextStyles.text14SemiBoldW600,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.thumb_up_alt_outlined,
                                        size: 16.w,
                                      ),
                                    ],
                                  ),
                                ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                for (var element in _replies)
                  if (element.commentId == _comments[index].id)
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0)
                          .copyWith(left: 45.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                        () => ProfileScreen(
                                      userID: element.commentedBy,
                                    ),
                                  );
                                },
                                child: CachedNetworkImage(
                                  imageUrl: element.userImage ?? '',
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                        width: 45.w,
                                        height: 45.w,
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
                                      (context, url, downloadProgress) =>
                                      CircularProgressIndicator(
                                          value: downloadProgress.progress),
                                  errorWidget: (context, url, error) =>
                                      CircleAvatar(
                                        //profile image
                                        backgroundColor: AppColor.white,
                                        backgroundImage:
                                        const AssetImage(AppImages.profile),
                                        radius: 25.r,
                                      ),
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(10.r),
                                        color: AppColor.greyshade200,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(
                                                        () => ProfileScreen(
                                                      userID:
                                                      element.commentedBy,
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                  element.firstName ?? '',
                                                  style: CustomTextStyles.text14SemiBoldW600.copyWith(color: AppColor.greyshade800,),
                                                ),
                                              ),
                                              const Spacer(),
                                              Text(
                                                '${AppUtils().calculateFormatDifference(element.createdDate ?? '')}',
                                                style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.greyshade600,),
                                              ),
                                              SizedBox(
                                                height: 30,
                                                width: 30,
                                                child: element.commentedBy == AppConstants.myId
                                                    ? PopupMenuButton(onSelected: (result) {
                                                      if (result == 1) {
                                                        print('reply deleted');
                                                        deleteTimeLineComment('', element.id ?? '');
                                                      } else if (result == 0) {
                                                        print("Editing Reply");
                                                        setState(() {
                                                          updateComment = true;
                                                          replyId = element.id ?? '';
                                                          commentId = element.commentId ?? "";
                                                        });
                                                        print(replyId);
                                                        print("Editing Reply");
                                                        String text = element.comment ?? '';
                                                        String finalText = "";
                                                        if (text.contains("{")) {
                                                          final startIndex = text.indexOf("{");
                                                          final endIndex = text.indexOf("}");
                                                          final jsonString = text.substring(startIndex, endIndex + 1);
                                                          final decodedMap = json.decode(jsonString);
                                                          finalText = text.replaceAll(jsonString, "@${decodedMap['name']}");
                                                          key.currentState!.controller!.text = finalText;
                                                        } else {
                                                          setState(() {
                                                            key.currentState!.controller!.text = text;
                                                          });
                                                        }
                                                      }
                                                    }, itemBuilder: (context) {
                                                      return [
                                                    PopupMenuItem(
                                                        value: 0,
                                                        child: Text('Edit', style: CustomTextStyles.text12RegularW400,)),
                                                    PopupMenuItem(
                                                        value: 1,
                                                        child:
                                                        Text('Delete', style: CustomTextStyles.text12RegularW400,)),
                                                  ];
                                                })
                                                    : const SizedBox(),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            AppUtils().commentString(
                                                element.comment ?? ''),
                                            style: CustomTextStyles.text12RegularW400,
                                            textAlign: TextAlign.left,
                                          ),
                                          if (element.commentImage != "")
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(
                                                      () => FullViewImage(
                                                      image: element
                                                          .commentImage ??
                                                          ''),
                                                );
                                              },
                                              child: Hero(
                                                tag: 'fullImage',
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                  element.commentImage ??
                                                      '',
                                                  height: 200,
                                                  progressIndicatorBuilder:
                                                      (context, url,
                                                      downloadProgress) =>
                                                      Center(
                                                        child:
                                                        CircularProgressIndicator(
                                                          value: downloadProgress
                                                              .progress,
                                                          strokeWidth: 2.0,
                                                        ),
                                                      ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                      Image.asset(
                                                        AppImages.noImage,
                                                      ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        _replyReaction(
                                            _replies.indexOf(element),
                                            element,
                                            index),
                                        const Expanded(child: SizedBox()),
                                        if (int.parse(element.likeCount ?? '') >
                                            0)
                                          GestureDetector(
                                            onTap: () {
                                              Get.to(
                                                    () => ReactionsDetail(
                                                  postId: '',
                                                  totalCount:
                                                  element.likeCount ?? '',
                                                  commentId: '',
                                                  replyId: element.id ?? '',
                                                ),
                                                transition:
                                                Transition.rightToLeft,
                                              );
                                            },
                                            child: Row(
                                              children: [
                                                Text(
                                                  element.likeCount ?? '',
                                                  style: TextStyle(
                                                    fontSize:
                                                    ScreenUtil().setSp(14),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Icon(
                                                  Icons.thumb_up_alt_outlined,
                                                  size: 16.w,
                                                ),
                                              ],
                                            ),
                                          ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
              ],
            ),
          );
        },
      );
    }
  }

  static Widget _emojis(icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Image.asset(
        icon,
        height: 22.w,
        width: 22.w,
      ),
    );
  }

  Widget _commentReaction(index) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ReactionButtonToggle(
        isChecked: _comments[index].isLike == "1" ? true : false,
        onReactionChanged: (String? value, bool check) async {
          print(value);
          print(check);
          if (check && value == '') {
            await likeDislikeComment(
              index,
              _comments[index].id,
              "like",
              'Like',
            );
          } else if (check && value != "") {
            await likeDislikeComment(
              index,
              _comments[index].id,
              "like",
              value,
            );
          } else if (check == false && value != "") {
            await likeDislikeComment(
              index,
              _comments[index].id,
              "unlike",
              '',
            );
          } else if (check == false && value == "") {
            await likeDislikeComment(
              index,
              _comments[index].id,
              "like",
              'Like',
            );
          }
        },
        boxPadding: const EdgeInsets.all(5),
        boxElevation: 5,
        boxPosition: VerticalPosition.BOTTOM,
        reactions: reactions,
        initialReaction: _comments[index].reaction == ""
            ? Reaction(
          value: '',
          icon: Icon(
            Icons.thumb_up_alt_outlined,
            size: 20.w,
          ),
        )
            : _comments[index].reaction == "Like"
            ? Reaction(
          value: 'Like',
          icon: Image.asset(
            AppImages.likeIcon,
            height: 20.w,
            width: 20.w,
          ),
        )
            : _comments[index].reaction == "Love"
            ? Reaction(
          value: 'Love',
          icon: Image.asset(
            AppImages.heartIcon,
            height: 20.w,
            width: 20.w,
          ),
        )
            : _comments[index].reaction == "HaHa"
            ? Reaction(
          value: 'HaHa',
          icon: Image.asset(
            AppImages.hahaIcon,
            height: 20.w,
            width: 20.w,
          ),
        )
            : _comments[index].reaction == "Sad"
            ? Reaction(
          value: 'Sad',
          icon: Image.asset(
            AppImages.sadIcon,
            height: 20.w,
            width: 20.w,
          ),
        )
            : _comments[index].reaction == "Wow"
            ? Reaction(
          value: 'Wow',
          icon: Image.asset(
            AppImages.wowIcon,
            height: 20.w,
            width: 20.w,
          ),
        )
            : Reaction(
          value: 'Angry',
          icon: Image.asset(
            AppImages.angryIcon,
            height: 20.w,
            width: 20.w,
          ),
        ),
        selectedReaction: _comments[index].reaction == ""
            ? Reaction<String>(
          value: '',
          icon: Icon(
            Icons.thumb_up_alt_outlined,
            size: 20.w,
          ),
        )
            : _comments[index].reaction == "Like"
            ? Reaction<String>(
          value: 'Like',
          icon: Image.asset(
            AppImages.likeIcon,
            height: 20.w,
            width: 20.w,
          ),
        )
            : _comments[index].reaction == "Love"
            ? Reaction<String>(
          value: 'Love',
          icon: Image.asset(
            AppImages.heartIcon,
            height: 20.w,
            width: 20.w,
          ),
        )
            : _comments[index].reaction == "HaHa"
            ? Reaction<String>(
          value: 'HaHa',
          icon: Image.asset(
            AppImages.hahaIcon,
            height: 20.w,
            width: 20.w,
          ),
        )
            : _comments[index].reaction == "Sad"
            ? Reaction<String>(
          value: 'Sad',
          icon: Image.asset(
            AppImages.sadIcon,
            height: 20.w,
            width: 20.w,
          ),
        )
            : _comments[index].reaction == "Wow"
            ? Reaction<String>(
          value: 'Wow',
          icon: Image.asset(
            AppImages.wowIcon,
            height: 20.w,
            width: 20.w,
          ),
        )
            : Reaction<String>(
          value: 'Angry',
          icon: Image.asset(
            AppImages.angryIcon,
            height: 20.w,
            width: 20.w,
          ),
        ),
        boxColor: Colors.white,
        boxRadius: 15,
        boxDuration: const Duration(milliseconds: 200),
        itemScaleDuration: const Duration(milliseconds: 100),
        itemScale: 0.9,
      ),
    );
  }

  Widget _replyReaction(replyIndex, DBCommentReplie element, commentIndex) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ReactionButtonToggle(
        isChecked: _replies[replyIndex].isLike == "1" ? true : false,
        onReactionChanged: (String? value, bool check) async {
          print(value);
          print(check);
          if (check && value == '') {
            await likeDislikeReply(
              replyIndex,
              _comments[commentIndex].id,
              "like",
              'Like',
              element.id,
            );
          } else if (check && value != "") {
            await likeDislikeReply(
              replyIndex,
              _comments[commentIndex].id,
              "like",
              value,
              element.id,
            );
          } else if (check == false && value != "") {
            await likeDislikeReply(
              replyIndex,
              _comments[commentIndex].id,
              "unlike",
              '',
              element.id,
            );
          } else if (check == false && value == "") {
            await likeDislikeReply(
              replyIndex,
              _comments[commentIndex].id,
              "like",
              'Like',
              element.id,
            );
          }
        },
        boxPadding: const EdgeInsets.all(8),
        boxElevation: 5,
        boxPosition: VerticalPosition.BOTTOM,
        reactions: reactions,
        initialReaction: _replies[replyIndex].reaction == ""
            ? Reaction(
          value: '',
          icon: Icon(
            Icons.thumb_up_alt_outlined,
            size: 20.w,
          ),
        )
            : _replies[replyIndex].reaction == "Like"
            ? Reaction(
          value: 'Like',
          icon: Image.asset(
            AppImages.likeIcon,
            height: 20.w,
            width: 20.w,
          ),
        )
            : _replies[replyIndex].reaction == "Love"
            ? Reaction(
          value: 'Love',
          icon: Image.asset(
            AppImages.heartIcon,
            height: 20.w,
            width: 20.w,
          ),
        )
            : _replies[replyIndex].reaction == "HaHa"
            ? Reaction(
          value: 'HaHa',
          icon: Image.asset(
            AppImages.hahaIcon,
            height: 20.w,
            width: 20.w,
          ),
        )
            : _replies[replyIndex].reaction == "Sad"
            ? Reaction(
          value: 'Sad',
          icon: Image.asset(
            AppImages.sadIcon,
            height: 20.w,
            width: 20.w,
          ),
        )
            : _replies[replyIndex].reaction == "Wow"
            ? Reaction(
          value: 'Wow',
          icon: Image.asset(
            AppImages.wowIcon,
            height: 20.w,
            width: 20.w,
          ),
        )
            : Reaction(
          value: 'Angry',
          icon: Image.asset(
            AppImages.angryIcon,
            height: 20.w,
            width: 20.w,
          ),
        ),
        selectedReaction: _replies[replyIndex].reaction == ""
            ? Reaction<String>(
          value: '',
          icon: Icon(
            Icons.thumb_up_alt_outlined,
            size: 20.w,
          ),
        )
            : _replies[replyIndex].reaction == "Like"
            ? Reaction<String>(
          value: 'Like',
          icon: Image.asset(
            AppImages.likeIcon,
            height: 20.w,
            width: 20.w,
          ),
        )
            : _replies[replyIndex].reaction == "Love"
            ? Reaction<String>(
          value: 'Love',
          icon: Image.asset(
            AppImages.heartIcon,
            height: 20.w,
            width: 20.w,
          ),
        )
            : _replies[replyIndex].reaction == "HaHa"
            ? Reaction<String>(
          value: 'HaHa',
          icon: Image.asset(
            AppImages.hahaIcon,
            height: 20.w,
            width: 20.w,
          ),
        )
            : _replies[replyIndex].reaction == "Sad"
            ? Reaction<String>(
          value: 'Sad',
          icon: Image.asset(
            AppImages.sadIcon,
            height: 20.w,
            width: 20.w,
          ),
        )
            : _replies[replyIndex].reaction == "Wow"
            ? Reaction<String>(
          value: 'Wow',
          icon: Image.asset(
            AppImages.wowIcon,
            height: 20.w,
            width: 20.w,
          ),
        )
            : Reaction<String>(
          value: 'Angry',
          icon: Image.asset(
            AppImages.angryIcon,
            height: 20.w,
            width: 20.w,
          ),
        ),
        boxColor: Colors.white,
        boxRadius: 30,
        boxDuration: const Duration(milliseconds: 200),
        itemScaleDuration: const Duration(milliseconds: 100),
        itemScale: 0.8,
      ),
    );
  }

  Widget buildInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Column(
        children: [
          const Divider(),
          if (replying)
            Row(
              children: [
                Row(
                  children: [
                    Text(
                      'Replying to ',
                      style: CustomTextStyles.text12RegularW400,
                    ),
                    Text(
                      replyName,
                      style: CustomTextStyles.text12SemiBoldW600.copyWith(color: AppColor.black,),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      replying = false;
                    });
                  },
                  icon: Icon(
                    Icons.close,
                    size: 18.h,
                    color: AppColor.primaryColor,
                  ),
                  padding: EdgeInsets.zero,
                )
              ],
            ),
          if (updateComment)
            Row(
              children: [
                Row(
                  children: [
                    Text(
                      'Editing',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      updateComment = false;
                      commentId = '';
                      replyId = '';
                      key.currentState!.controller!.clear();
                    });
                  },
                  icon: Icon(
                    Icons.close,
                    size: 20.h,
                    color: AppColor.primaryColor,
                  ),
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
          Row(
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FlutterMentions(
                    key: key,
                    minLines: 1,
                    maxLines: 50,
                    suggestionPosition: SuggestionPosition.Top,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      filled: true,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          galleryImage();
                        },
                        child: const Icon(Icons.attachment),
                      ),
                      fillColor: AppColor.greyshade200,
                      hintText: replying ? "Write Reply" : "Add Comment",
                      hintStyle: CustomTextStyles.text14SemiBoldW600,
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
                          //disableMarkup: true,
                          data: map1,
                          markupBuilder:
                              (String trigger, String mention, String value) {
                            return """{"user_id":$mention,"name":"$value"}""";
                          },
                          matchAll: false,
                          suggestionBuilder: (data) {
                            return Container(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
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
                                      errorWidget:
                                          (context, url, error) =>
                                          CircleAvatar(
                                            //profile image
                                            backgroundColor: AppColor.white,
                                            backgroundImage: const AssetImage(
                                                AppImages.profile),
                                            radius: 30.r,
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
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: ()   {
                  setState(() {
                    isLoading = true;
                  });
                  Future.delayed(Duration(seconds: 1), () async{
                    print("Executed after 1 seconds");
                    setState(() {
                      isLoading = false;
                    });
                    if (key.currentState!.controller!.text != '' || _imagePath != null) {
                      if (replyId == '') {
                        if (replying) {
                          await insertReply('');
                          key.currentState!.controller!.clear();
                          FocusScope.of(context).unfocus();
                          await setDataFromDB();
                          setState(() {
                            updateComment = false;
                            replyId = '';
                          });
                        } else {
                          await insertComment();
                          key.currentState!.controller!.clear();
                          FocusScope.of(context).unfocus();
                          await setDataFromDB();
                          setState(() {
                            updateComment = false;
                            commentId = '';
                          });
                        }
                      } else {
                        await insertReply(replyId);
                        key.currentState!.controller!.clear();
                        FocusScope.of(context).unfocus();
                        await setDataFromDB();
                        setState(() {
                          updateComment = false;
                          replyId = '';
                        });
                      }
                    }
                  });
                },
                icon: isLoading ? SizedBox(
                    height: 25.h,
                    width: 25.w,
                    child: CircularProgressIndicator(color: AppColor.primaryColor,strokeWidth: 2,)) : Icon(
                  Icons.send,
                  size: 25.h,
                  color: AppColor.primaryColor,
                ),
                padding: EdgeInsets.zero,
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          if (_imageFile != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.file(
                    File(
                      _imagePath ?? '',
                    ),
                    height: 100,
                  ),
                  GestureDetector(
                    onTap: () {
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

  Future<void> likeDislikeComment(index, commentID, status, reaction) async {
    var response = await ApiCalls.likeUnlikePost(
      userId: AppConstants.myId,
      status: status,
      postId: widget.postId,
      commentId: commentID,
      reaction: reaction,
      type: "timeline",
    );
    if (response is ErrorEntity) {
      UIHelper.showErrorAlert(context, response.message);
      print(response.message);
    } else {
      LikePostEntity likeEntity = LikePostEntity().fromJson(response);
      if (likeEntity.success == 1) {
        // await database.editPostLikes(
        //   postId,
        //   likeEntity.result.likes.toString(),
        // );
        // await database.editPostLikeStatus(
        //   postId,
        //   status == "like" ? "1" : "0",
        // );
        setState(
              () {
            _comments[index].likeCount = likeEntity.result.likes.toString();
            _comments[index].reaction = reaction;
            if (status == 'like') {
              _comments[index].isLike = '1';
            } else {
              _comments[index].isLike = '0';
            }
          },
        );
      }
    }
  }

  Future<void> likeDislikeReply(
      index, commentID, status, reaction, replyId) async {
    var response = await ApiCalls.likeUnlikePost(
      userId: AppConstants.myId,
      status: status,
      postId: widget.postId,
      commentId: commentID,
      reaction: reaction,
      type: "timeline",
      replyId: replyId,
    );
    if (response is ErrorEntity) {
      UIHelper.showErrorAlert(context, response.message);
      print(response.message);
    } else {
      LikePostEntity likeEntity = LikePostEntity().fromJson(response);
      if (likeEntity.success == 1) {
        // await database.editPostLikes(
        //   postId,
        //   likeEntity.result.likes.toString(),
        // );
        // await database.editPostLikeStatus(
        //   postId,
        //   status == "like" ? "1" : "0",
        // );
        setState(
              () {
            _replies[index].likeCount = likeEntity.result.likes.toString();
            _replies[index].reaction = reaction;
            if (status == 'like') {
              _replies[index].isLike = '1';
            } else {
              _replies[index].isLike = '0';
            }
          },
        );
      }
    }
  }

  Future<void> getComments() async {
    await getConnectedUsers();
    DataFetched dataFetched =
    await ApiHelper.loadPostComments(widget.postId, 'timeline');
    // if (dataFetched.done) {
    //   setDataFromDB();
    // }
    if (dataFetched.done) {
      setDataFromDB();
    }else {
      setState(() {
        //clearComments&Reply
        _comments.clear();
        _replies.clear();
        print("Clear Comments and Replys");
      });
    }
  }

  Future<void> insertComment() async {
    var response = await ApiCalls.addComment(
      commentedBy: AppConstants.myId,
      text: key.currentState!.controller!.markupText,
      eventID: widget.postId,
      type: 'timeline',
      imagePath: _imagePath,
      commentId: commentId,
    );
    print("InsertComment=${response}");
    if (response is ErrorEntity) {
      print(response.message);
    } else {
      InsertCommentEntity commentEntity = InsertCommentEntity().fromJson(response);
      if (commentEntity.success == 1) {
        setState(() {
          count++;
        });
        DBComment comment = DBComment(
          id: commentEntity.result!.commentModel!.id,
          postId: commentEntity.result!.commentModel!.postId,
          commentedBy: commentEntity.result!.commentModel!.commentedBy,
          firstName: commentEntity.result!.commentModel!.firstName,
          type: 'timeline',
          lastName: commentEntity.result!.commentModel!.lastName,
          comment: commentEntity.result!.commentModel!.text,
          createdDate: commentEntity.result!.commentModel!.createdDate,
          userImage: commentEntity.result!.commentModel!.userImage,
          commentImage: commentEntity.result!.commentModel!.commentImage,
          imageType: commentEntity.result!.commentModel!.commentImageType,
          isLike: '0',
          likeCount: '0',
          reaction: '',
        );
        database.insertComment(comment);
        setState(() {
          _imagePath = null;
          _imageFile = null;
        });
      }
    }
  }

  Future<void> insertReply(replyId) async {
    if (key.currentState != null && key.currentState!.controller != null) {
      var response = await ApiCalls.addReply(
        text: key.currentState!.controller!.markupText ?? '',
        commentId: commentId,
        type: 'timeline',
        imagePath: _imagePath,
        replyId: replyId,
      );
      // Rest of the code...
      if (response is ErrorEntity) {
        print("Erroe= ${response.message}");
      } else {
        print("reply= ${response}");
        ReplyEntity commentEntity = ReplyEntity.fromJson(jsonEncode(response));
        if (commentEntity.success == 1) {
          DBCommentReplie comment = DBCommentReplie(
            id: commentEntity.result?.commentModel?.id,
            commentId: commentEntity.result?.commentModel?.commentId,
            commentedBy: commentEntity.result?.commentModel?.commentedBy,
            firstName: commentEntity.result?.commentModel?.firstName,
            type: 'timeline',
            lastName: commentEntity.result?.commentModel?.lastName,
            comment: commentEntity.result?.commentModel?.text,
            createdDate: commentEntity.result?.commentModel?.createdDate,
            userImage: commentEntity.result?.commentModel?.userImage,
            commentImage: commentEntity.result?.commentModel?.commentImage,
            imageType: commentEntity.result?.commentModel?.commentImageType,
            likeCount: '0',
            isLike: '0',
            reaction: '',
          );
          getComments();
          database.insertCommentReply(comment);
          setState(() {
            updateComment = false;
            replying = false;
            _imagePath = null;
            _imageFile = null;
          });
          setState(() {});
        }
      }
    }


    //old
    // var response = await ApiCalls.addReply(
    //   text: key.currentState!.controller!.markupText,
    //   commentId: commentId,
    //   type: 'timeline',
    //   imagePath: _imagePath,
    //   replyId: replyId,
    // );
    // print("reply= ${response}");
    // if (response is ErrorEntity) {
    //   print(response.message);
    // } else {
    //   ReplyEntity commentEntity = ReplyEntity.fromJson(jsonEncode(response));
    //   if (commentEntity.success == 1) {
    //     DBCommentReplie comment = DBCommentReplie(
    //       id: commentEntity.result!.commentModel!.id,
    //       commentId: commentEntity.result!.commentModel!.commentId,
    //       commentedBy: commentEntity.result!.commentModel!.commentedBy,
    //       firstName: commentEntity.result!.commentModel!.firstName,
    //       type: 'timeline',
    //       lastName: commentEntity.result!.commentModel!.lastName,
    //       comment: commentEntity.result!.commentModel!.text,
    //       createdDate: commentEntity.result!.commentModel!.createdDate,
    //       userImage: commentEntity.result!.commentModel!.userImage,
    //       commentImage: commentEntity.result!.commentModel!.commentImage,
    //       imageType: commentEntity.result!.commentModel!.commentImageType,
    //       likeCount: '0',
    //       isLike: '0',
    //       reaction: '',
    //     );
    //     database.insertCommentReply(comment);
    //     setState(() {
    //       // updateComment = true;
    //       // replying = true;
    //       _imagePath = null;
    //       _imageFile = null;
    //     });
    //     // setState(() {});
    //   }
    // }
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

  Future<void> setDataFromDB() async {
    setState(() {
      _comments = [];
      _replies = [];
    });
    _comments = await database.getEventComments('timeline', widget.postId);
    //_replies = await database.getAllReplies();
    for (var element in _comments) {
      List<DBCommentReplie> _reply =
      await database.getCommentReplies(element.id ?? '');
      if (_reply.isNotEmpty) {
        for (var element2 in _reply) {
          _replies.add(element2);
        }
      }
    }
  }

  Future<void> deleteTimeLineComment(String commentId, String replyId) async {
    var response = await ApiCalls.deleteComment(
      commentId: commentId,
      replyId: replyId,
    );
    if (response is ErrorEntity) {
      print(response.message);
    } else {
      DeletePostEntity deleteCommentEntity =
      DeletePostEntity.fromJson(jsonEncode(response));
      if (deleteCommentEntity.success == 1) {
        if (replyId != "") {
          database.deleteCommentReply(replyId);
          setState(() {
            _replies.removeWhere((element) => element.id == replyId);
          });
          await Fluttertoast.showToast(msg: 'Reply deleted successfully');
        } else {
          database.deleteSingleComment(commentId);
          setState(() {
            _comments.removeWhere((element) => element.id == commentId);
          });
          await Fluttertoast.showToast(msg: 'Comment deleted successfully');
        }
      }
    }
  }

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body?.text).documentElement!.text;

    return parsedString;
  }

}
