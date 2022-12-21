import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';

class AddExperienceEntity with JsonConvert<AddExperienceEntity> {
  late int success;
  late String message;
  late AddExperienceResult result;
}

class AddExperienceResult with JsonConvert<AddExperienceResult> {
  late List<AddExperienceResultExperience> experience;
}

class AddExperienceResultExperience
    with JsonConvert<AddExperienceResultExperience> {
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
}
