import 'package:iobm/networkcalls/response_models/jobs_entity.dart';
import 'package:iobm/local_db/local_db.dart';

jobsEntityFromJson(JobsEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['result'] != null) {
    data.result = JobsResult().fromJson(json['result']);
  }
  return data;
}

Map<String, dynamic> jobsEntityToJson(JobsEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result.toJson();
  return data;
}

jobsResultFromJson(JobsResult data, Map<String, dynamic> json) {
  if (json['jobs'] != null) {
    data.jobs = (json['jobs'] as List).map((v) => DBJob.fromJson(v)).toList();
  }
  return data;
}

Map<String, dynamic> jobsResultToJson(JobsResult entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['jobs'] = entity.jobs.map((v) => v.toJson()).toList();
  return data;
}

jobsResultJobsFromJson(JobsResultJobs data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['designation'] != null) {
    data.designation = json['designation'].toString();
  }
  if (json['company_name'] != null) {
    data.companyName = json['company_name'].toString();
  }
  if (json['job_link'] != null) {
    data.jobLink = json['job_link'].toString();
  }
  if (json['created_at'] != null) {
    data.createdAt = json['created_at'].toString();
  }
  if (json['due_date'] != null) {
    data.dueDate = json['due_date'].toString();
  }
  if (json['posted_by'] != null) {
    data.postedBy = json['posted_by'].toString();
  }
  if (json['first_name'] != null) {
    data.firstName = json['first_name'].toString();
  }
  if (json['last_name'] != null) {
    data.lastName = json['last_name'].toString();
  }
  if (json['user_image'] != null) {
    data.userImage = json['user_image'].toString();
  }
  return data;
}

Map<String, dynamic> jobsResultJobsToJson(JobsResultJobs entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['designation'] = entity.designation;
  data['company_name'] = entity.companyName;
  data['job_link'] = entity.jobLink;
  data['created_at'] = entity.createdAt;
  data['due_date'] = entity.dueDate;
  data['posted_by'] = entity.postedBy;
  data['first_name'] = entity.firstName;
  data['last_name'] = entity.lastName;
  data['user_image'] = entity.userImage;
  return data;
}
