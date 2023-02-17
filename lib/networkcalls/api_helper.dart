import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iobm/Views/login_screen.dart';
import 'package:iobm/helper_classes/ui_helper.dart';
import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/local_db/tables/chapter_details_table.dart';

import 'package:iobm/models/data_fetched.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/response_models/about_entity.dart';
import 'package:iobm/networkcalls/response_models/all_users_entity.dart';
import 'package:iobm/networkcalls/response_models/apply_for_card_model.dart';
import 'package:iobm/networkcalls/response_models/attendies_entity.dart';
import 'package:iobm/networkcalls/response_models/business_spotlight_model.dart';
import 'package:iobm/networkcalls/response_models/c_s_r_entity.dart';
import 'package:iobm/networkcalls/response_models/chapter_details_model.dart';
import 'package:iobm/networkcalls/response_models/comment_entity.dart';
import 'package:iobm/networkcalls/response_models/comments_entity.dart';
import 'package:iobm/networkcalls/response_models/company_hints_entity.dart';
import 'package:iobm/networkcalls/response_models/contact_entity.dart';
import 'package:iobm/networkcalls/response_models/delete_work_orderModel.dart';
import 'package:iobm/networkcalls/response_models/discount_entity.dart';
import 'package:iobm/networkcalls/response_models/event_detail_entity.dart';
import 'package:iobm/networkcalls/response_models/events_entity.dart';
import 'package:iobm/networkcalls/response_models/faq_entity.dart';
import 'package:iobm/networkcalls/response_models/galleries_entity.dart';
import 'package:iobm/networkcalls/response_models/gallery_images_entity.dart';
import 'package:iobm/networkcalls/response_models/jobs_entity.dart';

import 'package:iobm/networkcalls/response_models/notification_entity.dart';
import 'package:iobm/networkcalls/response_models/post_who_reacted_model.dart';
import 'package:iobm/networkcalls/response_models/product_details_model.dart';
import 'package:iobm/networkcalls/response_models/product_entity.dart';

import 'package:iobm/networkcalls/response_models/spotlight_alumini_entity.dart';

import 'package:iobm/networkcalls/response_models/time_line_post_entity_entity.dart';
import 'package:iobm/networkcalls/response_models/tle_feedback_model.dart';
import 'package:iobm/networkcalls/response_models/tle_spotlight_model.dart';
import 'package:iobm/networkcalls/response_models/user_profile_entity.dart';
import 'package:iobm/networkcalls/response_models/work_order_entity.dart';

import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';

import '../models/error_entity.dart';

List<UserDevices>? productUserDevices = [];
List<UserDevices>? serviceUserDevices = [];
List<UserDevices>? replyUserDevices = [];

class ApiHelper {
  static Future<DataFetched> getUserInfo(context, userId) async {
    var response = await ApiCalls.getUserInfo(
      userId: userId,
      myId: AppConstants.myId,
    );
    if (response is ErrorEntity) {
      // UIHelper.showErrorAlert(context, response.message);
    } else {
      UserProfileEntity profileEntity = UserProfileEntity().fromJson(response);
      if (profileEntity.success == 1) {
        // await database.deleteSingleUser(userId);
        // print("Added");
        await database.deleteExperience(int.parse(userId));
        await database.deleteInterest(int.parse(userId));

        await database.deleteEducation(int.parse(userId));

        await database.deleteProduct(int.parse(userId));

        DBAllUser allUser = DBAllUser(
          userId: profileEntity.result!.userId,
          firstName: profileEntity.result!.firstName,
          lastName: profileEntity.result!.lastName,
          description: profileEntity.result!.description,
          designation: profileEntity.result!.designation,
          branchName: profileEntity.result!.branchName,
          organizationName: profileEntity.result!.organizationName,
          email: profileEntity.result!.email,
          currentCityName: profileEntity.result!.currentCityName,
          isMentor: profileEntity.result!.isMentor,
          isVerified: profileEntity.result!.isVerified,
          connectionStatus: profileEntity.result!.connectionStatus,
          image: profileEntity.result!.image,
          sharingLoc: profileEntity.result!.isSharingLoc,
          graduationYear: profileEntity.result!.graduationYear,
          industryName: profileEntity.result!.industryName,
          chatStatus: profileEntity.result!.chatInvitationStatus,
          linkedinUrl: profileEntity.result!.userLinkedinUrl,
          facebookUrl: profileEntity.result!.userfacebookUrl,
        );
        database.insertUser(allUser);

        for (var element in profileEntity.result!.experience!) {
          DBExperiece experience = DBExperiece(
            id: int.parse(element.id ?? ''),
            userId: int.parse(element.userId ?? ''),
            position: element.position,
            campanyName: element.campanyName,
            companyImage: element.companyImage,
            startDate: element.startDate,
            endDate: element.endDate,
          );
          database.insertExperience(experience);
        }


        for(int i=0; i<profileEntity.result!.interest!.length; i++){
          DBInterest interest = DBInterest(
            id: i,
            userId: int.parse(profileEntity.result!.interest![i].userId ?? ''),
            interest: profileEntity.result!.interest![i].interest,
          );
          database.insertInterests(interest);
        }

        for (var element in profileEntity.result!.education!) {
          DBEducation education = DBEducation(
            id: int.parse(element.id ?? ''),
            userId: int.parse(element.userId ?? ''),
            institute: element.institute,
            program: element.program,
            startDate: element.startDate,
            endDate: element.endDate,
          );
          database.insertEducation(education);
        }
        print("Inserted");
        print(profileEntity.result!.product);

        try {
          for (var element in profileEntity.result!.product!) {
            DBProduct product = DBProduct(
              id: int.parse(element.id ?? ''),
              coverImage: element.coverImage,
              productName: element.productName,
              productPrice: element.productPrice,
              category: element.category,
              cityName: element.cityName,
              productQuantity: element.productQty,
              description: element.productDescription,
              isActive: element.isActive,
              addedBy: int.parse(element.addedBy ?? ''),
              dueDate: element.dueDate,
              isAnonymous: element.isAnonymous,
              isPremium: element.isPremium,
              postedBy: element.postedBy,
            );
            database.insertProduct(product);
          }
        } catch (e) {
          print(e);
        }

        print("Inserted");
        return DataFetched(true, profileEntity.message ?? '');
      } else {
        return DataFetched(false, profileEntity.message ?? '');
      }
    }
    return DataFetched(false, 'errorMsg');
  }

  static Future<DataFetched> loadCompanies() async {
    var response = await ApiCalls.loadCompanies();
    if (response is ErrorEntity) {
      //UIHelper.showErrorAlert(context, response.message);
    } else {
      CompanyHintsEntity hintsEntity = CompanyHintsEntity().fromJson(response);
      if (hintsEntity.success == 1) {
        await database.deleteCompanies();
        database.insertAllCompanies(hintsEntity.companyHints!);
        print("Added -----");
        return DataFetched(true, hintsEntity.message ?? '');
      }
    }
    return DataFetched(false, 'errorMsg');
  }

  static Future<DataFetched> addJobs() async {
    var response = await ApiCalls.getJobs(
      AppConstants.myId,
    );
    if (response is ErrorEntity) {
    } else {
      JobsEntity jobsEntity = JobsEntity().fromJson(response);
      if (jobsEntity.success == 1) {
        database.deleteUserJobs();
        database.insertAllJobs(jobsEntity.result.jobs);
        print("Added -----");
        return DataFetched(true, jobsEntity.message);
      }
    }
    return DataFetched(false, 'errorMsg');
  }

  /// Work order
  ///  ********************************************
  ///
  static Future<DataFetched> getWorkOrder() async {
    var response = await ApiCalls.getWorkOrder(
      AppConstants.myId,
    );
    if (response is ErrorEntity) {
      print(response.message);
    } else {
      WorkOrderEntity workOrderEntity = WorkOrderEntity().fromJson(response);
      print(workOrderEntity.success);
      if (workOrderEntity.success == 1) {
        print(AppConstants.myId);
        print(workOrderEntity.result);

        await database.deleteWorkOrders();
        await database.insertAllWorkOrders(workOrderEntity.result!);

        return DataFetched(true, workOrderEntity.message ?? '');
      }
    }
    return DataFetched(false, 'errorMsg');
  }

  /// chapter Details

  static Future<DataFetched> chapterDetails() async {
    var response = await ApiCalls.chapterDetails(
      AppConstants.myId,
      chapterId ?? '1',
    );
    if (response is ErrorEntity) {
      print(response.message);
    } else {
      print('its here bro');
      ChapterDetailsModel chapterDetails =
          ChapterDetailsModel.fromJson(jsonEncode(response));
      print('bro this is it : ${chapterDetails.success}');
      if (chapterDetails.success == 1) {
        print(chapterDetails.message);
        await database.deleteChapResult();
        await database.deleteChapDetails();
        await database.deleteChapMembers();

        DBChapterDetailResult dbChapterDetailResult = DBChapterDetailResult(
          rChapterId: chapterDetails.result?.chapterId,
          rChapterName: chapterDetails.result?.chapterName,
          rChapterDetail: chapterDetails.result?.chapterDetail,
          rChapterNumber: chapterDetails.result?.chapterNumber,
          rChapterType: chapterDetails.result?.chapterType,
        );
        database.insertChapResult(dbChapterDetailResult);

        chapterDetails.result!.branches!.forEach((element) {
          DBChapterDetail dbChapterDetail = DBChapterDetail(
            chapterId: element.chapterId,
            chapterName: element.chapterName,
            branchId: element.branchId,
            branchName: element.branchName,
            contact: element.contact,
            address: element.address,
          );
          database.insertChapDetails(dbChapterDetail);
        });

        chapterDetails.result!.memeber!.forEach((element) {
          DBChapterDetailMember dbChapterDetailMember = DBChapterDetailMember(
            mChapterId: element.chapterId,
            mAlumniName: element.chapterUserAlumniName,
            mAlumniContact: element.chapterUserAlumniContact,
            mAlumniEmail: element.chapterUserAlumniEmail,
            mAlumniImage: element.chapterUserAlumniImage,
            mAlumniId: element.chapterUserAlumniId,
            mUserId: element.userId,
            mAlumniDesignation: element.chapterUserAlumniDesignation,
            mEmployId: element.employeeId,
            mAlumniType: element.chapterUserAlumniType,
          );
          database.insertChapMembers(dbChapterDetailMember);
        });

        // await database.deleteWorkOrders();
        // await database.insertAllWorkOrders(chapterDetails.result!);

        return DataFetched(true, chapterDetails.message ?? '');
      }
    }
    return DataFetched(false, 'errorMsg');
  }

  /// Delete Work order

  static Future<DataFetched> delWorkOrder(workId) async {
    var response = await ApiCalls.delWorkOrder(
      AppConstants.myId,
      workId,
    );
    if (response is ErrorEntity) {
      print(response.message);
    } else {
      DeleteWorkOrderModel deleteWorkOrder =
          DeleteWorkOrderModel.fromJson(jsonEncode(response));
      if (deleteWorkOrder.success == 1) {
        print(response);
        print('deleted');
        print(deleteWorkOrder.result);

        return DataFetched(true, deleteWorkOrder.message ?? '');
      }
    }
    return DataFetched(false, 'errorMsg');
  }

  static Future<DataFetched> saveWorkOrder() async {
    var response = await ApiCalls.getWorkOrder(
      AppConstants.myId,
    );
    if (response is ErrorEntity) {
      print(response.message);
    } else {
      WorkOrderEntity workOrderEntity = WorkOrderEntity().fromJson(response);
      if (workOrderEntity.success == 1) {
        print(response);
        print("Adding");
        await database.deleteWorkOrders();
        await database.insertAllWorkOrders(workOrderEntity.result!);
        print(workOrderEntity.result);

        //
        print("ADDDEd");

        return DataFetched(true, workOrderEntity.message ?? '');
      }
    }
    return DataFetched(false, 'errorMsg');
  }

  static Future<DataFetched> getSpotlight() async {
    var response = await ApiCalls.getSpotlightAlumini();
    if (response is ErrorEntity) {
    } else {
      SpotlightAluminiEntity aluminiEntity =
          SpotlightAluminiEntity().fromJson(response);
      if (aluminiEntity.success == 1) {
        await database.deleteAlumini();
        DBSpotlightAlumi spotlightAlumni = DBSpotlightAlumi(
          userId: aluminiEntity.spotlight!.userId,
          firstName: aluminiEntity.spotlight!.firstName,
          lastName: aluminiEntity.spotlight!.lastName,
          image: aluminiEntity.spotlight!.image,
          graduationYear: aluminiEntity.spotlight!.graduationYear,
        );
        database.insertAlumini(spotlightAlumni);

        return DataFetched(true, aluminiEntity.message ?? '');
      }
    }
    return DataFetched(false, 'errorMsg');
  }

/////////////
  /////////////
  static Future<DataFetched> getDiscounts() async {
    var response = await ApiCalls.getDiscounts(
      userId: AppConstants.myId,
    );
    if (response is ErrorEntity) {
    } else {
      DiscountEntity discountEntity = DiscountEntity().fromJson(response);
      if (discountEntity.success == 1) {
        await database.deleteDiscounts();

        database.insertAllDiscounts(discountEntity.result!.discountPartners!);
        print("Added -----");
        return DataFetched(true, discountEntity.message ?? '');
      }
    }
    return DataFetched(false, 'errorMsg');
  }

  static Future<DataFetched> tleFeedback(title, description) async {
    var response = await ApiCalls.tleFeedback(
      userId: AppConstants.myId,
      title: title,
      description: description,
    );
    if (response is ErrorEntity) {
    } else {
      TleFeedbackModel tleFeedback =
          TleFeedbackModel.fromJson(jsonEncode(response));
      if (tleFeedback.success == 1) {
        return DataFetched(true, tleFeedback.message ?? '');
      }
    }
    return DataFetched(false, 'errorMsg');
  }

  static Future<DataFetched> businessSpotlight() async {
    var response = await ApiCalls.businessSpotlight();
    if (response is ErrorEntity) {
    } else {
      BusinessSpotLightModel businessSpotLight =
          BusinessSpotLightModel.fromJson(jsonEncode(response));
      if (businessSpotLight.success == 1) {
        await database.deleteBusiSpotlight();
        businessSpotLight.businessSpotlight!.forEach((element) {
          DBBusinessSpotlight businessSpotlight = DBBusinessSpotlight(
            id: element.id.toString(),
            isDeleted: element.isDeleted,
            banner: element.banner,
            createdBy: element.createdBy.toString(),
            updatedBy: element.updatedBy.toString(),
            sortingOrder: element.sortingOrder.toString(),
            updatedAt: element.updatedAt,
            createdAt: element.createdAt,
            clickUrl: element.clickUrl,
          );
          database.insertBusiSpotlight(businessSpotlight);
        });

        return DataFetched(true, businessSpotLight.message ?? '');
      }
    }
    return DataFetched(false, 'errorMsg');
  }

  static Future<DataFetched> getEvents(context) async {
    var response = await ApiCalls.getUserEvents(
      userId: AppConstants.myId,
    );
    if (response is ErrorEntity) {
      print(response.message);
    } else {
      EventsEntity eventsEntity = EventsEntity().fromJson(response);
      if (eventsEntity.success == 1) {
        database.deleteEvents();
        database.insertAllEvents(eventsEntity.result.post);
        print(eventsEntity.result.post.length);
        return DataFetched(true, eventsEntity.message);
      }
    }
    return DataFetched(false, 'errorMsg');
  }

  // static Future<String> cardApply(context) async {
  //   var response = await ApiCalls.applyCard(
  //     userId: AppConstants.myId,
  //   );
  //   if (response is ErrorEntity) {
  //     print(response.message);
  //   } else {
  //     ApplyForCardModel applyForCardModel = ApplyForCardModel.fromJson(response);
  //     // EventsEntity eventsEntity = EventsEntity().fromJson(response);
  //     print(applyForCardModel.success);
  //     if (applyForCardModel.success == 1) {
  //       print(applyForCardModel.message);
  //       return applyForCardModel.message??'';
  //     }
  //     else{
  //       return 'e';
  //     }
  //   }
  //
  // }

  // ****************************************
  //********
  // Event Detials

  /// loadAttendies

  static Future<DataFetched> loadAttendies(context, eventId) async {
    var response = await ApiCalls.getAttendies(
      userId: AppConstants.myId,
      eventId: eventId,
    );
    if (response is ErrorEntity) {
    } else {
      AttendiesEntity attendiesEntity = AttendiesEntity().fromJson(response);
      if (attendiesEntity.success == 1) {
        database.deleteAttendies();
        database.insertAllAttendies(attendiesEntity.result.memberDetails);
        print("Added -----");
        return DataFetched(true, attendiesEntity.message);
      }else if(attendiesEntity.success == 0){
        database.deleteAttendies();
      }
    }
    return DataFetched(false, 'errorMsg');
  }

  /// Load Event Comments
  static Future<DataFetched> loadEventComments(postId, type) async {
    var response = await ApiCalls.getEventComments(
      userId: AppConstants.myId,
      postId: postId,
      type: type,
    );
    if (response is ErrorEntity) {
    } else {
      CommentsEntity commentsEntity = CommentsEntity().fromJson(response);
      if (commentsEntity.success == 1) {
        database.insertAllComments(commentsEntity.result!.allComments ?? []);
        print("Added -----");
        return DataFetched(true, commentsEntity.message ?? '');
      }
    }
    return DataFetched(false, 'errorMsg');
  }

  /// Load First Page Users
  static Future<AllUserDataFetched> getFirstPageUsers({
    currentPage,
    countryId,
    city,
    industry,
    year,
    isMentor,
    branchId,
    isRegister,
    connected,
    organization,
    name,
    connectionStatus,
  }) async {
    var response = await ApiCalls.getAllUsers(
      url:
          'api/get_users?next_page=$currentPage&name=$name&graduation_year=$year&user_id=${AppConstants.myId}&country=$countryId&city=$city&industry=$industry&is_mentor=$isMentor&branch=$branchId&connected=$connected&company_id=$organization',
    );

    if (response is ErrorEntity) {
      print(response.message);
    } else {
      AllUsersEntity usersEntity = AllUsersEntity().fromJson(response);
      if (usersEntity.success == 1) {
        // print(usersEntity.result);

        if (currentPage == 0) {
          await database.deleteSpecificUser(
            organization,
            connected,
            isMentor,
            year,
            countryId,
            city,
            industry,
            name,
            branchId,
          );
        }
        ;

        await database.insertAllUsers(usersEntity.result!);
        print("Added -----");

        return AllUserDataFetched(
          true,
          usersEntity.message ?? '',
          '',
          usersEntity.maxPageNumber ?? 0,
        );
      }
    }
    return AllUserDataFetched(false, 'errorMsg', '', 24);
  }

  //*********************************************************************
  //*********************************************************************
  //TLE spotlight
  //******************************************************************
  static Future<DataFetched> tleSpotlight() async {
    var response = await ApiCalls.tleSpotlight(
      userId: AppConstants.myId,
    );
    if (response is ErrorEntity) {
      print(response.message);
    } else {
      print('step 1 bro');
      try {
        TleSpotlightModel tleSpotlight =
            TleSpotlightModel.fromJson(jsonEncode(response));
        print('success 0 bro');
        if (tleSpotlight.success == 1) {
          print('success 1 bro');
          await database.deleteTleSpotlight();
          tleSpotlight.result?.forEach((element) {
            DBTleSpotlight dbTleSpotlight = DBTleSpotlight(
              userId: element.userId,
              loginWith: element.loginWith,
              firstName: element.firstName,
              lastName: element.lastName,
              countryId: element.countryId,
              isRegistered: element.registrationNumber,
              cityId: element.cityId,
              branchId: element.branchId,
              branchName: element.branchId,
              orgName: element.companyName,
              designation: element.designation,
              industryName: element.companyName,
              graduataionYear: element.graduationYear,
              description: element.description,
              dob: element.dob,
              regNumber: element.registrationNumber,
              phone: element.phone,
              currentCityId: element.currentCityId,
              currentCityName: element.currentCityName,
              latitude: element.latitude,
              longitude: element.longitude,
              chapterDesignation: element.chapterDesignation,
              isMentor: element.isMentor,
              // isDeleted: element.isDeleted,
              chatInvitationStatus: element.chatInvitationStatus,
              // userLinkedinUrl: element.userLinkedinUrl,
              // userFacebookUrl: element.userFacebookUrl,
              // gender: element.gender,
              image: element.image,
              // connectionStatus: element.connectionStatus,
              // isConnected: element.isConnected,
            );
            database.insertTleSpotlight(dbTleSpotlight);
          });
          return DataFetched(true, tleSpotlight.message ?? '');
        }
      } catch (e) {
        print(e);
      }
    }
    return DataFetched(false, 'errorMsg');
  }

  //*********************************************************************
  /// Get Notifications
  //******************************************************************
  static Future<DataFetched> getUserNotifications() async {
    var response = await ApiCalls.getNotifications(
      userId: AppConstants.myId,
    );
    if (response is ErrorEntity) {
      print(response.message);
    } else {
      await database.deleteNotifications();
      print("Hello");
      print(response);
      NotificationEntity notificationEntity =
          NotificationEntity().fromJson(response);
      if (notificationEntity.success == 1) {
        print("YES");

        database.insertAllNotifications(
            notificationEntity.result.userNotifications);
        print("Added -----");
        return DataFetched(true, notificationEntity.message);
      }
    }
    return DataFetched(false, 'errorMsg');
  }

  //
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Galleries
  //**************************************
  static Future<DataFetched> getGallery() async {
    var response = await ApiCalls.getGalleries(
      userId: AppConstants.myId,
    );
    if (response is ErrorEntity) {
    } else {
      GalleriesEntity galleriesEntity = GalleriesEntity().fromJson(response);
      if (galleriesEntity.success == 1) {
        database.deleteGalleries();
        database.insertAllGalleries(galleriesEntity.gallery);
        print("Added -----");
        return DataFetched(true, galleriesEntity.message);
      }
    }
    return DataFetched(false, 'errorMsg');
  }

  //
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Gallery Images
  //**************************************
  static Future<DataFetched> getGalleryImages(galleryId) async {
    var response = await ApiCalls.getGalleryImages(
      userId: AppConstants.myId,
      galleryID: galleryId,
    );
    if (response is ErrorEntity) {
      print(response);
    } else {
      GalleryImagesEntity galleriesEntity =
          GalleryImagesEntity().fromJson(response);
      if (galleriesEntity.success == 1) {
        await database.deleteImages(galleryId);
        print("Deleted -----");
        await database.insertAllGalleryImages(galleriesEntity.galleryImages);
        print("Added -----");
        return DataFetched(true, galleriesEntity.message);
      }
    }
    return DataFetched(false, 'errorMsg');
  }

  //TimeLine Posts

  static Future<DataFetched> getTimeLinePosts({currentPage, type}) async {
    var response = await ApiCalls.loadTimeLinePosts(
      userId: AppConstants.myId,
      type: type,
      page: currentPage.toString(),
    );
    if (response is ErrorEntity) {
    } else {
      TimeLinePostEntityEntity postEntity =
          TimeLinePostEntityEntity().fromJson(response);
      if (postEntity.success == 1) {
        if (currentPage == 0) {
          database.deleteTimeLinePosts();
          database.deleteTimeLinePostImages();
          database.deleteTimeLinePostTags();
        }

        for (var element in postEntity.timeline!) {
          DBTimeLinePost post = DBTimeLinePost(
            id: element.id,
            isPinned: element.isPinned,
            updatedAt: element.updatedAtDate,
            updatedDate: element.updatedAtDate,
            postText: element.text,
            createdAt: element.createdAt,
            createdBy: element.createdBy,
            firstName: element.firstName,
            lastName: element.lastName,
            totalComments: element.totalComments,
            totalLikes: element.totalLike,
            isLike: element.isLike,
            privacyType: element.postPrivacyType,
            isPublish: element.isPublish,
            userImage: element.userImage,
            postType: element.postType,
            eventId: element.eventId,
            feelingIcon: element.feelingIcon,
            feelingName: element.feelingName,
            checkInLocation: element.checkinLocation,
            reaction: element.reaction,
          );
          database.insertPost(post);
          for (var element2 in element.postImages!) {
            DBPostImage postImage = DBPostImage(
              id: element2.id,
              postId: element2.postId,
              postMedia: element2.postMedia,
              mediaType: element2.mediaType,
              views: element2.views,
              createdAt: element2.createdAt,
            );
            database.insertPostImage(postImage);
          }
          for (var element3 in element.tagsDetails!) {
            DBPostTag postTag = DBPostTag(
              id: element3.id,
              postId: element3.postId,
              firstName: element3.firstName,
              lastName: element3.lastName,
              userId: element3.userId,
              userImage: element3.userImage,
              tagBy: element3.tagBy,
              createdAt: element3.createdAt,
              updatedAt: element3.updatedAt,
              updatedBy: element3.updatedBy,
            );
            database.insertPostTag(postTag);
          }
        }

        print("ADDED");
        return DataFetched(true, postEntity.message ?? '');
      }
    }
    return DataFetched(false, 'errorMsg');
  }

  /// Load Post Comments
  static Future<DataFetched> loadPostComments(postId, type) async {
    var response = await ApiCalls.getPostComments(
      userId: AppConstants.myId,
      postId: postId,
      type: type,
    );
    if (response is ErrorEntity) {
    } else {
      CommentEntity commentsEntity =
          CommentEntity.fromJson(jsonEncode(response));
      if (commentsEntity.success == 1) {
        for (var element in commentsEntity.result!.allComments!) {
          DBComment comment = DBComment(
            id: element.id,
            postId: element.postId,
            comment: element.text,
            commentedBy: element.commentedBy,
            likeCount: element.likeCount,
            firstName: element.firstName,
            lastName: element.lastName,
            reaction: element.dataReaction,
            imageType: element.commentImageType,
            commentImage: element.commentImage,
            createdDate: element.createdDate,
            isLike: element.isLike,
            userImage: element.userImage,
            type: element.type,
          );
          database.insertComment(comment);
          for (var element2 in element.replies!) {
            DBCommentReplie reply = DBCommentReplie(
              id: element2.id.toString(),
              commentId: element2.commentId.toString(),
              comment: element2.text,
              commentedBy: element2.commentedBy.toString(),
              likeCount: element2.likeCount,
              firstName: element2.firstName,
              lastName: element2.lastName,
              reaction: element2.dataReaction,
              imageType: element2.commentImageType,
              commentImage: element2.commentImage,
              createdDate: element2.createdDate,
              isLike: element2.isLike,
              userImage: element2.userImage,
              type: element2.type,
            );
            database.insertCommentReply(reply);
          }
        }
        //database.insertAllComments(commentsEntity.result!.allComments ?? []);
        print("Added -----");
        return DataFetched(true, commentsEntity.message!);
      }
    }
    return DataFetched(false, 'errorMsg');
  }

  //Event Details
  static Future<DataFetched> getEventDetails(eventId) async {
    var response = await ApiCalls.eventDetails(
      userId: AppConstants.myId,
      eventId: eventId,
    );
    if (response is ErrorEntity) {
    } else {
      EventDetailEntity detailEntity = EventDetailEntity().fromJson(response);
      if (detailEntity.success == 1) {
        database.deleteSingleEvent(eventId);
        for (var element in detailEntity.result!) {
          DBEvent dbEvent = DBEvent(
            id: element.id,
            description: element.description,
            startDate: element.startDate,
            startTime: element.startTime,
            isLike: element.isLike,
            isInterested: element.isInterested,
            totalComments: element.totalComments,
            title: element.title,
            isGoing: element.isGoing,
            image: element.image,
            totalLike: element.totalLike,
            totalGoing: element.totalGoing,
            endDate: element.endDate,
            endTime: element.endTime,
            totalInterested: element.totalInterested,
            city: element.city,
            venue: element.venue,
          );
          database.insertSingleEvent(dbEvent);
        }

        print("Added -----");
        return DataFetched(true, detailEntity.message ?? '');
      }
    }
    return DataFetched(false, 'errorMsg');
  }

  ////
  /////
  /////
  //********************** CSR ***********************
  //
  static Future<DataFetched> getCSRs() async {
    var response = await ApiCalls.getCSR(
      userId: AppConstants.myId,
    );
    if (response is ErrorEntity) {
    } else {
      CSREntity csrEntity = CSREntity().fromJson(response);
      if (csrEntity.success == 1) {
        database.deleteCSR();
        database.insertAllCSR(csrEntity.result);
        print("Added -----");
        return DataFetched(true, csrEntity.message);
      }
    }
    return DataFetched(false, 'errorMsg');
  }

  ////
  /////
  /////
  //********************** About ***********************
  //
  static Future<DataFetched> getAbout() async {
    var response = await ApiCalls.getAboutUs(
      userId: AppConstants.myId,
    );
    if (response is ErrorEntity) {
    } else {
      AboutEntity aboutEntity = AboutEntity().fromJson(response);
      if (aboutEntity.success == 1) {
        database.deleteAbout();
        DBAbout about = DBAbout(
            mission: aboutEntity.result.mission,
            vission: aboutEntity.result.vission,
            objective: aboutEntity.result.objective,
            message: aboutEntity.result.messageFromOar,
            aboutMessage: aboutEntity.result.messageFromCe);
        database.insertAbout(about);

        return DataFetched(true, aboutEntity.message);
      }
    }
    return DataFetched(false, 'errorMsg');
  }

  ////
  /////
  /////
  //********************** Faqs ***********************
  //
  static Future<DataFetched> getFaq() async {
    var response = await ApiCalls.getFaqs(
      userId: AppConstants.myId,
    );
    if (response is ErrorEntity) {
    } else {
      FaqEntity faqEntity = FaqEntity().fromJson(response);
      if (faqEntity.success == 1) {
        database.deleteFaqs();
        database.insertAllFaqs(faqEntity.result);

        return DataFetched(true, faqEntity.message);
      }
    }
    return DataFetched(false, 'errorMsg');
  }

  ////
  /////
  /////
  //********************** Connect ***********************
  //
  static Future<DataFetched> getContact() async {
    var response = await ApiCalls.getContact(
      userId: AppConstants.myId,
    );
    if (response is ErrorEntity) {
    } else {
      ContactEntity contactEntity = ContactEntity().fromJson(response);
      if (contactEntity.success == 1) {
        database.deleteContact();
        DBContact contact = DBContact(
          id: contactEntity.result!.id,
          email: contactEntity.result!.email,
          fax: contactEntity.result!.fax,
          phone: contactEntity.result!.phoneNo,
          address: contactEntity.result!.address,
          website: contactEntity.result!.website,
          websiteAddress: contactEntity.result!.websiteAdd,
          faceBookLink: contactEntity.result!.facebookLink,
          youtubeLink: contactEntity.result!.youtubeLink,
          linkedInUrl: contactEntity.result!.linkedinLink,
          whatsappLink: contactEntity.result!.whatsappLink,
          instagramLink: contactEntity.result!.instagramLink,
          twitterLink: contactEntity.result!.twitterLink,
          phoneExt: contactEntity.result!.phoneExt,
        );
        database.insertContact(contact);

        return DataFetched(true, contactEntity.message ?? '');
      }
    }
    return DataFetched(false, 'errorMsg');
  }

  /// TLE Buy and Sell
  ///
  ///
  /// ********************** Get All Products ***********************

  static Future<DataFetched> getProducts() async {
    var response = await ApiCalls.getAllProducts(
      userId: AppConstants.myId,
    );
    if (response is ErrorEntity) {
    } else {
      ProductsEntity productsEntity =
          ProductsEntity.fromJson(jsonEncode(response));

      if (productsEntity.success == 1) {
        print(productsEntity.result);
        await database.deleteAllProducts();

        await database.insertAllProducts(productsEntity.result ?? []);

        return DataFetched(true, productsEntity.message ?? '');
      }
    }
    return DataFetched(false, 'errorMsg');
  }

  static Future<DataFetched> getProductDetail(productId) async {
    var response = await ApiCalls.getProductDetails(
      userId: AppConstants.myId,
      productId: productId,
    );
    if (response is ErrorEntity) {
    } else {
      ProductDetailsModel productDetailsModel =
          ProductDetailsModel.fromJson(jsonEncode(response));
      if (productDetailsModel.success == 1) {
        try {
          await database.deleteSingleProductImages(int.parse(productId));
        } catch (e) {
          print(e);
        }

        for (var element in productDetailsModel.result!) {
          DBProduct product = DBProduct(
            id: element.id!,
            productName: element.productName,
            productPrice: element.productPrice,
            productQuantity: element.productQty,
            description: element.productDesc,
            dueDate: element.dueDate,
            addedBy: element.addedBy,
            postedBy: element.postedBy,
            isActive: element.isActive,
            isPremium: element.isPremium,
            category: element.category,
            cityName: element.cityName,
            isAnonymous: element.isAnonymous,
          );
          database.insertProduct(product);
        }
        for (var element in productDetailsModel.result!.first.coverImage!) {
          DBProductImage productImage = DBProductImage(
            id: element.id!,
            productId: element.productId,
            productMedia: element.productMedia,
            createdAt: element.createdAt,
            type: element.type,
          );
          database.insertProductImage(productImage);
        }

        return DataFetched(true, productDetailsModel.message ?? '');
      }
    }
    return DataFetched(false, 'errorMsg');
  }
}

class UserDevices {
  String? token;
  String? status;
  UserDevices({
    this.token,
    this.status,
  });
}