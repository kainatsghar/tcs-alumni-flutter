import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';

class GetInvitationEntity with JsonConvert<GetInvitationEntity> {
  late int success;
  late String message;
  late GetInvitationResult result;
}

class GetInvitationResult with JsonConvert<GetInvitationResult> {
  @JSONField(name: "sender_id")
  late String senderId;
  @JSONField(name: "reciver_id")
  late String reciverId;
  late String status;
  @JSONField(name: "block_by")
  late String blockBy;
  late GetInvitationResultReceiver receiver;
  late List<GetInvitationResultDevices> devices;
}

class GetInvitationResultReceiver
    with JsonConvert<GetInvitationResultReceiver> {
  @JSONField(name: "user_id")
  late String userId;
  @JSONField(name: "login_with")
  late String loginWith;
  @JSONField(name: "first_name")
  late String firstName;
  @JSONField(name: "last_name")
  late String lastName;
  @JSONField(name: "country_id")
  late String countryId;
  @JSONField(name: "is_registered")
  late String isRegistered;
  @JSONField(name: "city_id")
  late String cityId;
  @JSONField(name: "branch_id")
  late String branchId;
  @JSONField(name: "branch_name")
  late String branchName;
  @JSONField(name: "company_id")
  late String companyId;
  @JSONField(name: "organization_name")
  late String organizationName;
  late String designation;
  @JSONField(name: "industry_name")
  late String industryName;
  @JSONField(name: "graduation_year")
  late String graduationYear;
  late String description;
  late String dob;
  late String cnic;
  @JSONField(name: "registration_number")
  late String registrationNumber;
  late String phone;
  late String email;
  late String image;
  @JSONField(name: "current_city_id")
  late String currentCityId;
  @JSONField(name: "current_city_name")
  late String currentCityName;
  late String latitude;
  late String longitude;
  @JSONField(name: "chapter_designation")
  late String chapterDesignation;
  @JSONField(name: "is_mentor")
  late String isMentor;
  @JSONField(name: "is_verified")
  late String isVerified;
  @JSONField(name: "is_update")
  late String isUpdate;
  @JSONField(name: "chat_invitation_status")
  late String chatInvitationStatus;
  @JSONField(name: "is_deleted")
  late String isDeleted;
  @JSONField(name: "is_sharing_loc")
  late String isSharingLoc;
  @JSONField(name: "user_linkedin_url")
  late String userLinkedinUrl;
  @JSONField(name: "connection_status")
  late String connectionStatus;
  @JSONField(name: "is_connected")
  late String isConnected;
  @JSONField(name: "chapter_id")
  late String chapterId;
  @JSONField(name: "chapter_name")
  late String chapterName;
  late List<dynamic> interest;
  late List<dynamic> education;
  late List<GetInvitationResultReceiverExperience> experience;
}

class GetInvitationResultReceiverExperience
    with JsonConvert<GetInvitationResultReceiverExperience> {
  late String id;
  @JSONField(name: "user_id")
  late String userId;
  late String position;
  @JSONField(name: "campany_name")
  late String campanyName;
  @JSONField(name: "company_image")
  late String companyImage;
  @JSONField(name: "logo_changeable")
  late String logoChangeable;
  @JSONField(name: "start_date")
  late String startDate;
  @JSONField(name: "end_date")
  late String endDate;
  @JSONField(name: "company_id")
  late String companyId;
}

class GetInvitationResultDevices with JsonConvert<GetInvitationResultDevices> {
  late String id;
  @JSONField(name: "user_id")
  late String userId;
  late String token;
  late String status;
}
