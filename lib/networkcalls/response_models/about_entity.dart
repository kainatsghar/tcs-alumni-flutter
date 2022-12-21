import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';

class AboutEntity with JsonConvert<AboutEntity> {
  late int success;
  late String message;
  late AboutResult result;
}

class AboutResult with JsonConvert<AboutResult> {
  late String mission;
  late String vission;
  @JSONField(name: "message_from_ce")
  late String messageFromCe;
  @JSONField(name: "message_from_oar")
  late String messageFromOar;
  late String objective;
}
