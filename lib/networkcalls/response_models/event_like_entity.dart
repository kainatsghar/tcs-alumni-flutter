import 'package:iobm/generated/json/base/json_convert_content.dart';

class EventLikeEntity extends JsonConvert<EventLikeEntity> {
  int? success;
  String? message;
  EventLikeResult? result;
}

class EventLikeResult extends JsonConvert<EventLikeResult> {
  int? likes;
}
