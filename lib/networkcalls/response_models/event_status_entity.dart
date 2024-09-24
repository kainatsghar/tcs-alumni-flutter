import 'package:iobm/generated/json/base/json_convert_content.dart';

class EventStatusEntity extends JsonConvert<EventStatusEntity> {
  late int success;
  late String message;
  late EventStatusResult result;
}

class EventStatusResult extends JsonConvert<EventStatusResult> {
  late String interested;
  late String going;
  late String likes;
}
