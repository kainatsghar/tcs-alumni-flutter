import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';
import 'package:iobm/local_db/local_db.dart';

class FaqEntity with JsonConvert<FaqEntity> {
  late int success;
  late String message;
  late List<DBFaq> result;
}
