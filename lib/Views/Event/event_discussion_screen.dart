import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iobm/Widgets/widget_styles.dart';
import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/data_fetched.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/api_helper.dart';
import 'package:iobm/networkcalls/response_models/insert_comment_entity.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/app_utils.dart';

class EventCommentScreen extends StatefulWidget {
  final String eventId;
  const EventCommentScreen({Key? key, required this.eventId}) : super(key: key);

  @override
  _EventCommentScreenState createState() => _EventCommentScreenState();
}

class _EventCommentScreenState extends State<EventCommentScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController commentController = TextEditingController();
  late List<DBComment> _comments;
  bool dataFetched = false;

  @override
  void initState() {
    setDataFromDB();
    Future.delayed(const Duration(milliseconds: 100), () {
      getComments();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return dataFetched
        ? discussion()
        : const Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget discussion() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _comments.length,
            controller: _scrollController,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColor.greyshade300,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
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
                            backgroundImage:
                                const AssetImage(AppImages.profile),
                            radius: 25.r,
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
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: AppColor.greyshade200,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '${_comments[index].firstName}',
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(13),
                                            color: AppColor.greyshade800,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      AppUtils().commentString(
                                          _comments[index].comment ?? ''),
                                      style: TextStyle(
                                        color: AppColor.greyshade800,
                                        fontSize: ScreenUtil().setSp(13),
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '${AppUtils().calculateFormatDifference(_comments[index].createdDate ?? '')}',
                                style: TextStyle(
                                  color: AppColor.greyshade600,
                                  fontSize: ScreenUtil().setSp(11),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        buildInput(),
      ],
    );
  }

  Widget buildInput() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.greyshade300, width: 0.5),
        color: AppColor.white,
      ),
      child: Row(
        children: <Widget>[
          // Edit text
          Flexible(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              cursorHeight: 22.h,
              controller: commentController,
              decoration: const InputDecoration.collapsed(
                hintText: 'Add Comment',
                hintStyle: TextStyle(
                    // fontFamily: 'Nunito'
                    ),
              ),
            ),
          ),
          IconButton(
            onPressed: () async {
              await insertComment();
              commentController.clear();
              FocusScope.of(context).unfocus();
              _comments = [];
              _comments =
                  await database.getEventComments('event', widget.eventId);
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 300),
              );
            },
            icon:  Icon(
              Icons.send,
              color: AppColor.primaryColor,
            ),
            padding: EdgeInsets.zero,
          )
        ],
      ),
    );
  }

  Future<void> insertComment() async {
    var response = await ApiCalls.addComment(
      commentedBy: AppConstants.myId,
      text: commentController.text,
      eventID: widget.eventId,
      type: 'event',
    );
    if (response is ErrorEntity) {
    } else {
      InsertCommentEntity commentEntity =
          InsertCommentEntity().fromJson(response);
      if (commentEntity.success == 1) {
        DBComment comment = DBComment(
          id: commentEntity.result!.commentModel!.id,
          postId: commentEntity.result!.commentModel!.postId,
          commentedBy: commentEntity.result!.commentModel!.commentedBy,
          firstName: commentEntity.result!.commentModel!.firstName,
          lastName: commentEntity.result!.commentModel!.lastName,
          comment: commentEntity.result!.commentModel!.text,
          createdDate: commentEntity.result!.commentModel!.createdDate,
          userImage: commentEntity.result!.commentModel!.userImage,
          type: 'event',
        );
        await database.insertComment(comment);
      }
    }
  }

  Future<void> setDataFromDB() async {
    _comments = await database.getEventComments('event', widget.eventId);
    setState(() {
      dataFetched = true;
    });
  }

  Future<void> getComments() async {
    setDataFromDB();
    DataFetched dataFetched =
        await ApiHelper.loadEventComments(widget.eventId, 'event');
    if (dataFetched.done) {
      setDataFromDB();
    }
  }
}
