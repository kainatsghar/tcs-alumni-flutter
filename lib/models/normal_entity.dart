import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/models/error_entity.dart';

class NormalEntity extends JsonConvert<ErrorEntity>{
  late int success;
  late String message;
}
