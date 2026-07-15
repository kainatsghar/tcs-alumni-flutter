import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:iobm/utils/app_constants.dart';

import 'api_config.dart';
import 'api_params.dart';
import 'api_path.dart';

class ApiCalls {
  //write all your api calls here in this class

  static login({
    required email,
    required password,
    required manufacturer,
    platform,
    latitude,
    longitude,
    appVersion,
    required token,
    model,
    osVersion,
    serial,
    source,
    status = 'A',
    loginWith,
  }) async {
    Map params = {
      Params.USER_EMAIL: email,
      Params.USER_PASSWORD: password,
      Params.USER_LOGIN_WITH: loginWith,
      Params.LATITUDE: latitude,
      Params.LONGITUDE: longitude,
      Params.DEVICE_MANUFACTURER: manufacturer,
      Params.DEVICE_MODEL: model,
      Params.DEVICE_PLATFORM: platform,
      Params.DEVICE_VERSION: osVersion,
      Params.DEVICE_TOKEN: token,
      Params.DEVICE_UUID: serial,
      Params.DEVICE_STATUS: status,
      Params.APP_VERSION_PARAM: appVersion,
    };

    return await NetworkCalls.postMultipartCall(apiLogin, params);
  }

  static getUserInfo({userId, myId}) async {
    Map params = {
      Params.USER_ID: userId,
      Params.MY_ID: myId,
    };
    return _condition(apiUserInfo, params);
  }

  static addInterests(String userId, String interest) async {
    Map params = {
      Params.USER_ID: userId,
      Params.INTEREST: interest,
    };
    return _condition(apiAddInterest, params);
  }

  static addEducation(String userId, String institute, String program,
      String startDate, String endDate, educationID) async {
    Map params = {
      Params.USER_ID: userId,
      Params.EDUCATION_INSTITUTE: institute,
      Params.EDUCATION_DEGREE: program,
      Params.ALUMNI_EVENT_START_DATE: startDate,
      Params.ALUMNI_EVENT_END_DATE: endDate,
      Params.EDUCATION_ID: educationID,
    };
    return _condition(apiAddEducation, params);
  }

  static addExperience({
    String? userId,
    String? position,
    String? companyName,
    String? startDate,
    String? endDate,
    experienceID,
    imagePath,
    String? industry,
  }) async {
    Map params = {
      Params.USER_ID: userId,
      Params.EXPERIENCE_POSITION: position,
      Params.COMPANY_NAME: companyName,
      Params.EXPERIENCE_ID: experienceID,
      Params.ALUMNI_EVENT_START_DATE: startDate,
      Params.ALUMNI_EVENT_END_DATE: endDate,
      Params.INDUSTRY_NAME: industry
    };
    return await NetworkCalls.postWebCall(apiAddExperience, params);
  }

  static deleteEducation({userId, educationId}) async {
    Map params = {
      Params.USER_ID: userId,
      Params.EDUCATION_ID: educationId,
    };
    return _condition(apiDeleteEducation, params);
  }

  static getQuoridorLeaderboard({userId}) async {
    Map params = {
      Params.USER_ID: userId,
    };
    return await NetworkCalls.getWebCall(apiGetQuoridorLeaderboard, params: params);
  }

  static deleteExperience(userId, experienceId) async {
    Map params = {
      Params.USER_ID: userId,
      Params.EXPERIENCE_ID: experienceId,
    };
    return _condition(apiDeleteExperience, params);
  }

  static editDescription({userId, description}) async {
    Map params = {
      Params.USER_ID: userId,
      Params.USER_DESCRIPTION: description,
    };
    return _condition(apiEditDescription, params);
  }

  static loadCompanies() async {
    return await NetworkCalls.getWebCall(apiLoadCompanies);
  }

  static loadDesignations({userId, last_sync}) async {
    Map params = {
      Params.USER_ID: userId,
      Params.LAST_SYNC: last_sync,
    };
    return _condition(apiLoadDesignation, params);
  }

  static uploadProfile({userId, imagePath}) async {
    Map params = {Params.USER_ID: userId};
    return await NetworkCalls.uploadFile(apiUploadUserImage, params, imagePath);
  }

  static uploadPostWorkOrder({userId, imagePath}) async {
    Map params = {Params.USER_ID: userId};
    return await NetworkCalls.uploadFile(apiUploadUserImage, params, imagePath);
  }

  static signupSettings() async {
    Map params = {};
    return await NetworkCalls.postWebCall(apiSignUpSettings, params);
  }

  static getJobs(userId) async {
    Map map = {
      Params.USER_ID: userId,
    };
    return _condition(apiGetJobs, map);
  }

  static getWorkOrder(userId) async {
    Map map = {
      Params.USER_ID: userId,
    };
    return _condition(apiGetWorkOrder, map);
  }

  static chapterDetails(userId, chapterId) async {
    Map map = {
      Params.USER_ID: userId,
      Params.CHAPTER_IDEE: chapterId,
    };
    return _condition(apiChapterDetails, map);
  }

  static delWorkOrder(userId, workId) async {
    Map map = {
      Params.USER_ID: userId,
      Params.WORK_ORDER_ID: workId,
    };
    return _condition(apiDelWorkOrder, map);
  }

  static saveWorkOrder(
      userId, designation, due_date, companyName, description) async {
    Map map = {
      Params.USER_ID: userId,
      Params.DESIGNATION: designation,
      Params.DUE_DATE: due_date,
      Params.COMPANY_NAME: companyName,
      Params.USER_DESCRIPTION: designation,
    };
    return await NetworkCalls.postMultipartCall(apiSaveWorkOrder, map);
  }

  static postJob(
      designation,
      companyName,
      jobUrl,
      postedBy,
      duaDate,
      jobId,
      imagePath
      ) async {
    Map params = {
      Params.DESIGNATION: designation,
      Params.COMPANY_NAME: companyName,
      Params.JOB_URL: jobUrl,
      Params.POSTED_BY: postedBy,
      Params.DUE_DATE: duaDate,
      Params.JOB_IMAGE: imagePath,

    };
    if (imagePath == null) {
      print("If part");
      return _condition(apiPostJob, params);
    }
    else {
      print("else part=${params}");
      return await NetworkCalls.uploadFileWithToken(
        url: apiPostJob,
        map: params,
        imagePath: imagePath,
        param: "image",
      );
    }
  }

  /// Post or Save Work order
  /// ****************************
  /// *****
  static postWorkOrder({
    userId,
    designation,
    companyName,
    description,
    dueDate,
    id,
    file,
  }) async {
    Map params = {
      Params.user_id: userId,
      Params.DESIGNATION: designation,
      Params.COMPANY_NAME: companyName,
      Params.USER_DESCRIPTION: description,
      Params.DUE_DATE: dueDate,
      Params.WORK_ORDER_ID: id,
    };
    return await NetworkCalls.uploadFileWorkOrder(
        apiSaveWorkOrder, params, file);
  }

  static postWorkOrderN({
    userId,
    designation,
    companyName,
    description,
    dueDate,
    id,
  }) async {
    Map params = {
      Params.user_id: userId,
      Params.DESIGNATION: designation,
      Params.COMPANY_NAME: companyName,
      Params.USER_DESCRIPTION: description,
      Params.DUE_DATE: dueDate,
      Params.WORK_ORDER_ID: id,
    };
    return _condition(apiSaveWorkOrder, params);
  }

  static mentorSubscribe({userid, status}) async {
    Map params = {Params.USER_ID: userid, Params.STATUS: status};
    return _condition(apiMentorSub, params);
  }

  static updateConnectionStatus({senderId, receiverId, status}) async {
    Map params = {
      Params.PARAM_SENDER_ID: senderId,
      Params.PARAM_RECEIVER_ID: receiverId,
      Params.STATUS: status,
    };
    return _condition(apiUpdateConnectionStatus, params);
  }

  static getSpotlightAlumini() async {
    return await NetworkCalls.getWebCall(apiSpotlight);
  }

  static tleSpotlight({userId}) async {
    return await NetworkCalls.getWebCallWithToken(apiTleSpotlight);
  }

  static tleFeedback({userId, title, description}) async {
    Map params = {
      Params.USER_ID: userId,
      Params.TITLE: title,
      Params.DESCRIPTION: description,
    };
    return await NetworkCalls.postMultipartCall(apiTleFeedback, params);
  }

  static businessSpotlight() async {
    return await NetworkCalls.getWebCall(apiBusinessSpotlight);
  }
  //**********************************
  // ************************************************
  // ********* Events

  static getUserEvents({userId}) async {
    Map params = {
      Params.USER_ID: userId,
    };
    return _condition(apiGetEvents, params);
  }

  static eventDetails({userId, eventId}) async {
    Map params = {
      Params.USER_ID: userId,
      Params.EVENT_ID: eventId,
    };
    return _condition(apiEventDetail, params);
  }

  static getAttendies({userId, eventId}) async {
    Map params = {
      Params.USER_ID: userId,
      Params.EVENT_ID: eventId,
    };
    return _condition(apiFetchAttendies, params);
  }

  static getEventComments({postId, userId, type}) async {
    Map params = {
      Params.POST_ID: postId,
      Params.USER_ID: userId,
      Params.TYPE: type,
    };
    return _condition(apiLoadComments, params);
  }

  //Get All Users get_users
  static getAllUsers({url}) async {
    return await NetworkCalls.getWebCall(url);
  }

  static getCities({countryId}) async {
    Map params = {
      Params.COUNTRY_ID: countryId.toString(),
    };
    print('${AppConstants.baseUrl}$apiFetchCities');
    print(params);
    return _conditionCity(apiFetchCities, params);
  }

  /// Comments *************************************
  static addComment(
      {commentedBy, text, eventID, type, imagePath, commentId}) async {
    Map params = {
      Params.COMMENTED_BY: commentedBy,
      Params.COMMENT_TEXT: text,
      Params.POST_ID: eventID,
      Params.TYPE: type,
      Params.COMMENT_ID: commentId,
    };
    if (imagePath == null) {
      return _condition(apiInsertComment, params);
    } else {
      return AppConstants.appName != 'BOSS'
          ? await NetworkCalls.uploadFileWithToken(
        url: apiInsertComment,
        map: params,
        imagePath: imagePath,
        param: "comment_image",
      )
          : await NetworkCalls.uploadFileWithToken(
        url: apiInsertComment,
        map: params,
        imagePath: imagePath,
        param: "comment_image",
      );
    }
  }
  /// Replies ***********************************
  static addReply({text, commentId, type, imagePath, replyId}) async {
    Map params = {
      Params.COMMENT_TEXT: text,
      Params.COMMENT_ID: commentId,
      Params.TYPE: type,
      Params.REPLY_ID: replyId,
    };
    if (imagePath == null) {
      return _condition(apiInsertCommentReply, params);
    }
    else {
      return await NetworkCalls.uploadFileWithToken(
        url: apiInsertCommentReply,
        map: params,
        imagePath: imagePath,
        param: "comment_image",
      );
    }
  }

  static getDiscounts({userId}) async {
    Map params = {
      Params.USER_ID: userId,
    };
    return _condition(apiGetDiscount, params);
  }

  /// InsertDiscount ********************
  static insertDiscount({userId, message}) async {
    Map params = {
      Params.USER_ID: userId,
      Params.MESSAGE: message,
    };
    return _condition(apiInsertOffer, params);
  }

  // Notification *****************
  static getNotifications({userId}) async {
    Map params = {
      Params.USER_ID: userId,
    };
    return _condition(apiGetNotifications, params);
  }

  // Galleries *****************
  static getGalleries({userId}) async {
    Map params = {
      Params.USER_ID: userId,
    };
    return _condition(apiGetGallery, params);
  }

  // GalleryImages *****************
  static getGalleryImages({userId, galleryID}) async {
    Map params = {
      Params.USER_ID: userId,
      Params.GALLERY_ID: galleryID,
    };
    return _condition(apiGetGalleryImages, params);
  }

  // SharingLocatipon *****************
  static enableLocationSharing({userId, sharingLoc}) async {
    Map params = {
      Params.USER_ID: userId,
      Params.SHARING_LOC: sharingLoc,
    };
    return _condition(apiSharingLoc, params);
  }

  //********************************* EVENTS ***************************************
  // Event Status*****************
  static changeEventStatus({userId, eventId, status}) async {
    Map params = {
      Params.USER_ID: userId,
      Params.EVENT_ID: eventId,
      Params.STATUS: status,
    };
    return _condition(apiUserEventStatus, params);
  }

  // Event Like Unlike*****************
  static eventLikeUnlike({userId, eventId, status}) async {
    Map params = {
      Params.USER_ID: userId,
      Params.POST_ID: eventId,
      Params.TYPE: "event",
      Params.STATUS: status,
    };
    return _condition(apiEventLikeUnlike, params);
  }

  // Logout*****************
  static logout({
    required userId,
    required manufacturer,
    required appVersion,
    platform,
    required token,
    model,
    osVersion,
    serial,
    status = 'D',
  }) async {
    Map params = {
      Params.user_id: userId,
      Params.DEVICE_MANUFACTURER: manufacturer,
      Params.DEVICE_MODEL: model,
      Params.DEVICE_PLATFORM: platform,
      Params.DEVICE_VERSION: osVersion,
      Params.DEVICE_TOKEN: token,
      Params.DEVICE_UUID: serial,
      Params.DEVICE_STATUS: status,
      Params.APP_VERSION_PARAM: appVersion,
    };

    return await NetworkCalls.postWebCall(apiLogout, params);
  }

  // TimeLine Posts*****************
  static loadTimeLinePosts({userId, type, page}) async {
    Map params = {
      Params.USER_ID: userId,
      Params.TYPE: type,
      "next_page": page,
    };
    return _condition(apiLoadTimeline, params);
  }

  // Insert TimeLine Posts*****************
  static insertTimelinePost(
      {userId, postText, postMedia, tag, postType, feeling, checkin}) async {
    Map params = {
      Params.USER_ID: userId,
      Params.TIMELINE_TEXT: postText,
      Params.TIMELINE_MEDIA: postMedia,
      Params.TAGS: tag,
      Params.POST_TYPE: postType,
      Params.USER_FEELING: feeling,
      Params.CHECK_IN_CITY: checkin,
    };
    return _condition(apiInsertTimeline, params);
    //return await NetworkCalls.postMultipartCall(apiInsertTimeline, params);
  }

  // Like Dislike Post*****************
  static likeUnlikePost(
      {userId, postId, type, status, reaction, commentId, replyId}) async {
    Map params = {
      Params.USER_ID: userId,
      Params.POST_ID: postId,
      Params.TYPE: type,
      Params.REACTION: reaction,
      Params.STATUS: status,
      Params.COMMENT_ID: commentId,
      Params.REPLY_ID: replyId,
    };
    return _condition(apiLikeUnlikePost, params);
  }

  // Delete Post*****************
  static deletePost({
    userId,
    postId,
  }) async {
    Map params = {
      Params.USER_ID: userId,
      Params.POST_ID: postId,
    };
    return _condition(apiDeletePost, params);
  }

  static insertPostComment({commentedBy, text, postId, type}) async {
    Map params = {
      Params.COMMENTED_BY: commentedBy,
      Params.COMMENT_TEXT: text,
      Params.POST_ID: postId,
      Params.TYPE: type,
    };
    return _condition(apiPostComment, params);
  }

  static getPostComments({postId, userId, type}) async {
    Map params = {
      Params.POST_ID: postId,
      Params.USER_ID: userId,
      Params.TYPE: type,
    };
    return await NetworkCalls.postWebWithTokenCall(apiLoadPostComments, params);
  }

  //
  //Chat
  static getUserInvitation({senderId, receiverId}) async {
    Map params = {
      Params.PARAM_SENDER_ID: senderId,
      Params.PARAM_RECEIVER_ID: receiverId,
    };
    return _condition(apiGetUserInvitation, params);
  }

  static insertUserInvitation({senderId, receiverId, status}) async {
    Map params = {
      Params.PARAM_SENDER_ID: senderId,
      Params.PARAM_RECEIVER_ID: receiverId,
      Params.STATUS: status
    };
    return _condition(apiInsertUserInvitation, params);
  }

  /// CSR
  ///
  static getCSR({userId}) async {
    Map params = {
      Params.USER_ID: userId,
    };
    return _condition(apiGetCSR, params);
  }

  static insertCSR({userId, csrId}) async {
    Map params = {
      Params.USER_ID: userId,
      Params.CSR_ID: csrId,
    };
    return _condition(apiInsertCSR, params);
  }

  //Get FAqs **************************************************************
  ///
  /// //
  ///
  static getFaqs({userId}) async {
    Map params = {
      Params.USER_ID: userId,
    };
    return _condition(apiGetFaqs, params);
  }

  //Get Contact **************************************************************
  ///
  /// //
  ///
  static getContact({userId}) async {
    Map params = {
      Params.USER_ID: userId,
    };
    return _condition(apiGetContact, params);
  }

  //Get About **************************************************************
  ///
  /// //
  ///
  static getAboutUs({userId}) async {
    Map params = {
      Params.USER_ID: userId,
    };
    return _condition(apiAboutUs, params);
  }

  //Edit Check in City **************************************************************
  ///
  /// //
  ///
  static editCurrentCity({userId, cityId, cityName}) async {
    Map params = {
      Params.USER_ID: userId,
      Params.USER_CURRENT_CITY_ID: cityId,
      Params.USER_CURRENT_CITY_NAME: cityName
    };
    return _condition(apiEditCurrentCity, params);
  }

  //Change Password **************************************************************
  ///
  /// //
  ///
  static changePassword({userId, currentPass, newPass}) async {
    Map params = {
      Params.USER_ID: userId,
      Params.USER_OLD_PASSWORD: currentPass,
      Params.USER_NEW_PASSWORD: newPass,
    };
    return _condition(apiChangePassword, params);
  }

  //Verrify Phone number  **************************************************************
  ///
  /// //
  ///
  static verifyPhone({phone}) async {
    Map params = {
      Params.USER_PHONE: phone,
    };
    return await NetworkCalls.postMultipartCall(
      apiCheckPhone,
      params,
    );
  }

  //SignUp

  static signup({
    email,
    password,
    name,
    loginWith,
    dob,
    cnic,
    phone,
    graduationYear,
    program,
    confirmPassword,
    required manufacturer,
    platform,
    required appVersion,
    required token,
    model,
    osVersion,
    serial,
    status = 'A',
  }) async {
    Map params = {
      Params.USER_EMAIL: email,
      Params.USER_PASSWORD: password,
      Params.USER_CNIC: cnic,
      Params.USER_LOGIN_WITH: loginWith,
      Params.USER_PHONE: phone,
      Params.GRADUATING_YEAR: graduationYear,
      Params.PROGRAM: program,
      Params.USER_DOB: dob,
      Params.USER_FULL_NAME: name,
      Params.USER_CONFIRM_PASSWORD: confirmPassword,
      Params.DEVICE_MANUFACTURER: manufacturer,
      Params.DEVICE_MODEL: model,
      Params.DEVICE_PLATFORM: platform,
      Params.APP_VERSION_PARAM: appVersion,
      Params.DEVICE_TOKEN: token,
      Params.DEVICE_VERSION: osVersion,
      Params.DEVICE_UUID: serial,
      Params.DEVICE_STATUS: status,
    };
    return await NetworkCalls.postWebCall(apiSignUp, params);
  }

  //Edit LinkedIn URL  **************************************************************
  ///
  /// //
  ///
  static editLinkedInUrl({userId, url}) async {
    Map params = {
      Params.USER_ID: userId,
      Params.LINKED_IN_URL: url,
      Params.TYPE: 'linkedin'
    };
    return _condition(apiEditUrl, params);
  }

  static editFacebookUrl({userId, fbUrl}) async {
    Map params = {
      Params.USER_ID: userId,
      Params.LINKED_IN_URL: fbUrl,
      Params.TYPE: 'facebook'
    };
    return _condition(apiEditUrl, params);
  }

  //UpdatePassword  **************************************************************
  ///
  /// //
  ///
  static forgetPassword({phone, password}) async {
    Map params = {
      Params.USER_EMAIL: phone,
      Params.USER_PASSWORD: password,
    };
    return await NetworkCalls.postMultipartCall(
      apiUpdateForgetPassword,
      params,
    );
  }

  //*************************************************
  //*************************************************
  // SignUpBoss
  static searchSignUp(
      {fullName, fatherName, graduationYear, branchId, dob, loginWith}) async {
    Map params = {
      Params.USER_FULL_NAME: fullName,
      Params.USER_FATHER_NAME: fatherName,
      Params.GRADUATING_YEAR: graduationYear,
      Params.GRADUATING_BRANCH_ID: branchId,
      Params.USER_DOB: dob,
      Params.USER_LOGIN_WITH: loginWith,
    };
    return await NetworkCalls.postMultipartCall(
      apiSignUpSearch,
      params,
    );
  }

  // Auto Verify
  static autoSignupBoss({
    userId,
    email,
    password,
    fullName,
    fatherName,
    loginWith,
    dob,
    branchId,
    studentId,
    phone,
    graduationYear,
    source,
    required manufacturer,
    platform,
    required appVersion,
    required token,
    model,
    osVersion,
    serial,
    status = 'A',
    city = "",
    country = "",
  }) async {
    Map params = {
      Params.USER_EMAIL: email,
      Params.USER_PASSWORD: password,
      Params.USER_LOGIN_WITH: loginWith,
      Params.USER_PHONE: phone,
      Params.GRADUATING_YEAR: graduationYear,
      Params.USER_DOB: dob,
      Params.STUDENT_ID: studentId,
      Params.GRADUATING_BRANCH_ID: branchId,
      Params.USER_FULL_NAME: fullName,
      Params.USER_FATHER_NAME: fatherName,
      Params.DEVICE_MANUFACTURER: manufacturer,
      Params.DEVICE_MODEL: model,
      Params.DEVICE_PLATFORM: platform,
      Params.APP_VERSION_PARAM: appVersion,
      Params.DEVICE_TOKEN: token,
      Params.USER_SIGN_UP_SRC: source,
      Params.DEVICE_VERSION: osVersion,
      Params.DEVICE_UUID: serial,
      Params.DEVICE_STATUS: status,
      Params.USER_ID: userId,
      Params.USER_CITY: city,
      Params.USER_COUNTRY: country,
    };
    return await NetworkCalls.postMultipartCall(apiAutoSignUpCityzens, params);
  }

  // Manual Signup Boss
  static manualSignupBoss({
    email,
    password,
    fullName,
    fatherName,
    loginWith,
    dob,
    branchId,
    phone,
    graduationYear,
    source,
    manufacturer,
    platform,
    appVersion,
    token,
    model,
    osVersion,
    serial,
    status = 'A',
    city = "",
    country = "",
  }) async {
    Map params = {
      Params.USER_EMAIL: email,
      Params.USER_PASSWORD: password,
      Params.USER_LOGIN_WITH: loginWith,
      Params.USER_PHONE: phone,
      Params.GRADUATING_YEAR: graduationYear,
      Params.USER_DOB: dob,
      Params.GRADUATING_BRANCH_ID: branchId,
      Params.USER_FULL_NAME: fullName,
      Params.USER_FATHER_NAME: fatherName,
      Params.DEVICE_MANUFACTURER: manufacturer,
      Params.DEVICE_MODEL: model,
      Params.DEVICE_PLATFORM: platform,
      Params.APP_VERSION_PARAM: appVersion,
      Params.DEVICE_TOKEN: token,
      Params.USER_SIGN_UP_SRC: source,
      Params.DEVICE_VERSION: osVersion,
      Params.DEVICE_UUID: serial,
      Params.DEVICE_STATUS: status,
      Params.USER_CITY: city,
      Params.USER_COUNTRY: country,
    };
    return await NetworkCalls.postMultipartCall(apiManualSignupCityzens, params);
  }

  /// ***************************************************
  /// IOBM SIgn UP
  static searchSignUpIobm(
      {fullName, fatherName, graduationYear, degreeId}) async {
    Map params = {
      Params.USER_FULL_NAME: fullName,
      Params.GRADUATING_YEAR: graduationYear,
      Params.DEGREE_ID: degreeId,
    };
    return await NetworkCalls.postMultipartCall(
      apiSearchSignupIobm,
      params,
    );
  }

  /// Auto Signup Iobm
  static autoSignupIobm({
    email,
    password,
    fullName,
    loginWith,
    dob,
    degreeId,
    studentId,
    phone,
    graduationYear,
    source,
    required manufacturer,
    platform,
    required appVersion,
    required token,
    model,
    osVersion,
    serial,
    status = 'A',
  }) async {
    Map params = {
      Params.USER_EMAIL: email,
      Params.USER_PASSWORD: password,
      Params.USER_LOGIN_WITH: loginWith,
      Params.USER_PHONE: phone,
      Params.GRADUATING_YEAR: graduationYear,
      Params.USER_DOB: dob,
      Params.STUDENT_ID: studentId,
      Params.DEGREE_ID: degreeId,
      Params.USER_FULL_NAME: fullName,
      Params.DEVICE_MANUFACTURER: manufacturer,
      Params.DEVICE_MODEL: model,
      Params.DEVICE_PLATFORM: platform,
      Params.APP_VERSION_PARAM: appVersion,
      Params.DEVICE_TOKEN: token,
      Params.USER_SIGN_UP_SRC: source,
      Params.DEVICE_VERSION: osVersion,
      Params.DEVICE_UUID: serial,
      Params.DEVICE_STATUS: status,
    };
    return await NetworkCalls.postMultipartCall(apiUserAutoVerifyIobm, params);
  }

  static manualSignupIOBM({
    email,
    password,
    fullName,
    fatherName,
    loginWith,
    dob,
    degreeId,
    phone,
    graduationYear,
    source,
    manufacturer,
    platform,
    appVersion,
    token,
    model,
    osVersion,
    serial,
    status = 'A',
  }) async {
    Map params = {
      Params.USER_EMAIL: email,
      Params.USER_PASSWORD: password,
      Params.USER_LOGIN_WITH: loginWith,
      Params.USER_PHONE: phone,
      Params.GRADUATING_YEAR: graduationYear,
      Params.USER_DOB: dob,
      Params.DEGREE_ID: degreeId,
      Params.USER_FULL_NAME: fullName,
      Params.DEVICE_MANUFACTURER: manufacturer,
      Params.DEVICE_MODEL: model,
      Params.DEVICE_PLATFORM: platform,
      Params.APP_VERSION_PARAM: appVersion,
      Params.DEVICE_TOKEN: token,
      Params.USER_SIGN_UP_SRC: source,
      Params.DEVICE_VERSION: osVersion,
      Params.DEVICE_UUID: serial,
      Params.DEVICE_STATUS: status,
    };
    return await NetworkCalls.postMultipartCall(
        apiUserManualVerifyIobm, params);
  }

  ///
  /// Signup TLE
  /// **********************
  static signupTle({
    email,
    password,
    fullName,
    loginWith,
    dob,
    degreeId,
    studentId,
    phone,
    graduationYear,
    source,
    required manufacturer,
    platform,
    required appVersion,
    required token,
    model,
    osVersion,
    serial,
    status = 'A',
  }) async {
    Map params = {
      Params.USER_EMAIL: email,
      Params.USER_PASSWORD: password,
      Params.USER_LOGIN_WITH: loginWith,
      Params.USER_PHONE: phone,
      Params.USER_DOB: dob,
      Params.USER_FULL_NAME: fullName,
      Params.DEVICE_MANUFACTURER: manufacturer,
      Params.DEVICE_MODEL: model,
      Params.DEVICE_PLATFORM: platform,
      Params.APP_VERSION_PARAM: appVersion,
      Params.DEVICE_TOKEN: token,
      Params.USER_SIGN_UP_SRC: source,
      Params.DEVICE_VERSION: osVersion,
      Params.DEVICE_UUID: serial,
      Params.DEVICE_STATUS: status,
    };
    return await NetworkCalls.postWebCall(apiSignupTLE, params);
  }

  /// ********************************************************
  /// Refer a Friend
  ///
  static referFriend({userId, email, referEmail, status}) async {
    Map params = {
      Params.USER_ID: userId,
      Params.USER_EMAIL: email,
      Params.REFER_EMAIL: referEmail,
      Params.STATUS: status,
    };
    return _condition(apiReferFriend, params);
  }

  ///********************************************************
  /// Youtube Live Session Api
  ///
  static youtubeLive({
    userId,
  }) async {
    Map params = {
      Params.USER_ID: userId,
    };
    return _condition(apiGetYoutubeLive, params);
  }

  //********************************************************
  /// Internal Share Api
  //
  static internalShare({userId, postId}) async {
    Map params = {
      Params.USER_ID: userId,
      Params.POST_ID: postId,
    };
    return _condition(apiInternalShare, params);
  }

  //********************************************************
  /// Boss Forget Password Api
  //
  static bossForget({email}) async {
    Map params = {
      Params.USER_EMAIL: email,
    };
    return await NetworkCalls.postMultipartCall(
      bossForgetPassword,
      params,
    );
  }

  //********************************************************
  /// Report Post
  //
  static reportContent({
    userId,
    contentId,
    reportType,
    comment,
    contentType,
  }) async {
    Map params = {
      Params.USER_ID: userId,
      Params.CONTENT_ID: contentId,
      Params.REPORT_TYPE: reportType,
      Params.ADDITIONAL_COMMENT: comment,
      Params.CONTENT_TYPE: contentType
    };
    return _condition(apiReportContent, params);
  }

  static String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  static String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  ///
  /// apply for card
  static applyCard({userId}) async {
    Map params = {
      Params.USER_ID: userId,
    };
    return _condition(apiCardApply, params);
  }

  /// TLE BUY AND SELL
  /// Get All Products
  static getAllProducts({userId}) async {
    Map params = {
      Params.USER_ID: userId,
    };
    return await NetworkCalls.postWebWithTokenCall(apiGetAllProducts, params);
  }

  /// Get Product Details
  static getProductDetails({userId, productId}) async {
    Map params = {
      Params.USER_ID: userId,
      "id": productId,
    };
    return await NetworkCalls.postMultipartCall(apiGetProductDetail, params);
  }

  /// Get All Categories
  static getCategories({userId}) async {
    Map params = {
      Params.USER_ID: userId,
    };
    return await NetworkCalls.postWebWithTokenCall(apiGetCategories, params);
  }

  /// Insert Product
  static insertProduct({
    productId,
    productMedia,
    userId,
    productName,
    productPrice,
    cityName,
    dueDate,
    category,
    productQty,
    productDesc,
    addedBy,
    isAnonymous,
    isPremium,
  }) async {
    Map params = {
      Params.USER_ID: userId,
      Params.PRODUCT_NAME: productName,
      Params.Product_ID: productId,
      Params.PRODUCT_PRICE: productPrice,
      Params.CITY_NAME: cityName,
      Params.DUE_DATE: dueDate,
      Params.CATEGORY: category.toString(),
      Params.PRODUCT_QTY: productQty,
      Params.PRODUCT_DESCRIPTION: productDesc,
      Params.ADDED_BY: addedBy,
      Params.PRODUCT_MEDIA: productMedia,
      Params.IS_ANONYMOUS: isAnonymous,
      Params.IS_PREMIUM: isPremium,
    };
    return await NetworkCalls.postWebWithTokenCall(apiInsertProduct, params);
  }

  /// Get Checkin Cities
  static searchCity({name}) async {
    Map params = {
      'city_name': name,
    };
    return await NetworkCalls.postWebWithTokenCall(apiSearchCity, params);
  }

  /// Get Checkin Cities
  static getFeelings() async {
    return await NetworkCalls.getWebCallWithToken(apiGetFeelings);
  }

  /// Get Popup Banners TLE
  static getPopupBanners() async {
    return await NetworkCalls.getWebCallWithToken(apiPopupAdds);
  }

  /// Change Banner Status
  static changeBannerStatus() async {
    return await NetworkCalls.getWebCallWithToken(apiChangeBannerStatus);
  }

  /// Add To Favourite Product TLE
  static addFavourite({id, status}) async {
    Map params = {
      Params.Product_ID: id,
      Params.STATUS: status,
    };
    return await NetworkCalls.postWebWithTokenCall(apiAddFavourite, params);
  }

  /// ******************************************************
  /// Stories
  /// Get all stories
  static getStories() async {
    return await NetworkCalls.getWebCallWithToken(apiGetTimeLineStory);
  }

  /// Add all stories
  static addTimelineStory({imagePath, map}) async {
    return await NetworkCalls.uploadFileWithToken(
      url: apiAddTimeLineStory,
      imagePath: imagePath,
      param: "image",
    );
  }

  /// Seen a story
  static seeTimelineStory({storyId}) async {
    Map params = {
      Params.STORY_ID: storyId,
    };
    return await NetworkCalls.postWebWithTokenCall(
      apiSeenTimeLineStory,
      params,
    );
  }

  /// Delete a story
  static deleteTimelineStory({storyId}) async {
    Map params = {
      Params.STORY_ID: storyId,
    };
    return await NetworkCalls.postWebWithTokenCall(
      apiDeleteTimeLineStory,
      params,
    );
  }

  static _condition(url, params) async {
    return AppConstants.appName != 'BOSS'
        ? await NetworkCalls.postWebWithTokenCall(url, params)
        : await NetworkCalls.postMultipartCall(url, params);
  }

  static _conditionCity(url, params) async {
    return await NetworkCalls.postMultipartCityCall(url, params);
  }

  static getReactionDetails({postId, commentId, replyId}) async {
    Map map = {
      Params.POST_ID: postId,
      Params.COMMENT_ID: commentId,
      Params.REPLY_ID: replyId
    };
    return await NetworkCalls.postWebWithTokenCall(apiGetReactionDetails, map);
  }

  static getUpdateUserName({name}) async {
    Map map = {
      "name": name,
    };
    return await NetworkCalls.postWebWithTokenCall(apiUpdateProfile, map);
  }


  /// Seen By
  static seenBy({storyId}) async {
    Map map = {
      Params.STORY_ID: storyId,
    };
    return await NetworkCalls.postWebWithTokenCall(apiSeenByStory, map);
  }

  /// Seen Story
  static seenStory({storyId}) async {
    Map map = {
      Params.STORY_ID: storyId,
    };
    return await NetworkCalls.postWebWithTokenCall(apiSeenTimeLineStory, map);
  }

  static deleteComment({
    commentId,
    replyId,
  }) async {
    Map params = {
      Params.COMMENT_ID: commentId,
      Params.REPLY_ID: replyId,
    };
    return _condition(apiDeleteComment, params);
  }



}
