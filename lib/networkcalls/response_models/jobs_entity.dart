import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';
import 'package:iobm/local_db/local_db.dart';

class JobsEntity with JsonConvert<JobsEntity> {
  late int success;
  late String message;
  late JobsResult result;
}

class JobsResult with JsonConvert<JobsResult> {
  late List<DBJob> jobs;
}

class JobsResultJobs with JsonConvert<JobsResultJobs> {
  late String id;
  late String designation;
  @JSONField(name: "company_name")
  late String companyName;
  @JSONField(name: "job_link")
  late String jobLink;
  @JSONField(name: "created_at")
  late String createdAt;
  @JSONField(name: "due_date")
  late String dueDate;
  @JSONField(name: "posted_by")
  late String postedBy;
  @JSONField(name: "first_name")
  late String firstName;
  @JSONField(name: "last_name")
  late String lastName;
  @JSONField(name: "user_image")
  late String userImage;
}
