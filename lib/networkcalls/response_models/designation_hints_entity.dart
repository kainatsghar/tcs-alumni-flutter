import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';
import 'package:iobm/local_db/local_db.dart';

class DesignationHintsEntity extends JsonConvert<DesignationHintsEntity> {
  int? success;
  String? message;
  List<DBDesignation>? designations;
}

class DesignationHintsDesignations
    extends JsonConvert<DesignationHintsDesignations> {
  String? id;
  String? name;
  @JSONField(name: "is_active")
  String? isActive;
  @JSONField(name: "is_deleted")
  String? isDeleted;
  @JSONField(name: "update_date")
  String? updateDate;
}
