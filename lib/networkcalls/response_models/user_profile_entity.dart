import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';

class UserProfileEntity with JsonConvert<UserProfileEntity> {
  int? success;
  String? message;
  UserProfileResult? result;
}

class UserProfileResult with JsonConvert<UserProfileResult> {
  @JSONField(name: "user_id")
  String? userId;
  @JSONField(name: "login_with")
  String? loginWith;
  @JSONField(name: "first_name")
  String? firstName;
  @JSONField(name: "last_name")
  String? lastName;
  @JSONField(name: "country_id")
  String? countryId;
  @JSONField(name: "is_registered")
  String? isRegistered;
  @JSONField(name: "city_id")
  String? cityId;
  @JSONField(name: "branch_id")
  String? branchId;
  @JSONField(name: "branch_name")
  String? branchName;
  @JSONField(name: "company_id")
  String? companyId;
  @JSONField(name: "organization_name")
  String? organizationName;
  String? designation;
  @JSONField(name: "industry_name")
  String? industryName;
  @JSONField(name: "graduation_year")
  String? graduationYear;
  String? description;
  String? dob;
  String? cnic;
  @JSONField(name: "registration_number")
  String? registrationNumber;
  String? phone;
  String? email;
  String? image;
  @JSONField(name: "current_city_id")
  String? currentCityId;
  @JSONField(name: "current_city_name")
  String? currentCityName;
  String? latitude;
  String? longitude;
  @JSONField(name: "chapter_designation")
  String? chapterDesignation;
  @JSONField(name: "is_mentor")
  String? isMentor;
  @JSONField(name: "is_verified")
  String? isVerified;
  @JSONField(name: "is_update")
  String? isUpdate;
  @JSONField(name: "chat_invitation_status")
  String? chatInvitationStatus;
  @JSONField(name: "is_deleted")
  String? isDeleted;
  @JSONField(name: "is_sharing_loc")
  String? isSharingLoc;
  @JSONField(name: "user_linkedin_url")
  String? userLinkedinUrl;
  @JSONField(name: "user_facebook_url")
  String? userfacebookUrl;
  @JSONField(name: "connection_status")
  String? connectionStatus;
  @JSONField(name: "is_connected")
  String? isConnected;
  @JSONField(name: "chapter_id")
  String? chapterId;
  @JSONField(name: "chapter_name")
  String? chapterName;
  List<UserProfileResultInterest>? interest;
  List<UserProfileResultEducation>? education;
  List<UserProfileResultExperience>? experience;
  List<UserProfileResultProduct>? product;
}

class UserProfileResultInterest with JsonConvert<UserProfileResultInterest> {
  String? id;
  @JSONField(name: "user_id")
  String? userId;
  String? interest;
}

class UserProfileResultEducation with JsonConvert<UserProfileResultEducation> {
  String? id;
  @JSONField(name: "user_id")
  String? userId;
  String? institute;
  String? program;
  @JSONField(name: "start_date")
  String? startDate;
  @JSONField(name: "end_date")
  String? endDate;
}

class UserProfileResultExperience
    with JsonConvert<UserProfileResultExperience> {
  String? id;
  @JSONField(name: "user_id")
  String? userId;
  String? position;
  @JSONField(name: "campany_name")
  String? campanyName;
  @JSONField(name: "company_image")
  String? companyImage;
  @JSONField(name: "logo_changeable")
  String? logoChangeable;
  @JSONField(name: "start_date")
  String? startDate;
  @JSONField(name: "end_date")
  String? endDate;
  @JSONField(name: "company_id")
  String? companyId;
}
class UserProfileResultProduct
    with JsonConvert<UserProfileResultProduct> {
  String? id;
  @JSONField(name: "cover_image")
  String? coverImage;
  @JSONField(name: "product_name")
  String? productName;
  @JSONField(name: "product_price")
  String? productPrice;
  @JSONField(name: "category")
  String? category;
  @JSONField(name: "city_name")
  String? cityName;
  @JSONField(name: "product_qty")
  String? productQty;
  @JSONField(name: "product_desc")
  String? productDescription;
  @JSONField(name: "is_active")
  String? isActive;
  @JSONField(name: "added_by")
  String? addedBy;
  @JSONField(name: "due_date")
  String? dueDate;
  @JSONField(name: "is_anonymous")
  String? isAnonymous;
  @JSONField(name: "is_premium")
  String? isPremium;
  @JSONField(name: "posted_by")
  String? postedBy;
}
