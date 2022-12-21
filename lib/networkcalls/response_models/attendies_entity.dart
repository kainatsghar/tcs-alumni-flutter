import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';
import 'package:iobm/local_db/local_db.dart';

class AttendiesEntity with JsonConvert<AttendiesEntity> {
  late int success;
  late String message;
  late AttendiesResult result;
}

class AttendiesResult with JsonConvert<AttendiesResult> {
  @JSONField(name: "member_details")
  late List<DBAttendie> memberDetails;
}

class AttendiesResultMemberDetails
    with JsonConvert<AttendiesResultMemberDetails> {
  @JSONField(name: "user_id")
  late String userId;
  @JSONField(name: "event_id")
  late String eventId;
  @JSONField(name: "first_name")
  late String firstName;
  @JSONField(name: "last_name")
  late String lastName;
  @JSONField(name: "country_id")
  late String countryId;
  @JSONField(name: "city_id")
  late String cityId;
  @JSONField(name: "branch_id")
  late String branchId;
  @JSONField(name: "graduation_year")
  late String graduationYear;
  late String dob;
  @JSONField(name: "registration_number")
  late String registrationNumber;
  late String phone;
  late String email;
  late String status;
}
