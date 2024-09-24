import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';

class InsertJobEntity extends JsonConvert<InsertJobEntity> {
  late int success;
  late String message;
  late InsertJobResult result;
}

class InsertJobResult extends JsonConvert<InsertJobResult> {
  late List<InsertJobResultJobs> jobs;
}

class InsertJobResultJobs extends JsonConvert<InsertJobResultJobs> {
  late String id;
  late String designation;
  @JSONField(name: "company_name")
  late String companyName;
  @JSONField(name: "job_link")
  late String jobLink;
  @JSONField(name: "posted_by")
  late String postedBy;
  @JSONField(name: "created_at")
  late String createdAt;
  @JSONField(name: "due_date")
  late String dueDate;
}
