import 'package:iobm/generated/json/base/json_convert_content.dart';

class LikePostEntity with JsonConvert<LikePostEntity> {
  late int success;
  late String message;
  late LikePostResult result;
}

class LikePostResult with JsonConvert<LikePostResult> {
  late int likes;
}
