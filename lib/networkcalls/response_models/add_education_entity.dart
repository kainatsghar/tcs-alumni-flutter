import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';

class AddEducationEntity extends JsonConvert<AddEducationEntity> {
  late int success;
  late String message;
  late AddEducationResult result;
}

class AddEducationResult extends JsonConvert<AddEducationResult> {
  late List<AddEducationResultEducation> education;
}

class AddEducationResultEducation
    extends JsonConvert<AddEducationResultEducation> {
  late String id;
  @JSONField(name: "user_id")
  late String userId;
  late String institute;
  late String program;
  @JSONField(name: "start_date")
  late String startDate;
  @JSONField(name: "end_date")
  late String endDate;
}
