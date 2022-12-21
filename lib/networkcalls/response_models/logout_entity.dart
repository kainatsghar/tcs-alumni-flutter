import 'package:iobm/generated/json/base/json_convert_content.dart';

class LogoutEntity with JsonConvert<LogoutEntity> {
  late int success;
  late String message;
  late LogoutResult result;
}

class LogoutResult with JsonConvert<LogoutResult> {
  late bool status;
}
