class Params {
  //Signin
  static const String MY_ID =
      "my_id"; // just has one usage in user info api. to check the connection relation
  static const String USER_ID = "user_id";
  static const String USER_EMAIL = "email";
  static const String LINKED_IN_CODE = "code";
  static const String LINKED_IN_URL = "user_linkedin_url";
  // static const String TYPE = "type";
  static const String REFER_EMAIL = "reference_email";
  static const String USER_PASSWORD = "password";

  static const String USER_LOGIN_WITH = "login_with";
  static const String USER_SIGN_UP_SRC = "signup_src";
  static const String LATITUDE = "latitude";
  static const String LONGITUDE = "longitude";
  static const String APP_VERSION_PARAM = "app_version";
  //Signup
  static const String USER_FULL_NAME = "full_name";
  static const String USER_FATHER_NAME = "father_name";
  static const String USER_NAME = 'name';
  static const String USER_FIRST_NAME = "first_name";
  static const String USER_LAST_NAME = "last_name";
  static const String USER_REGISTRATION_NUMBER = "registration_number";
  static const String USER_CONFIRM_PASSWORD = "confirm_password";
  static const String USER_CNIC = "cnic";
  static const String USER_DESCRIPTION = "description";
  static const String USER_PHONE = "phone";
  static const String USER_DOB = "dob";
  static const String GRADUATING_BRANCH_ID = "branch_id";
  static const String STUDENT_ID = 'bss_student_id';
  static const String OTHER_BRANCH_NAME = "branch_name";
  static const String GRADUATING_YEAR = "graduating_year";
  static const String PROGRAM = "program";
  static const String DEGREE_ID = "degree_id";
  static const String WORKING = "working";
  static const String INDUSTRY_NAME = "industry_name";
  static const String ORGANIZATION_DATA = "organization_data";
  static const String DESIGNATION = "designation";
  static const String REFERENCE_EMAIL1 = "reference_email1";
  static const String REFERENCE_EMAIL2 = "reference_email2";
  static const String IMAGE = "image";
  static const String FILE = "file";
  static const String USER_CITY = "city_id";
  static const String USER_COUNTRY = "country_id";

  //Jobs
  static const String JOB_URL = "job_url";
  static const String JOB_ID = "job_id";
  static const String DUE_DATE = "due_date";
  static const String POSTED_BY = "posted_by";
  static const String JOB_IMAGE = "image";

  // Work Order
  static const String WORK_ORDER_ID = "work_order_id";

  //Election
  static const String CHAPTER_ID = "ch_id";
  static const String CHAPTER_IDEE = "chapter_id";

  static const String USER_GENDER = "gender";
  static const String USER_CAST = "cast";
  static const String USER_ADDRESS = "address";
  static const String USER_CITY_ID = "city_id";
  static const String USER_CURRENT_CITY_ID = "current_city_id";
  static const String USER_CURRENT_CITY_NAME = "current_city_name";
  static const String USER_COUNTRY_ID = "country_id";
  static const String USER_OCCUPATION = "occupation";
  static const String USER_SCHOOL_EMPLOYER = "user_type";
  static const String USER_BLOOD_GROUP = "blood_group";
  static const String USER_PROFILE_SHARE = "share_profile";
  static const String IS_APPROVED = "is_approved";
  static const String LAST_SYNC = "last_sync";
  static const String USER_OLD_PASSWORD = "current_password";
  static const String USER_NEW_PASSWORD = "new_password";

  static const String DEVICE_MANUFACTURER = "manufacturer";
  static const String DEVICE_MODEL = "model";
  static const String DEVICE_PLATFORM = "platform";
  static const String DEVICE_UUID = "serial";
  static const String DEVICE_VERSION = "version";
  static const String DEVICE_TOKEN = "token";
  static const String DEVICE_STATUS = "status";

  static const String COUNTRY_ID = "country_id";
  static const String MESSAGE = "message";
  static const String PARAM_SENDER_ID = "sender_id";
  static const String PARAM_RECEIVER_ID = "receiver_id";

  static const String user_id = "user_id";
  static const String mentor_id = "mentor_id";
  static const String email_type = "email_type";

  static const String SHARING_LOC = "sharing_loc";

  static const String TYPE = "type";
  static const String REACTION = "data_reaction"; // Post Reaction

  static const String PARAM_COUNTRY = "country";
  //Post Receipt
  static const String BANK = "bank";
  static const String RECEIPT_NO = "transaction_id";
  static const String AMOUNT = "amount";
  static const String PAYMENT_DATE = "payment_date";

  //params for timeline apis
  static const String TIMELINE_MEDIA = "post_media";
  static const String TIMELINE_TEXT = "post_text";
  static const String COMMENT_TEXT = "text";
  static const String COMMENT_ID = "comment_id";
  static const String TAGGED_USERS = "tags";
  static const String TAGS = "tags";
  static const String COMMENTED_BY = "commented_by";
  static const String POST_ID = "post_id";
  static const String REPLY_ID = "reply_id";
  static const String IS_EDIT = "is_edit";
  static const String CREATED_BY = "created_by";
  static const String POST_TYPE = 'post_type';

  //params for alumni event apis
  static const String ALUMNI_EVENT_TITLE = "title";
  static const String ALUMNI_EVENT_START_DATE = "start_date";
  static const String ALUMNI_EVENT_START_TIME = "start_time";
  static const String ALUMNI_EVENT_VENUE = "venue";
  static const String ALUMNI_EVENT_CITY = "city";
  static const String ALUMNI_EVENT_DESCRIPTION = "description";
  static const String ALUMNI_EVENT_END_DATE = "end_date";
  static const String ALUMNI_EVENT_END_TIME = "end_time";

  static const String EDUCATION_INSTITUTE = "institute";
  static const String EDUCATION_DEGREE = "program";
  static const String COMPANY_ID = "company_id";
  static const String COMPANY_NAME = "company_name";
  static const String EXPERIENCE_POSITION = "position";
  static const String EDUCATION_ID = "education_id";
  static const String EXPERIENCE_ID = "experience_id";
  static const String DESIGNATION_ID = "designation_id";
  static const String INDUSTRY = "industry";
  static const String EVENT_ID = "event_id";
  static const String EVENT_STATUS = "status";

  static const String PARAM_INVITED_MEMBERS = "users";
  static const String IS_PUBLIC = "is_public";

  static const String STATUS = "status"; // going or Interested

  //Interests
  static const String INTEREST = "interest";

  //notification sending params
  static const String API_FCM_SEND = "fcm/send";

  //params csr and gallery
  static const String CSR_ID = "csr_id";
  static const String GALLERY_ID = "gallery_id";

  //params Election
  static const String ELECTION_ID = "election_id";
  static const String NOMINATION_ID = "nomination_id";
  static const String WORK_NUMBER = "work_number";
  static const String WORK_ADDRESS = "work_address";
  static const String ZIP_CODE = "zipcode";
  static const String POSITION = "position";
  static const String SOCIAL_NETWORKS = "alumni_network_or_organization";
  static const String IDEAL_FIT = "ideal_fit_position";
  static const String CHANGE_AMBASSADOR = "change_ambassador";
  static const String VOLUNTEER_CSR = "volunteer_or_community_service";
  static const String LEADERSHIP_QUALITY = "leadership_quality";

  //linked in params
  static const String GRANT_TYPE = "grant_type";
  static const String CODE = "code";
  static const String REDIRECT_URI = "redirect_uri";
  static const String CLIENT_ID = "client_id";
  static const String CLIENT_SECRET = "client_secret";
  static const String LINK = "link";

  //report params
  static const String CONTENT_ID = "content_id";
  static const String CONTENT_TYPE = "content_type";
  static const String REPORT_TYPE = "report_type";
  static const String ADDITIONAL_COMMENT = "comment";

  static const String ISSUE_TEXT = "issue_text";

  /// TLE
  static const String Product_ID = "product_id";
  static const String PRODUCT_PRICE = "product_price";

  static const String PRODUCT_NAME = "product_name";
  static const String CATEGORY = "category";
  static const String PRODUCT_QTY = "product_qty";

  static const String PRODUCT_DESCRIPTION = "product_desc";
  static const String PRODUCT_MEDIA = "product_media";
  static const String IS_ANONYMOUS = "is_anonymous";
  static const String IS_PREMIUM = "is_premium";
  static const String ADDED_BY = "added_by";
  static const String CITY_NAME = "city_name";
  static const String TITLE = "title";
  static const String DESCRIPTION = "description";

  static const String USER_FEELING = "user_feelings";
  static const String CHECK_IN_CITY = "check_in_city";
  static const String STORY_ID = "story_id";
}
