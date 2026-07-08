import 'dart:convert';

import 'dart:io';
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:iobm/Views/Event/event_tabs.dart';
import 'package:iobm/Views/buy_and_sell_tle/product_detail_screen.dart';

import 'package:iobm/Views/more/profile_screen.dart';

import 'package:iobm/Views/news_feeds/create_post_screen.dart';
import 'package:iobm/Views/news_feeds/stories/create_story.dart';
import 'package:iobm/Views/news_feeds/full_page_newsfedd_view.dart';
import 'package:iobm/Views/news_feeds/insert_comment.dart';
import 'package:iobm/Views/news_feeds/stories/video_story.dart';
import 'package:iobm/Views/news_feeds/stories/view_story.dart';
import 'package:iobm/Views/news_feeds/video_player_view.dart';
import 'package:iobm/Views/news_feeds/youtube_full_screen.dart';
import 'package:iobm/Widgets/app_bar.dart';
import 'package:iobm/Widgets/custom_widgets.dart';

import 'package:iobm/controllers/profile_controller.dart';
import 'package:iobm/helper_classes/ui_helper.dart';
import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/data_fetched.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:iobm/models/timeline_posts_response.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/api_helper.dart';
import 'package:iobm/networkcalls/response_models/add_to_favourite_entity.dart';
import 'package:iobm/networkcalls/response_models/adds_entity.dart';
import 'package:iobm/networkcalls/response_models/delete_post_entity.dart';
import 'package:iobm/networkcalls/response_models/internal_share_entity.dart';
import 'package:iobm/networkcalls/response_models/like_post_entity.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:iobm/networkcalls/response_models/report_entity.dart';
import 'package:iobm/networkcalls/response_models/stories_entity.dart';
import 'package:iobm/networkcalls/response_models/youtube_live_entity.dart';

import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/app_utils.dart';
import 'package:iobm/utils/strings.dart';
import 'package:readmore/readmore.dart';
import 'package:share_plus/share_plus.dart';

import '../../utils/text_styles.dart';

class AlumniFeed extends StatefulWidget {
  const AlumniFeed({Key? key}) : super(key: key);

  @override
  _AlumniFeedState createState() => _AlumniFeedState();
}

class _AlumniFeedState extends State<AlumniFeed> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _contentController = TextEditingController();
  final ProfileController profileController = Get.put(ProfileController());
  GlobalKey<FormState> fKey = GlobalKey<FormState>();

  late List<DBTimeLinePost> _timeLinePosts;
  late List<DBPostImage> _postImages;
  late List<DBPostTag> _postTags;
  late List<YoutubeModel> _youtube;
  late List<DbNewStorie> _storiesList;

  late List<Timeline> _postsTimeLine;
  late List<DBReportType> _reportTypes;
  bool click = false;
  int? currentPage;
  bool wait = false;
  bool dataFetched = false;
  var _storiesModelList;
  int commentCount = 0;
  bool storyFetch = false;
  List<String> storyImageList = [];
  late List<DBStorie> _storiesByList;


  List<Reaction<String>> reactions = [
    Reaction(icon: _emojis(AppImages.likeIcon), value: 'Like'),
    Reaction(icon: _emojis(AppImages.heartIcon), value: 'Love'),
    Reaction(icon: _emojis(AppImages.hahaIcon), value: 'HaHa'),
    Reaction(icon: _emojis(AppImages.wowIcon), value: 'Wow'),
    Reaction(icon: _emojis(AppImages.sadIcon), value: 'Sad'),
    Reaction(icon: _emojis(AppImages.angryIcon), value: 'Angry'),
  ];

  @override
  void initState() {
    _timeLinePosts = [];
    _postImages = [];
    _youtube = [];
    _postTags = [];
    _postsTimeLine = [];
    _storiesList = [];
    _storiesByList = [];
    profileController.updateFirebaseCount();
    _scrollController.addListener(_scrollListener);

    if (AppConstants.appName == "TLE") {
      getPopupBanners();
    } else {
      getYoutubeLive();
    }
    setDataFromDB();
    Future.delayed(const Duration(milliseconds: 100), () {
      loadTimeLinePosts();
      getStories();
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  //endregion

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        appBar: MyAppBar(
          title: Text(
            Strings.alumnifeed,
            style: CustomTextStyles.text16SemiBoldW600,
          ),
          context: context,
        ),
        body: dataFetched
            ? _bodyContainer()
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Widget _bodyContainer() {
    return Column(

      children: [
        Expanded(
          child: RefreshIndicator(
            backgroundColor: AppColor.white,
            color: AppColor.primaryColor,
            onRefresh: () {
              getStories();
              return loadTimeLinePosts();
            },
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height:
                    10
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text('Stories',
                      style: CustomTextStyles.text14SemiBoldW600.copyWith(
                        fontSize: 18
                      ),
                    ),
                  ),
                  _stories(),
                  //region Row Image and share thoughts
                  SizedBox(
                    height: 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text('Feeds',
                      style: CustomTextStyles.text14SemiBoldW600.copyWith(
                          fontSize: 18
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          // padding: const EdgeInsets.only(
                          //     top: 10.0, bottom: 10.0,),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Color(0xFFE5E6E6),
                            //     blurRadius: 2.0,
                            //     spreadRadius: 0.0,
                            //     offset: Offset(2.0, 2.0), // shadow direction: bottom right
                            //   )
                            // ],
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const CreatePost());
                                },
                                child: Container(
                                  // height: 35,
                                  width: MediaQuery.of(context).size.width*0.94 ,
                                  decoration: BoxDecoration(
                                    color: Color(0xffDFEBFB),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: AppColor.SYT,
                                        width: 0.1
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFFB8C1D2),
                                        // color: Colors.blue.shade50,
                                        blurRadius: 8.0,
                                        spreadRadius: 2.0,
                                        offset: Offset(1.5, 3.0), // shadow direction: bottom right
                                      )
                                    ],

                                  ),

                                  padding: const EdgeInsets.only(left: 17.0,top: 5,bottom: 5),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: AppColor.white,
                                        radius: 20.r,
                                        backgroundImage: AssetImage('assets/images/thinking.png'),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Share your thoughts',
                                              textAlign: TextAlign.center,
                                              style: CustomTextStyles.text12SemiBoldW600.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.black),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Connect with your community... ',
                                              textAlign: TextAlign.center,
                                              style: CustomTextStyles.text12RegularW400.copyWith(color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // _youtubePlayer(),

                  _youtube.isNotEmpty
                      ? GestureDetector(
                          onTap: () {
                            Get.to(() => YoutubeFullScreenLive(
                                  videoId: _youtube.first.youtubeUrl,
                                ));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15),
                            decoration:
                                const BoxDecoration(color: AppColor.liveColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      AppImages.liveIcon,
                                      height: 50.w,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Image(
                                      image: const AssetImage(
                                        AppImages.liveSession,
                                      ),
                                      height: 80.w,
                                    )
                                  ],
                                ),
                                SvgPicture.asset(
                                  AppImages.liveIllustration,
                                  height: 120.w,
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox(),

                  _builder(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _builder() {
    return Container(
      color: Colors.transparent,
      margin: const EdgeInsets.only(top: 10.0),
      child: ListView.builder(
        //  controller: _scrollController,
          itemCount: _postsTimeLine.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.white,
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0,left: 15,right: 15),
              child: Column(
                children: [
                  //region Row User name, time, image
                  Container(
                    decoration: BoxDecoration(
                      // color: AppColor.primaryColor
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              ProfileScreen(
                                userID: _postsTimeLine[index].createdBy,
                              ),
                            );
                          },
                          child: CircleAvatar(
                            child: _postsTimeLine[index].userImage == ''
                                ? Image(
                              image: const AssetImage(
                                  "assets/images/profile.png"),
                              width: 50.w,
                              height: 50.w,
                            )
                                :  CachedNetworkImage(
                              imageUrl:
                              _postsTimeLine[index].userImage ?? '',
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                    width: 50.w,
                                    height: 50.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      //   color: Colors.white,
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                  Center(
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                          value: downloadProgress.progress),
                                    ),
                                  ),
                              errorWidget: (context, url, error) =>
                                  CircleAvatar(
                                    //profile image
                                    backgroundColor: Colors.white,
                                    backgroundImage: const AssetImage(
                                      "assets/images/profile.png",
                                    ),
                                    radius: 20.r,
                                  ),
                            ),
                            radius: 20.r,
                            backgroundColor: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                spacing: 1,

                                direction: Axis.horizontal,

                                alignment: WrapAlignment.start,

                                runAlignment: WrapAlignment.start,
                                runSpacing: 0.0,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                //  textDirection,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.hardEdge,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        ProfileScreen(
                                          userID:
                                          _postsTimeLine[index].createdBy,
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 200.w,
                                      color: Colors.transparent,
                                      child: Text(
                                        '${_postsTimeLine[index].firstName} ${_postsTimeLine[index].lastName}',
                                        maxLines: 2,
                                        style: CustomTextStyles.text14SemiBoldW600.copyWith(overflow: TextOverflow.ellipsis,),
                                      ),
                                    ),
                                  ),
                                  if (_postsTimeLine[index].feelingName != "" ||
                                      _postsTimeLine[index]
                                          .tagsDetails!
                                          .isNotEmpty ||
                                      _postsTimeLine[index].checkinLocation !=
                                          "")
                                    Text(
                                      'is ',
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(13),
                                      ),
                                    ),
                                  _postsTimeLine[index].feelingName != ""
                                      ? Wrap(
                                    children: [
                                      CachedNetworkImage(
                                          height: 16.w,
                                          width: 16.w,
                                          imageUrl: _postsTimeLine[index]
                                              .feelingIcon ??
                                              '',
                                        errorWidget: (context, url, error) => const Image(
                                          image: AssetImage(
                                            AppImages.noImage,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        ' Feeling ',
                                        style: TextStyle(
                                          fontSize:
                                          ScreenUtil().setSp(13),
                                        ),
                                      ),
                                      Text(
                                        '${_postsTimeLine[index].feelingName}',
                                        style: TextStyle(
                                          fontSize:
                                          ScreenUtil().setSp(13),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  )
                                      : const SizedBox(),
                                  _postsTimeLine[index].tagsDetails!.isNotEmpty
                                      ? Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'with ',
                                        style: TextStyle(
                                          fontSize:
                                          ScreenUtil().setSp(13),
                                          color: Colors.black,
                                        ),
                                      ),
                                      _postsTimeLine[index]
                                          .tagsDetails!
                                          .length >
                                          1
                                          ? GestureDetector(
                                        onTap: () {
                                          Get.to(ProfileScreen(
                                            userID: _postsTimeLine[
                                            index]
                                                .tagsDetails![0]
                                                .userId,
                                          ));
                                        },
                                        child: Text(
                                          '${_postsTimeLine[index].tagsDetails![0].firstName} & ${_postsTimeLine[index].tagsDetails!.length - 1} more',
                                          style: TextStyle(
                                            fontSize: ScreenUtil()
                                                .setSp(13),
                                            fontWeight:
                                            FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                          : GestureDetector(
                                        onTap: () {
                                          Get.to(ProfileScreen(
                                            userID: _postsTimeLine[
                                            index]
                                                .tagsDetails![0]
                                                .userId,
                                          ));
                                        },
                                        child: Text(
                                          '${_postsTimeLine[index].tagsDetails![0].firstName} ',
                                          style: TextStyle(
                                            fontSize: ScreenUtil()
                                                .setSp(13),
                                            fontWeight:
                                            FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                      : const SizedBox(),
                                  _postsTimeLine[index].checkinLocation != ""
                                      ? Wrap(
                                    children: [
                                      Text(
                                        'in ',
                                        style: TextStyle(
                                          fontSize:
                                          ScreenUtil().setSp(13),
                                        ),
                                      ),
                                      Text(
                                        '${_postsTimeLine[index].checkinLocation}',
                                        style: TextStyle(
                                            fontSize:
                                            ScreenUtil().setSp(13),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                      : const SizedBox(),
                                ],
                              ),
                              const SizedBox(
                                height: 1,
                              ),
                              Text(
                                  calculateDifference(_postsTimeLine[index].createdAt!),
                                  style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.black54,)
                              )
                            ],
                          ),
                        ),
                        PopupMenuButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r)
                          ),
                          // constraints:  _postsTimeLine[index].createdBy == AppConstants.myId ? BoxConstraints.expand(width: 115.w, height: 35.h) : BoxConstraints.expand(width: 115.w, height: 90.h),
                          onSelected: (result) async {
                            if (result == 0) {
                              deleteTimeLinePost(
                                _postsTimeLine[index].id ?? '',
                              );
                            } else if (result == 1) {
                              await showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return _bodyColumn(
                                        _postsTimeLine[index].id);
                                  });
                              setState(() {
                                click = false;
                              });
                              _contentController.clear();
                            } else if(result == 2){
                              print("Click On HidePost");
                            }
                          },
                          itemBuilder: (BuildContext context) {
                            if (_postsTimeLine[index].createdBy == AppConstants.myId) {
                              return [
                                PopupMenuItem(
                                  value: 0,
                                  child: Text('Delete Post', style: CustomTextStyles.text12RegularW400,),
                                )
                              ];
                            } else {
                              return [
                                PopupMenuItem(
                                  value: 1,
                                  child: Text('Report Post', style: CustomTextStyles.text12RegularW400,),
                                ),
                                PopupMenuItem(
                                  value: 2,
                                  child: Text('Hide Post', style: CustomTextStyles.text12RegularW400,),
                                ),
                              ];
                            }
                          },
                          color: Colors.white,
                        ),
                      ],
                    ),
                    //
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(10.0),
                    child: ReadMoreText(
                      _postsTimeLine[index].text ?? '',
                      style: CustomTextStyles.text12RegularW400.copyWith(color: Colors.black, wordSpacing: 1,),
                      trimMode: TrimMode.Line,
                      trimLines: 2,
                      colorClickableText: Colors.blue,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      moreStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      lessStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                  _postsTimeLine[index].postImages!.isNotEmpty
                      ? GestureDetector(
                    onTap: () {
                      Get.to(
                            () => FullPostScreen(
                          text: _postsTimeLine[index].text ?? '',
                          postImages: _postsTimeLine[index].postImages!,
                          likes: _postsTimeLine[index].totalLike ?? '',
                          comments:
                          _postsTimeLine[index].totalComments ?? '',
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          height: 200.h,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12)),
                            child: _postsTimeLine[index].postImages!.length == 1
                                ? Stack(
                              fit: StackFit.expand,
                              children: [
                                _postsTimeLine[index].postImages![0].mediaType == "IMAGE"
                                    ? CachedNetworkImage(
                                  imageUrl: _postsTimeLine[index].postImages![0].postMedia ?? '',
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) => const Image(image: AssetImage(AppImages.noImage), fit: BoxFit.cover),
                                )
                                    : VideoPlayerRemote(
                                  url: _postsTimeLine[index].postImages![0].postMedia ?? '',
                                  height: 250.h.toInt(),
                                ),
                                // WhatsApp-style overlay
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.transparent,
                                          Colors.black.withOpacity(0.4),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                                : Stack(
                              fit: StackFit.expand,
                              children: [
                                // Full view first image as background
                                _postsTimeLine[index].postImages![0].mediaType == "IMAGE"
                                    ? CachedNetworkImage(
                                  imageUrl: _postsTimeLine[index].postImages![0].postMedia ?? '',
                                  fit: BoxFit.cover,
                                )
                                    : VideoPlayerRemote(
                                  url: _postsTimeLine[index].postImages![0].postMedia ?? '',
                                  height: 250.h.toInt(),
                                ),
                                // Thumbnails stacked on the right
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  bottom: 10,
                                  child: SizedBox(
                                    width: 80.w,
                                    child: Column(
                                      children: [
                                        // Second image thumbnail
                                        if (_postsTimeLine[index].postImages!.length >= 2)
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                border: Border.all(color: Colors.white, width: 2),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black.withOpacity(0.3),
                                                    blurRadius: 4,
                                                    spreadRadius: 1,
                                                  )
                                                ],
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(6),
                                                child: _postsTimeLine[index].postImages![1].mediaType == "IMAGE"
                                                    ? CachedNetworkImage(
                                                  imageUrl: _postsTimeLine[index].postImages![1].postMedia ?? '',
                                                  fit: BoxFit.cover,
                                                )
                                                    : VideoPlayerRemote(
                                                  url: _postsTimeLine[index].postImages![1].postMedia ?? '',
                                                  height: 110.h.toInt(),
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (_postsTimeLine[index].postImages!.length > 2)
                                          const SizedBox(height: 8),
                                        // Third image thumbnail with overlay
                                        if (_postsTimeLine[index].postImages!.length >= 3)
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                border: Border.all(color: Colors.white, width: 2),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black.withOpacity(0.3),
                                                    blurRadius: 4,
                                                    spreadRadius: 1,
                                                  )
                                                ],
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(6),
                                                child: Stack(
                                                  fit: StackFit.expand,
                                                  children: [
                                                    _postsTimeLine[index].postImages![2].mediaType == "IMAGE"
                                                        ? CachedNetworkImage(
                                                      imageUrl: _postsTimeLine[index].postImages![2].postMedia ?? '',
                                                      fit: BoxFit.cover,
                                                    )
                                                        : VideoPlayerRemote(
                                                      url: _postsTimeLine[index].postImages![2].postMedia ?? '',
                                                      height: 110.h.toInt(),
                                                    ),
                                                    if (_postsTimeLine[index].postImages!.length > 3)
                                                      Container(
                                                        color: Colors.black54,
                                                        child: Center(
                                                          child: Text(
                                                            "+${_postsTimeLine[index].postImages!.length - 2} more",
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 12.sp,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Event/Product badge
                        if (_postsTimeLine[index].postType == "event" || _postsTimeLine[index].postType == "product")
                          Positioned(
                            bottom: 0,
                            left: 10,
                            right: 10,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor.withOpacity(0.8),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  _postsTimeLine[index].postType == "event" ? 'View Event' : 'View Product Details',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )

                      : _postsTimeLine[index].postType == "event"
                      ? GestureDetector(
                    onTap: () {
                      Get.to(
                            () => EventTabs(
                          eventId: _postsTimeLine[index].eventId,
                          title: '',
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding:
                      const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor.withOpacity(0.2),
                      ),
                      child: Center(
                        child: Text(
                          'View Event',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                            color: AppColor.primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  )
                      : _postsTimeLine[index].postType == "product"
                      ? GestureDetector(
                    onTap: () {
                      Get.to(
                            () => ProductDetailScreen(
                          productId: int.parse(
                              _postsTimeLine[index].eventId ??
                                  ''),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor
                            .withOpacity(0.5),
                      ),
                      child: Center(
                        child: Text(
                          'View Product Details',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                            color: AppColor.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  )
                      : const SizedBox(),

                  // const SizedBox(
                  //   height: 7.0,
                  // ),
                  //region Horizontal Lion
                  // Container(
                  //   color: const Color(0xFFa8a8a8),
                  //   height: 0.5,
                  // ),
                  //endregion
                  //region Like, share, comment box
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
                        border: Border.all(color: AppColor.greyshade100)
                      ),
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 8.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // GestureDetector(
                          //   onTap: () {
                          //     _reaction(index);
                          //     // await likeDislikePost(
                          //     //   index,
                          //     //   _postsTimeLine[index].id,
                          //     //   _postsTimeLine[index].isLike == "0"
                          //     //       ? 'like'
                          //     //       : "unlike",
                          //     // );
                          //   },
                          //   child:
                          Row(
                            children: [
                              Row(
                                children: [
                                  _reaction(index),
                                  // Icon(
                                  //   Icons.favorite,
                                  //   size: 27.h,
                                  //   color: _postsTimeLine[index].isLike == "1"
                                  //       ? AppColor.primaryColor
                                  //       : Colors.black26,
                                  // ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    '${_postsTimeLine[index].totalLike}',
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(13),
                                      color: Colors.grey,
                                    ),
                                  ),

                                ],
                              ),
                              // ),
                              SizedBox(width: 20,),
                              GestureDetector(
                                onTap: () async {
                                  int a = await Get.to(
                                        () => InsertComments(
                                        postId: _postsTimeLine[index].id ?? '',
                                        totalLikes:
                                        _postsTimeLine[index].totalLike ?? ''),
                                    transition: Transition.downToUp,
                                    curve: Curves.easeInOut,
                                  );
                                  setState(() {
                                    commentCount = a;
                                  });
                                  increaseCount(index);
                                  // .then((value) => increaseCount(index));
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.chat_bubble_text,
                                      color: AppColor.primaryColor,
                                      size: 22.w,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      '${_postsTimeLine[index].totalComments}',
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(13),
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20,),
                              GestureDetector(
                                onTap: () {
                                  internalShare(_postsTimeLine[index].id);
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.arrowshape_turn_up_right,
                                      color: AppColor.primaryColor,
                                      size: 22.w,
                                    ),
                                    // SvgPicture.asset(
                                    //   CupertinoIcons.arrowshape_turn_up_right,
                                    //   height: 22.w,
                                    //   color: AppColor.primaryColor,
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          GestureDetector(
                            onTap: () {
                              if (Platform.isAndroid) {
                                Share.share(
                                    "${_postsTimeLine[index].firstName} posted in DOW Alumni\nPost Text: ${_postsTimeLine[index].text}\nPosted Date:  ${_postsTimeLine[index].updatedDate}");
                              } else if (Platform.isIOS) {
                                Share.share(
                                    "${_postsTimeLine[index].firstName} posted in DOW Alumni\nPost Text: ${_postsTimeLine[index].text}\nPosted Date:  ${_postsTimeLine[index].updatedDate}");
                              }
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.share_outlined,
                                  color: AppColor.primaryColor,
                                  size: 22.w,
                                ),
                                // const SizedBox(
                                //   width: 5.0,
                                // ),
                                // Text(
                                //   'Share',
                                //   style: TextStyle(
                                //     fontSize: ScreenUtil().setSp(14),
                                //     color: const Color(0xFFa8a8a8),
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //endregion
                  //region Horizontal Lion
                  Container(
                    color: const Color(0xFFa8a8a8),
                    height: 0.5,
                  ),
                  //endregion
                ],
              ),
            );
          }),
    );
  }

  Future<void> loadTimeLinePosts() async {
    setState(() {
      currentPage = 0;
      wait = true;
    });

    DataFetched dataFetched = await ApiHelper.getTimeLinePosts(
        currentPage: currentPage, type: 'main_newsfeed');
    if (dataFetched.done) {
      _timeLinePosts.clear();

      _postsTimeLine.clear();
      setDataFromDB();
      if (mounted) {
        setState(() {
          currentPage = currentPage! + 1;
        });
      }
    }
    if (mounted) {
      setState(() {
        wait = false;
      });
    }
  }

  Future<void> loadMoreData() async {
    setState(() {
      wait = true;
    });

    DataFetched dataFetched = await ApiHelper.getTimeLinePosts(
      currentPage: currentPage,
      type: 'main_newsfeed',
    );
    if (dataFetched.done) {
      _timeLinePosts.clear();

      _postsTimeLine.clear();
      setDataFromDB();
      if (mounted) {
        setState(() {
          currentPage = currentPage! + 1;
        });
      }
    }
    setState(() {
      wait = false;
    });
  }

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      //    message = "reach the bottom";
      loadMoreData();
    }
    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      //  message = "reach the top";
    }
  }

  Future<void> deleteTimeLinePost(String postId) async {
    var response = await ApiCalls.deletePost(
      userId: AppConstants.myId,
      postId: postId,
    );
    if (response is ErrorEntity) {
      print(response.message);
    } else {
      DeletePostEntity deletePostEntity =
          DeletePostEntity.fromJson(jsonEncode(response));
      if (deletePostEntity.success == 1) {
        database.deleteSinglePost(postId);
        setState(() {
          _postsTimeLine.removeWhere((element) => element.id == postId);
        });
        await Fluttertoast.showToast(msg: 'Post deleted successfully');
      }
    }
  }

  Future<void> likeDislikePost(index, postId, status, reaction) async {
    // 1. Save current state for potential rollback
    String? previousTotalLike = _postsTimeLine[index].totalLike;
    String? previousIsLike = _postsTimeLine[index].isLike;
    String? previousReaction = _postsTimeLine[index].reaction;

    // 2. Optimistic Update
    setState(() {
      _postsTimeLine[index].isLike = (status == "like" ? "1" : "0");
      _postsTimeLine[index].reaction = (status == "like" ? reaction : "");

      int currentLikes = int.tryParse(previousTotalLike ?? '0') ?? 0;
      if (status == "like") {
        currentLikes++;
      } else {
        currentLikes = (currentLikes > 0) ? currentLikes - 1 : 0;
      }
      _postsTimeLine[index].totalLike = currentLikes.toString();
    });

    // 3. API Call
    var response = await ApiCalls.likeUnlikePost(
      userId: AppConstants.myId,
      status: status,
      postId: postId,
      reaction: reaction,
      type: "timeline",
    );

    // 4. Handle Result
    if (response is ErrorEntity) {
      // Rollback on network/error
      _rollbackLikeState(
          index, previousTotalLike, previousIsLike, previousReaction);
      Fluttertoast.showToast(
          msg: "Failed to update your like. Please try again.");
      print(response.message);
    } else {
      LikePostEntity likeEntity = LikePostEntity().fromJson(response);
      if (likeEntity.success == 1) {
        // Update local DB
        await database.editPostLikes(
          postId,
          likeEntity.result.likes.toString(),
        );
        await database.editPostLikeStatus(
          postId,
          status == "like" ? "1" : "0",
        );

        // Sync with actual response count if different
        if (mounted) {
          setState(() {
            _postsTimeLine[index].totalLike =
                likeEntity.result.likes.toString();
          });
        }
      } else {
        // Rollback on API failure (e.g. success == 0)
        _rollbackLikeState(
            index, previousTotalLike, previousIsLike, previousReaction);
        Fluttertoast.showToast(
            msg: "Failed to update your like. Please try again.");
      }
    }
  }

  void _rollbackLikeState(
      int index, String? totalLike, String? isLike, String? reaction) {
    if (mounted) {
      setState(() {
        _postsTimeLine[index].totalLike = totalLike;
        _postsTimeLine[index].isLike = isLike;
        _postsTimeLine[index].reaction = reaction;
      });
    }
  }

  void increaseCount(index) {
    int a = int.parse(_postsTimeLine[index].totalComments ?? '') + commentCount;
    setState(
      () {
        _postsTimeLine[index].totalComments = a.toString();
      },
    );
  }

  Future<void> setDataFromDB() async {
    _reportTypes = await database.getAllReportTypes();
    _timeLinePosts = await database.getTimeLinePosts();
    //_storiesList = await database.getAllTimeLineStories();

    for (var element in _timeLinePosts) {
      _postTags = await database.getPostTags(element.id ?? '');
      _postImages = await database.getPostImages(element.id ?? '');

      _postsTimeLine.add(
        Timeline(
          id: element.id,
          isPinned: element.isPinned,
          tagsDetails: _postTags,
          firstName: element.firstName,
          lastName: element.lastName ?? '',
          updatedDate: element.updatedDate,
          createdBy: element.createdBy,
          totalComments: element.totalComments,
          totalLike: element.totalLikes,
          postPrivacyType: element.privacyType,
          text: element.postText,
          gender: element.gender,
          userImage: element.userImage,
          isLike: element.isLike,
          createdAt: element.createdAt,
          postImages: _postImages,
          postType: element.postType,
          eventId: element.eventId,
          feelingName: element.feelingName,
          feelingIcon: element.feelingIcon,
          checkinLocation: element.checkInLocation,
          reaction: element.reaction,
        ),
      );
    }
    if (mounted) {
      setState(() {
        dataFetched = true;
      });
    }
  }

  Future<void> getYoutubeLive() async {
    var response = await ApiCalls.youtubeLive(
      userId: AppConstants.myId,
    );
    if (response is ErrorEntity) {
    } else {
      YoutubeLiveEntity liveEntity =
          YoutubeLiveEntity.fromJson(jsonEncode(response));
      if (liveEntity.success == 1) {
        for (var element in liveEntity.youtubeLive!) {
          _youtube.add(
            YoutubeModel(
              title: element.title,
              youtubeUrl: element.youtubeUrl,
            ),
          );
        }
      }
    }
  }

  /// Popup Adds Banner
  _popupAdds({url}) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetAnimationCurve: Curves.bounceIn,
          alignment: Alignment.center,
          backgroundColor: AppColor.transparent,
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.passthrough,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: url,
                    errorWidget: (context, url, error) => const Image(
                      image: AssetImage(
                        AppImages.noImage,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 7,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                    viewBanner();
                  },
                  child: Container(
                    decoration:  BoxDecoration(
                      color: AppColor.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close,
                      color: AppColor.white,
                      size: 20.h,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> getPopupBanners() async {
    var response = await ApiCalls.getPopupBanners();
    if (response is ErrorEntity) {
    } else {
      AddsEntity addsEntity = AddsEntity.fromJson(jsonEncode(response));
      if (addsEntity.success == 1) {
        if (addsEntity.banners != null) {
          return _popupAdds(
            url: addsEntity.banners!.image,
          );
        }
      }
    }
  }

  Future<void> viewBanner() async {
    var response = await ApiCalls.changeBannerStatus();
    if (response is ErrorEntity) {
    } else {
      AddFavouriteEntity favouriteEntity =
          AddFavouriteEntity.fromJson(jsonEncode(response));
      if (favouriteEntity.success == 1) {}
    }
  }

  Future<void> reportPost({postId, comment, reportType}) async {
    UIHelper.apiCallingAlert(context);
    var response = await ApiCalls.reportContent(
      userId: AppConstants.myId,
      contentId: postId,
      contentType: 'timeline',
      comment: comment,
      reportType: reportType,
    );
    UIHelper.hideApiCallingAlert(context);
    if (response is ErrorEntity) {
      UIHelper.showErrorAlert(context, response.message);
    } else {
      ReportEntity reportEntity = ReportEntity.fromJson(jsonEncode(response));
      if (reportEntity.success == 1) {
        Get.back();
        setState(() {
          _postsTimeLine.removeWhere((element) => element.id == postId);
          click = false;
        });
        _contentController.clear();

        UIHelper.showSuccessAlert(
          context,
          reportEntity.message,
          () {
            Get.back();
          },
        );
      }
    }
  }

  Future<void> internalShare(postId) async {
    var response = await ApiCalls.internalShare(
      userId: AppConstants.myId,
      postId: postId,
    );
    if (response is ErrorEntity) {
    } else {
      InternalShareEntity shareEntity =
          InternalShareEntity().fromJson(response);
      if (shareEntity.success == 1) {
        await Fluttertoast.showToast(msg: shareEntity.message ?? '');
      }
    }
  }

  ///Report
  Widget _bodyColumn(id) {
    return StatefulBuilder(
      builder: (context, setState) {
        return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 10.w,top: 16.h),
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColor.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Why are you reporting this?',
                  style: CustomTextStyles.text14SemiBoldW600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _reportTypes.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              onTap: () {
                                if (_reportTypes[index].id == '5') {
                                  setState(() {
                                    click = true;
                                  });
                                } else {
                                  reportPost(
                                    comment: _reportTypes[index].reportText,
                                    postId: id,
                                    reportType: _reportTypes[index].id,
                                  );
                                }
                              },
                              title: Text(
                                _reportTypes[index].reportText ?? '',
                                style: CustomTextStyles.text12RegularW400,
                              ),
                              trailing: Icon(Icons.arrow_forward,color: Colors.black,),
                            ),
                            Divider(
                              height: 1.h,
                              color: Colors.black26,
                            )
                          ],
                        );
                      },
                    ),
                    click
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Form(
                              key: fKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(15),
                                    ),
                                    controller: _contentController,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      return value!.isEmpty
                                          ? 'Please enter comment'
                                          : null;
                                    },
                                    decoration: InputDecoration(
                                      errorStyle: TextStyle(fontSize: 12.sp),
                                      focusedBorder:  UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColor.primaryColor,
                                        ),
                                      ),
                                      hintStyle: TextStyle(
                                        fontSize: ScreenUtil().setSp(15),
                                      ),
                                      hintText: 'Write Here',
                                      isDense: true,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CustomWidget.myButton(
                                    name: 'Submit',
                                    isBorder: false,
                                    size: Size(50.w, 20.h),
                                    onClicked: () {
                                      if (fKey.currentState!.validate()) {
                                        reportPost(
                                          comment: _contentController.text,
                                          postId: id,
                                          reportType: "5",
                                        );
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ));
      },
    );
  }

  Widget _reaction(index) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ReactionButtonToggle(
        isChecked: _postsTimeLine[index].isLike == "1" ? true : false,
        onReactionChanged: (String? value, bool check) async {
          print(value);
          print(check);
          if (check && value == '') {
            await likeDislikePost(
              index,
              _postsTimeLine[index].id,
              "like",
              'Like',
            );
          } else if (check && value != "") {
            await likeDislikePost(
              index,
              _postsTimeLine[index].id,
              "like",
              value,
            );
          } else if (check == false && value != "") {
            await likeDislikePost(
              index,
              _postsTimeLine[index].id,
              "unlike",
              '',
            );
          } else if (check == false && value == "") {
            await likeDislikePost(
              index,
              _postsTimeLine[index].id,
              "like",
              'Like',
            );
          }
        },
        boxPadding: const EdgeInsets.all(8),
        boxElevation: 5,
        boxPosition: VerticalPosition.bottom,
        reactions: reactions,
        initialReaction: _postsTimeLine[index].reaction == ""
            ? Reaction(
                value: '',
                icon: Icon(
                  Icons.thumb_up_alt_outlined,
                  color: AppColor.grey,
                  size: 22.w,
                ),
              )
            : _postsTimeLine[index].reaction == "Like"
                ? Reaction(
                    value: 'Like',
                    icon: Image.asset(
                      AppImages.likeIcon,
                      height: 22.w,
                      width: 22.w,
                    ),
                  )
                : _postsTimeLine[index].reaction == "Love"
                    ? Reaction(
                        value: 'Love',
                        icon: Image.asset(
                          AppImages.heartIcon,
                          height: 22.w,
                          width: 22.w,
                        ),
                      )
                    : _postsTimeLine[index].reaction == "HaHa"
                        ? Reaction(
                            value: 'HaHa',
                            icon: Image.asset(
                              AppImages.hahaIcon,
                              height: 22.w,
                              width: 22.w,
                            ),
                          )
                        : _postsTimeLine[index].reaction == "Sad"
                            ? Reaction(
                                value: 'Sad',
                                icon: Image.asset(
                                  AppImages.sadIcon,
                                  height: 22.w,
                                  width: 22.w,
                                ),
                              )
                            : _postsTimeLine[index].reaction == "Wow"
                                ? Reaction(
                                    value: 'Wow',
                                    icon: Image.asset(
                                      AppImages.wowIcon,
                                      height: 22.w,
                                      width: 22.w,
                                    ),
                                  )
                                : Reaction(
                                    value: 'Angry',
                                    icon: Image.asset(
                                      AppImages.angryIcon,
                                      height: 22.w,
                                      width: 22.w,
                                    ),
                                  ),
        selectedReaction: _postsTimeLine[index].reaction == ""
            ? Reaction<String>(
                value: '',
                icon: Icon(
                  Icons.thumb_up_alt_outlined,
                  size: 22.w,
                ),
              )
            : _postsTimeLine[index].reaction == "Like"
                ? Reaction<String>(
                    value: 'Like',
                    icon: Image.asset(
                      AppImages.likeIcon,
                      height: 22.w,
                      width: 22.w,
                    ),
                  )
                : _postsTimeLine[index].reaction == "Love"
                    ? Reaction<String>(
                        value: 'Love',
                        icon: Image.asset(
                          AppImages.heartIcon,
                          height: 22.w,
                          width: 22.w,
                        ),
                      )
                    : _postsTimeLine[index].reaction == "HaHa"
                        ? Reaction<String>(
                            value: 'HaHa',
                            icon: Image.asset(
                              AppImages.hahaIcon,
                              height: 22.w,
                              width: 22.w,
                            ),
                          )
                        : _postsTimeLine[index].reaction == "Sad"
                            ? Reaction<String>(
                                value: 'Sad',
                                icon: Image.asset(
                                  AppImages.sadIcon,
                                  height: 22.w,
                                  width: 22.w,
                                ),
                              )
                            : _postsTimeLine[index].reaction == "Wow"
                                ? Reaction<String>(
                                    value: 'Wow',
                                    icon: Image.asset(
                                      AppImages.wowIcon,
                                      height: 22.w,
                                      width: 22.w,
                                    ),
                                  )
                                : Reaction<String>(
                                    value: 'Angry',
                                    icon: Image.asset(
                                      AppImages.angryIcon,
                                      height: 22.w,
                                      width: 22.w,
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

  static Widget _emojis(icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Image.asset(
        icon,
        height: 35.w,
        width: 35.w,
      ),
    );
  }

  Widget _stories() {
    if (!storyFetch) {
      return const CircularProgressIndicator(color: Colors.transparent);
    }

    if (_storiesByList.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal:15,vertical: 5),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              )
            ],
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 50.w,
                    height: 50.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColor.primaryColor, width: 2),
                      color: AppColor.greyshade100,
                    ),
                    child: Icon(Icons.person, color: AppColor.primaryColor, size: 30.w),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.primaryColor,
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 18.w),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12), // Gap thoda manage kiya taake space bache
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'No stories available yet.',
                      style: CustomTextStyles.text14SemiBoldW600,
                      softWrap: false, // Fix: Yeh text ko zabardasti single line me rakhega break nahi hone dega
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Be the first to share your moment!',
                      style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.SYT),
                      // Isko wese hi chor diya taake space kam hone par yeh automatic 2 lines me wrap ho jaye
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8), // Text aur button k darmiyan gap
              GestureDetector(
                onTap: () => Get.to(() => const CreateStory()),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8), // Padding thodi optimize ki
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Post Story',
                        style: CustomTextStyles.text12SemiBoldW600.copyWith(color: Colors.white),
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.add_circle_outline, color: Colors.white, size: 14.w), // Icon size halka sa chota kiya
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return SizedBox(
      height: 105.w,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: _storiesByList.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(right: 15),
              child: GestureDetector(
                onTap: () => Get.to(() => const CreateStory()),
                child: Container(
                  height: 230,
                  width: 90,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(7)
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Stack(
                        children: [
                          Container(
                            width: 50.w,
                            height: 50.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColor.primaryColor, width: 2),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/profile.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.primaryColor,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              child: Icon(Icons.add, color: Colors.white, size: 14.w),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 1),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:5.0),
                        child: Text(
                          'Create Story',
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.text12RegularW400.copyWith(
                            color: AppColor.white,
                            fontWeight: FontWeight.w600

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          int storyIndex = index - 1;
          return Padding(
            padding: const EdgeInsets.only(right: 15,top: 12.5 ),
            child: GestureDetector(
              onTap: () {
                Get.to(
                  () => ViewStory(
                    name: _storiesByList[storyIndex].name ?? '',
                    image: _storiesByList[storyIndex].userImage ?? '',
                    storiesList: List<Story>.from(_storiesModelList[storyIndex]),
                    userId: _storiesByList[storyIndex].addedBy.toString(),
                  ),
                  transition: Transition.downToUp,
                  duration: const Duration(milliseconds: 400),
                );
              },
              child: Column(
                children: [
                  Container(
                    width: 65.w,
                    height: 65.w,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Colors.purple, Colors.orange, AppColor.primaryColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundColor: AppColor.greyshade200,
                        backgroundImage: _storiesByList[storyIndex].userImage == ''
                            ? const AssetImage(AppImages.profile) as ImageProvider
                            : NetworkImage(_storiesByList[storyIndex].userImage!),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 70.w,
                    child: Text(
                      _storiesByList[storyIndex].name ?? '',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.text12RegularW400,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }



  Future<void> getStories() async {
    setState(() {
      storyFetch = false;
    });

    var response = await ApiCalls.getStories();
    if (response is ErrorEntity) {
      // Handle error response
    } else {
      print("Stories Response= ${response.toString()}");
      TimelineStoriesEntity storiesEntity = TimelineStoriesEntity.fromJson(response);

      if (storiesEntity.success == 1) {
        await database.deleteAllTimeLineStories();
        await database.deleteAllStories();

        // Null safety check for storiesEntity.data
        if (storiesEntity.data != null) {
          int storiesLength = storiesEntity.data!.length;
          replyUserDevices!.clear();
          storyImageList.clear();

          // Null safety check for stories in each data
          for (int i = 0; i < storiesLength; i++) {
            if (storiesEntity.data![i].stories != null &&
                storiesEntity.data![i].stories!.isNotEmpty) {
              storyImageList.add(storiesEntity.data![i].stories!.first.storyImage!);
              print("storyImageList= $storyImageList");
            }
          }

          try {
            for (var element in storiesEntity.data!) {
              // Null safety check for devices in each data
              if (element.devices != null) {
                for (var element2 in element.devices!) {
                  if (element2.token != null && element2.token!.isNotEmpty) {
                    replyUserDevices!.add(UserDevices(
                      token: element2.token,
                      status: element2.status,
                    ));
                  }
                }
              }
            }
          } catch (e) {
            print("Error while processing devices: $e");
          }

          var list = [];
          for (int i = 0; i < storiesLength; i++) {
            if (storiesEntity.data![i].stories != null) {
              list.add(storiesEntity.data![i].stories);
            }
          }

          _storiesModelList = list;

          for (var element in storiesEntity.data!) {
            DBStorie dbStorie = DBStorie(
              storyById: element.id,
              name: element.name,
              addedBy: element.addedBy,
              userImage: element.userImage,
            );
            database.insertAllTimeLineStories(dbStorie);
          }

          if (storiesEntity.data!.first.stories != null) {
            for (var element in storiesEntity.data!.first.stories!) {
              DbNewStorie dbNewStorie = DbNewStorie(
                storyId: element.id,
                mediaType: element.mediaType,
                storyImage: element.storyImage,
                storyTime: element.storyTime.toString(),
                updatedDate: element.updatedAt.toString(),
                link: element.link,
              );
              database.insertAllStories(dbNewStorie);
            }
          }

          _storiesByList = await database.getAllTimeLineStories();
          print("_storiesByList= ${_storiesByList.length}");
          _storiesList = await database.getAllStories();
        }
      }
      setState(() {
        storyFetch = true;
      });
    }
  }


  String calculateDifference(String dateTime) {
    String dif;
    DateFormat dft = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime d = dft.parse(dateTime);

    int difference = DateTime.now().difference(d).inSeconds;

    if (difference <= 60) {
      dif = "Now";
    } else if (difference <= 3600) {
      dif = DateTime.now().difference(d).inMinutes.toString();
      if (dif == "1") {
        dif = DateTime.now().difference(d).inMinutes.toString() + " min ago";
      } else {
        dif = DateTime.now().difference(d).inMinutes.toString() + " mins ago";
      }
    } else if (difference <= 86400) {
      dif = DateTime.now().difference(d).inHours.toString();
      if (dif == "1") {
        dif = DateTime.now().difference(d).inHours.toString() + " hour ago";
      } else {
        dif = DateTime.now().difference(d).inHours.toString() + " hours ago";
      }
    } else if (difference <= 2592000) {
      dif = DateTime.now().difference(d).inDays.toString();
      if (dif == "1") {
        dif = DateTime.now().difference(d).inDays.toString() + " day ago";
      } else {
        dif = DateTime.now().difference(d).inDays.toString() + " days ago";
      }
    } else if(difference <= 604800){
      dif = (DateTime.now().difference(d).inDays / 7).toString();
      if (dif == "1") {
        dif = (DateTime.now().difference(d).inDays / 7).toString() + " week ago";
      } else {
        dif = (DateTime.now().difference(d).inDays / 7).toString() + " weeks ago";
      }
    }
    else {
      DateFormat outputFormat = DateFormat("d MMM, yyyy"); // create a new DateFormat object with the desired format
      dif = outputFormat.format(d);
    }
    return dif;
  }

}


