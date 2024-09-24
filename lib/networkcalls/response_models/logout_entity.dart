import 'package:iobm/generated/json/base/json_convert_content.dart';

class LogoutEntity extends JsonConvert<LogoutEntity> {
  late int success;
  late String message;
  late LogoutResult result;
}

class LogoutResult extends JsonConvert<LogoutResult> {
  late bool status;
}
