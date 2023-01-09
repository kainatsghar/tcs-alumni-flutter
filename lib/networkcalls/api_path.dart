

import 'package:iobm/utils/app_constants.dart';

const String apiLogin = 'api/user_login';
const String apiUserInfo = 'api/user_info';
const String apiGetAllUsers = 'api/get_users?next_page=0&user_id=11556';
const String apiAddEducation = 'api/add_education';
const String apiDeleteEducation = 'api/delete_education';
const String apiSignUpSettings = 'api/signup_setting';
const String apiAddInterest = 'api/add_user_interests';
const String apiDeleteExperience = 'api/delete_experience';
const String apiAddExperience = 'api/add_experience';
const String apiEditDescription = 'api/edit_user_description';
const String apiLoadDesignation = 'api/load_designations';
const String apiLoadCompanies = 'api/load_company_hints';
const String apiUploadUserImage = "api/user_image_update";
const String apiGetJobs = 'api/get_jobs';
const String apiGetWorkOrder = 'api/list_of_work_order';
const String apiChapterDetails = 'api/chapter_detail';
const String apiDelWorkOrder = 'api/delete_work_order';
const String apiSaveWorkOrder = 'api/save_work_order';
const String apiPostJob = 'api/insert_job';
const String apiMentorSub = 'api/mentor_sub_and_unsub';
const String apiUpdateConnectionStatus = 'api/update_connection_status';
const String apiSpotlight = 'api/get_spotlight_alumni';
const String apiTleSpotlight = 'api/list_of_member_spotlight';
const String apiTleFeedback = 'api/insert_feedback';
const String apiBusinessSpotlight = 'api/load_business_spotlight';
const String apiGetEvents = 'api/get_user_events';
const String apiEventDetail = "api/get_event";
const String apiFetchAttendies = 'api/fetch_attendees';
const String apiLoadComments = "api/load_comments";
const String apiFetchCities = 'api/get_cities';
const String apiInsertComment = "api/insert_comment";
const String apiInsertCommentReply = "api/insert_comment_reply";
const String apiGetDiscount = "api/get_discount_partners";
const String apiInsertOffer = "api/insert_offer_discount";
const String apiGetNotifications = "api/get_user_notifications";
const String apiGetGallery = "api/get_gallery";
const String apiGetGalleryImages = "api/get_single_gallery_images";
const String apiSharingLoc = "api/change_sharing_loc";
const String apiUserEventStatus = "api/user_event_status";
const String apiEventLikeUnlike = "api/post_like_and_unlike";
const String apiLogout = "api/insert_user_device";

const String apiGetUserInvitation = "api/get_user_invitation";
const String apiInsertUserInvitation = "api/insert_user_invitation";
const String apiGetCSR = "api/get_csr";
const String apiInsertCSR = "api/insert_csr_response";
const String apiGetFaqs = 'api/get_faqs';
const String apiGetContact = "api/get_contact_us";
const String apiAboutUs = 'api/about_us';
const String apiEditCurrentCity = 'api/edit_current_city';
const String apiChangePassword = "api/change_password";
const String apiSignUp = 'api/signup';
const String apiCheckPhone = 'api/check_phone_email';
const String apiEditUrl = 'api/edit_user_linkedin_url';
const String apiUpdateForgetPassword = "api/update_forgot_password";
const String signupBossSearch = 'Signup/search_users_for_sign_up';
const String signupCityzensSearch = 'api/search_users_for_sign_up';
String apiSignUpSearch = AppConstants.appName == 'BOSS' ? signupBossSearch : signupCityzensSearch;
const String apiReferFriend = "api/refer_a_friend";

///Iobm Signup
const String apiSearchSignupIobm = "api/search_users_for_sign_up";
const String apiUserAutoVerifyIobm = "api/user_signup_auto_verify";
const String apiUserManualVerifyIobm = "api/user_signup_manual_verify";

const String bossForgetPassword = "api/forget_password";
const String apiAutoSignUpBoss = "Signup/user_signup_auto_verify";
const String apiAutoSignUpCityzens = "api/user_signup_auto_verify";
const String apiManualSignupBoss = "Signup/user_signup_manual_verify";
const String apiManualSignupCityzens = "api/user_signup_manual_verify";

const String apiCardApply = "api/save_card_status";
const String apiReportContent = "api/report_content";

///Product
const String apiGetAllProducts = "api/get_allproduct";
const String apiGetCategories = "api/get_allcategories";
const String apiInsertProduct = "api/insert_product";

///Newsfeed
const String apiGetYoutubeLive = "api/get_youtuber";
const String apiInternalShare = "api/internal_share";
const String apiLoadTimeline = "api/load_timeline";
const String apiInsertTimeline = "api/insert_timeline";
const String apiLikeUnlikePost = "api/post_like_and_unlike";
const String apiDeletePost = "api/delete_apost";
const String apiPostComment = "api/insert_comment";
const String apiLoadPostComments = "api/load_comments";
const String apiInsertTimelineImage = "api/upload_timeline_image";
const String apiSearchCity = "api/search_city_by_name";
const String apiGetFeelings = "api/get_feelings";

const String apiGetProductDetails = "product_api/get_product_detail";
const String apiGetProductDetail = "api/get_product_detail";

const String apiGetReactionDetails = "api/post_who_reacted";

///Signup TLE
const String apiSignupTLE = "api/signup";

const String apiPopupAdds = "api/popup-banners";
const String apiChangeBannerStatus = "api/change-banner-status";
const String apiAddFavourite = "api/favourite_product";

/// Stories
//const String apiGetTimeLineStory = "api/timeline_story";
const String apiGetTimeLineStory = "api/timeline_stories";
const String apiAddTimeLineStory = "api/add_timeline_story";
const String apiSeenTimeLineStory = "api/seen_story";
const String apiDeleteTimeLineStory = "api/delete_timeline_story";

const String apiUpdateProfile = "api/update-profile";
const String apiSeenByStory = "api/seen_by";

const String apiDeleteComment = "api/delete_comment";


