import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_images.dart';

import '../../models/error_entity.dart';
import '../../networkcalls/api_calls.dart';

import '../../networkcalls/response_models/post_who_reacted_model.dart';

class ReactionsDetail extends StatefulWidget {
  final String postId;
  final String totalCount;
  final String commentId;
  final String replyId;
  const ReactionsDetail({
    Key? key,
    required this.postId,
    required this.totalCount,
    required this.commentId,
    required this.replyId,
  }) : super(key: key);

  @override
  _ReactionsDetailState createState() => _ReactionsDetailState();
}

class _ReactionsDetailState extends State<ReactionsDetail> {
  late List<Datum> reactList;
  late List _list;
  Future? fetched;

  @override
  void initState() {
    reactList = [];
    _list = [];
    fetched = reactionDetailCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(_list);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          shape: Border(
            bottom: BorderSide(color: AppColor.secAppBar, width: 3.w),
          ),
          title: Text(
            'People who reacted',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(16),
            ),
          ),
        ),
        body: FutureBuilder(
          future: fetched,
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
    );
  }

  Widget _bodyColumn() {
    return DefaultTabController(
      length: _list.length + 1,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColor.black26),
              ),
            ),
            child: TabBar(
              automaticIndicatorColorAdjustment: true,
              isScrollable: true,
              labelPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Text(
                  'All ${reactList.length}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: ScreenUtil().setSp(14),
                  ),
                ),
                if (_list.contains('Like'))
                  Image.asset(
                    AppImages.likeIcon,
                    height: 22,
                    width: 22,
                  ),
                if (_list.contains('Love'))
                  Image.asset(
                    AppImages.heartIcon,
                    height: 22,
                    width: 22,
                  ),
                if (_list.contains('HaHa'))
                  Image.asset(
                    AppImages.hahaIcon,
                    height: 22,
                    width: 22,
                  ),
                if (_list.contains('Wow'))
                  Image.asset(
                    AppImages.wowIcon,
                    height: 22,
                    width: 22,
                  ),
                if (_list.contains('Sad'))
                  Image.asset(
                    AppImages.sadIcon,
                    height: 22,
                    width: 22,
                  ),
                if (_list.contains('Angry'))
                  Image.asset(
                    AppImages.angryIcon,
                    height: 22,
                    width: 22,
                  ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                _allLike(),
                if (_list.contains('Like')) _like(),
                if (_list.contains('Love')) _heart(),
                if (_list.contains('HaHa')) _haha(),
                if (_list.contains('Wow')) _wow(),
                if (_list.contains('Sad')) _sad(),
                if (_list.contains('Angry')) _angry(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _allLike() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: reactList.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 40.w,
            child: ListTile(
              leading: Stack(
                children: [
                  SizedBox(
                    height: 40.w,
                    width: 40.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(300),
                      child: CachedNetworkImage(
                        imageUrl: reactList[i].image ?? '',
                        errorWidget: (context, url, error) => const Image(
                          image: AssetImage(AppImages.profile),
                        ),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                            strokeWidth: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                      reactList[i].dataRaction == 'Wow'
                          ? AppImages.wowIcon
                          : reactList[i].dataRaction == 'Angry'
                              ? AppImages.angryIcon
                              : reactList[i].dataRaction == 'HaHa'
                                  ? AppImages.hahaIcon
                                  : reactList[i].dataRaction == 'Sad'
                                      ? AppImages.sadIcon
                                      : reactList[i].dataRaction == 'Love'
                                          ? AppImages.heartIcon
                                          : AppImages.likeIcon,
                      height: 15.w,
                      width: 15.w,
                    ),
                  ),
                ],
              ),
              title: Text(
                reactList[i].firstName ?? '',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _like() {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: reactList.length,
        itemBuilder: (context, i) {
          if (reactList[i].dataRaction == 'Like') {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 40.w,
                child: ListTile(
                  leading: Stack(
                    children: [
                      SizedBox(
                        height: 40.w,
                        width: 40.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(300),
                          child: CachedNetworkImage(
                            imageUrl: reactList[i].image ?? '',
                            errorWidget: (context, url, error) => const Image(
                              image: AssetImage(AppImages.profile),
                            ),
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                                strokeWidth: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Image.asset(
                          reactList[i].dataRaction == 'Wow'
                              ? AppImages.wowIcon
                              : reactList[i].dataRaction == 'Angry'
                                  ? AppImages.angryIcon
                                  : reactList[i].dataRaction == 'HaHa'
                                      ? AppImages.hahaIcon
                                      : reactList[i].dataRaction == 'Sad'
                                          ? AppImages.sadIcon
                                          : reactList[i].dataRaction == 'Love'
                                              ? AppImages.heartIcon
                                              : AppImages.likeIcon,
                          height: 15.w,
                          width: 15.w,
                        ),
                      ),
                    ],
                  ),
                  title: Text(
                    reactList[i].firstName ?? '',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        });
  }

  Widget _heart() {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: reactList.length,
        itemBuilder: (context, i) {
          if (reactList[i].dataRaction == 'Love') {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 40.w,
                child: ListTile(
                  leading: Stack(
                    children: [
                      SizedBox(
                        height: 40.w,
                        width: 40.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(300),
                          child: CachedNetworkImage(
                            imageUrl: reactList[i].image ?? '',
                            errorWidget: (context, url, error) => const Image(
                              image: AssetImage(AppImages.profile),
                            ),
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                                strokeWidth: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Image.asset(
                          reactList[i].dataRaction == 'Wow'
                              ? AppImages.wowIcon
                              : reactList[i].dataRaction == 'Angry'
                                  ? AppImages.angryIcon
                                  : reactList[i].dataRaction == 'HaHa'
                                      ? AppImages.hahaIcon
                                      : reactList[i].dataRaction == 'Sad'
                                          ? AppImages.sadIcon
                                          : reactList[i].dataRaction == 'Love'
                                              ? AppImages.heartIcon
                                              : AppImages.likeIcon,
                          height: 15.w,
                          width: 15.w,
                        ),
                      ),
                    ],
                  ),
                  title: Text(
                    reactList[i].firstName ?? '',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        });
  }

  Widget _wow() {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: reactList.length,
        itemBuilder: (context, i) {
          if (reactList[i].dataRaction == 'Wow') {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 40.w,
                child: ListTile(
                  leading: Stack(
                    children: [
                      SizedBox(
                        height: 40.w,
                        width: 40.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(300),
                          child: CachedNetworkImage(
                            imageUrl: reactList[i].image ?? '',
                            errorWidget: (context, url, error) => const Image(
                              image: AssetImage(AppImages.profile),
                            ),
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                                strokeWidth: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Image.asset(
                          reactList[i].dataRaction == 'Wow'
                              ? AppImages.wowIcon
                              : reactList[i].dataRaction == 'Angry'
                                  ? AppImages.angryIcon
                                  : reactList[i].dataRaction == 'HaHa'
                                      ? AppImages.hahaIcon
                                      : reactList[i].dataRaction == 'Sad'
                                          ? AppImages.sadIcon
                                          : reactList[i].dataRaction == 'Love'
                                              ? AppImages.heartIcon
                                              : AppImages.likeIcon,
                          height: 15.w,
                          width: 15.w,
                        ),
                      ),
                    ],
                  ),
                  title: Text(
                    reactList[i].firstName ?? '',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        });
  }

  Widget _sad() {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: reactList.length,
        itemBuilder: (context, i) {
          if (reactList[i].dataRaction == 'Sad') {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 40.w,
                child: ListTile(
                  leading: Stack(
                    children: [
                      SizedBox(
                        height: 40.w,
                        width: 40.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(300),
                          child: CachedNetworkImage(
                            imageUrl: reactList[i].image ?? '',
                            errorWidget: (context, url, error) => const Image(
                              image: AssetImage(AppImages.profile),
                            ),
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                                strokeWidth: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Image.asset(
                          reactList[i].dataRaction == 'Wow'
                              ? AppImages.wowIcon
                              : reactList[i].dataRaction == 'Angry'
                                  ? AppImages.angryIcon
                                  : reactList[i].dataRaction == 'HaHa'
                                      ? AppImages.hahaIcon
                                      : reactList[i].dataRaction == 'Sad'
                                          ? AppImages.sadIcon
                                          : reactList[i].dataRaction == 'Love'
                                              ? AppImages.heartIcon
                                              : AppImages.likeIcon,
                          height: 15.w,
                          width: 15.w,
                        ),
                      ),
                    ],
                  ),
                  title: Text(
                    reactList[i].firstName ?? '',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        });
  }

  Widget _haha() {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: reactList.length,
        itemBuilder: (context, i) {
          if (reactList[i].dataRaction == 'HaHa') {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 40.w,
                child: ListTile(
                  leading: Stack(
                    children: [
                      SizedBox(
                        height: 40.w,
                        width: 40.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(300),
                          child: CachedNetworkImage(
                            imageUrl: reactList[i].image ?? '',
                            errorWidget: (context, url, error) => const Image(
                              image: AssetImage(AppImages.profile),
                            ),
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                                strokeWidth: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Image.asset(
                          reactList[i].dataRaction == 'Wow'
                              ? AppImages.wowIcon
                              : reactList[i].dataRaction == 'Angry'
                                  ? AppImages.angryIcon
                                  : reactList[i].dataRaction == 'HaHa'
                                      ? AppImages.hahaIcon
                                      : reactList[i].dataRaction == 'Sad'
                                          ? AppImages.sadIcon
                                          : reactList[i].dataRaction == 'Love'
                                              ? AppImages.heartIcon
                                              : AppImages.likeIcon,
                          height: 15.w,
                          width: 15.w,
                        ),
                      ),
                    ],
                  ),
                  title: Text(
                    reactList[i].firstName ?? '',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        });
  }

  Widget _angry() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: reactList.length,
      itemBuilder: (context, i) {
        if (reactList[i].dataRaction == 'Angry') {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 45,
              child: ListTile(
                leading: Stack(
                  children: [
                    SizedBox(
                      height: 45,
                      width: 45,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(300),
                          child: CachedNetworkImage(
                            imageUrl: reactList[i].image ?? '',
                            errorWidget: (context, url, error) => const Image(
                              image: AssetImage(AppImages.profile),
                            ),
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                                strokeWidth: 1.0,
                              ),
                            ),
                          ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Image.asset(
                          AppImages.angryIcon,
                          height: 15,
                          width: 15,
                        )),
                  ],
                ),
                title: Text(reactList[i].firstName ?? ''),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Future<void> reactionDetailCall() async {
    var response = await ApiCalls.getReactionDetails(
      postId: widget.postId,
      commentId: widget.commentId,
      replyId: widget.replyId,
    );
    if (response is ErrorEntity) {
      print(response.message);
    } else {
      PostWhoReactModel postWhoReactModel =
          PostWhoReactModel.fromJson(jsonEncode(response));

      if (postWhoReactModel.success == 1) {
        for (var element in postWhoReactModel.data!) {
          reactList.add(
            Datum(
              id: element.id,
              userId: element.userId,
              postId: element.postId,
              email: element.email,
              dataRaction: element.dataRaction,
              firstName: element.firstName,
              image: element.image,
            ),
          );
        }
        for (var element in reactList) {
          _list.add(element.dataRaction);
          _list = _list.toSet().toList();
        }
      }
    }
  }
}
