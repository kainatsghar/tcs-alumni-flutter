import 'package:iobm/generated/json/base/json_convert_content.dart';

class ErrorEntity with JsonConvert<ErrorEntity> {
  late int success;
  late String message;
}
