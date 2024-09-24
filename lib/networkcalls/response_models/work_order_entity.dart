import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';
import 'package:iobm/local_db/local_db.dart';

class WorkOrderEntity extends JsonConvert<WorkOrderEntity> {
  int? success;
  String? message;
  List<DBWorkOrder>? result;
}

class WorkOrderResult extends JsonConvert<WorkOrderResult> {
  String? id;
  String? designation;
  @JSONField(name: "work_description")
  String? workDescription;
  @JSONField(name: "due_date")
  String? dueDate;
  @JSONField(name: "company_name")
  String? companyName;
  String? document;
  @JSONField(name: "created_at")
  String? createdAt;
  @JSONField(name: "posted_by")
  String? postedBy;
  @JSONField(name: "first_name")
  String? firstName;
  @JSONField(name: "last_name")
  String? lastName;
  @JSONField(name: "user_image")
  String? userImage;
}
