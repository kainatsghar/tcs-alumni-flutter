import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';

class SpotlightAluminiEntity with JsonConvert<SpotlightAluminiEntity> {
  int? success;
  SpotlightAluminiSpotlight? spotlight;
  String? message;
}

class SpotlightAluminiSpotlight with JsonConvert<SpotlightAluminiSpotlight> {
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
  @JSONField(name: "organization_name")
  String? organizationName;
  String? designation;
  @JSONField(name: "industry_name")
  dynamic industryName;
  @JSONField(name: "graduation_year")
  String? graduationYear;
  dynamic description;
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
  dynamic chapterDesignation;
  @JSONField(name: "is_mentor")
  String? isMentor;
  @JSONField(name: "is_verified")
  String? isVerified;
  @JSONField(name: "is_update")
  String? isUpdate;
  @JSONField(name: "is_deleted")
  String? isDeleted;
  @JSONField(name: "connection_status")
  String? connectionStatus;
  @JSONField(name: "is_connected")
  String? isConnected;
  @JSONField(name: "chapter_id")
  String? chapterId;
  @JSONField(name: "chapter_name")
  String? chapterName;
}
