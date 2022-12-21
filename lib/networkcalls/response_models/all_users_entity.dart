import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';
import 'package:iobm/local_db/local_db.dart';

class AllUsersEntity with JsonConvert<AllUsersEntity> {
  @JSONField(name: "users_count")
  int? usersCount;
  @JSONField(name: "current_page")
  String? currentPage;
  int? success;
  String? message;
  List<DBAllUser>? result;
  @JSONField(name: "max_page_number")
  int? maxPageNumber;
}
