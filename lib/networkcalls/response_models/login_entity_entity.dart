import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';

class LoginEntityEntity with JsonConvert<LoginEntityEntity> {
  int? success;
  String? message;
  @JSONField(name: "unread_count")
  String? unreadCount;
  LoginEntityResult? result;
}

class LoginEntityResult with JsonConvert<LoginEntityResult> {
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
  @JSONField(name: "bss_student_id")
  String? bssStudentId;
  String? dob;
  String? cnic;
  @JSONField(name: "registration_number")
  String? registrationNumber;
  String? phone;
  String? email;
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
  String? image;
  @JSONField(name: "connection_status")
  String? connectionStatus;
  @JSONField(name: "is_connected")
  String? isConnected;
  @JSONField(name: "chapter_id")
  String? chapterId;
  @JSONField(name: "chapter_name")
  String? chapterName;
  String? token;
  List<LoginEntityResultInterest>? interest;
  List<LoginEntityResultEducation>? education;
  List<LoginEntityResultExperience>? experience;
}

class LoginEntityResultInterest with JsonConvert<LoginEntityResultInterest> {
  String? id;
  @JSONField(name: "user_id")
  String? userId;
  String? interest;
}

class LoginEntityResultEducation with JsonConvert<LoginEntityResultEducation> {
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

class LoginEntityResultExperience
    with JsonConvert<LoginEntityResultExperience> {
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
