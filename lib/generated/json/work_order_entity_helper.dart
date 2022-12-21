import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/networkcalls/response_models/work_order_entity.dart';

workOrderEntityFromJson(WorkOrderEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['result'] != null) {
    data.result = (json['result'] as List)
        .map((v) => DBWorkOrder.fromJson(v))
        .toList();
  }
  return data;
}

Map<String, dynamic> workOrderEntityToJson(WorkOrderEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result?.map((v) => v.toJson()).toList();
  return data;
}

workOrderResultFromJson(WorkOrderResult data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['designation'] != null) {
    data.designation = json['designation'].toString();
  }
  if (json['work_description'] != null) {
    data.workDescription = json['work_description'].toString();
  }
  if (json['due_date'] != null) {
    data.dueDate = json['due_date'].toString();
  }
  if (json['company_name'] != null) {
    data.companyName = json['company_name'].toString();
  }
  if (json['document'] != null) {
    data.document = json['document'].toString();
  }
  if (json['created_at'] != null) {
    data.createdAt = json['created_at'].toString();
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

Map<String, dynamic> workOrderResultToJson(WorkOrderResult entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['designation'] = entity.designation;
  data['work_description'] = entity.workDescription;
  data['due_date'] = entity.dueDate;
  data['company_name'] = entity.companyName;
  data['document'] = entity.document;
  data['created_at'] = entity.createdAt;
  data['posted_by'] = entity.postedBy;
  data['first_name'] = entity.firstName;
  data['last_name'] = entity.lastName;
  data['user_image'] = entity.userImage;
  return data;
}
