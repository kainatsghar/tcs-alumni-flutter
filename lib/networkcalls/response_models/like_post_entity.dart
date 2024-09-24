import 'package:iobm/generated/json/base/json_convert_content.dart';

class LikePostEntity extends JsonConvert<LikePostEntity> {
  late int success;
  late String message;
  late LikePostResult result;
}

class LikePostResult extends JsonConvert<LikePostResult> {
  late int likes;
}
