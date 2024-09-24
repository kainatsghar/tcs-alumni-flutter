import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';

class BossSearchEntity extends JsonConvert<BossSearchEntity> {
  int? success;
  String? message;
  List<BossSearchResult>? result;
}

class BossSearchResult extends JsonConvert<BossSearchResult> {
  @JSONField(name: "user_id")
  String? userId;
  @JSONField(name: "first_name")
  String? firstName;
  @JSONField(name: "last_name")
  String? lastName;
  @JSONField(name: "registration_number")
  String? registrationNumber;
  @JSONField(name: "father_name")
  String? fatherName;
  @JSONField(name: "country_id")
  String? countryId;
  @JSONField(name: "city_id")
  String? cityId;
  @JSONField(name: "branch_id")
  String? branchId;
  @JSONField(name: "branch_name")
  String? branchName;
  @JSONField(name: "graduation_year")
  String? graduationYear;
  String? description;
  String? dob;
  @JSONField(name: "bss_student_id")
  String? bssStudentId;
  String? phone;
  String? email;
}
