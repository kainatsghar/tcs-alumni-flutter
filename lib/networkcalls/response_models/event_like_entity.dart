import 'package:iobm/generated/json/base/json_convert_content.dart';

class EventLikeEntity with JsonConvert<EventLikeEntity> {
  int? success;
  String? message;
  EventLikeResult? result;
}

class EventLikeResult with JsonConvert<EventLikeResult> {
  int? likes;
}
