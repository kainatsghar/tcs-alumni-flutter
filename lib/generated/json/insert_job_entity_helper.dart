import 'package:iobm/networkcalls/response_models/insert_job_entity.dart';

insertJobEntityFromJson(InsertJobEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['result'] != null) {
    data.result = InsertJobResult().fromJson(json['result']);
  }
  return data;
}

Map<String, dynamic> insertJobEntityToJson(InsertJobEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result.toJson();
  return data;
}

insertJobResultFromJson(InsertJobResult data, Map<String, dynamic> json) {
  if (json['jobs'] != null) {
    data.jobs = (json['jobs'] as List)
        .map((v) => InsertJobResultJobs().fromJson(v))
        .toList();
  }
  return data;
}

Map<String, dynamic> insertJobResultToJson(InsertJobResult entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['jobs'] = entity.jobs.map((v) => v.toJson()).toList();
  return data;
}

insertJobResultJobsFromJson(
    InsertJobResultJobs data, Map<String, dynamic> json) {
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
  if (json['posted_by'] != null) {
    data.postedBy = json['posted_by'].toString();
  }
  if (json['created_at'] != null) {
    data.createdAt = json['created_at'].toString();
  }
  if (json['due_date'] != null) {
    data.dueDate = json['due_date'].toString();
  }
  return data;
}

Map<String, dynamic> insertJobResultJobsToJson(InsertJobResultJobs entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['designation'] = entity.designation;
  data['company_name'] = entity.companyName;
  data['job_link'] = entity.jobLink;
  data['posted_by'] = entity.postedBy;
  data['created_at'] = entity.createdAt;
  data['due_date'] = entity.dueDate;
  return data;
}
