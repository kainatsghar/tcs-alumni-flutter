import 'package:iobm/networkcalls/response_models/all_users_entity.dart';
import 'package:iobm/local_db/local_db.dart';

allUsersEntityFromJson(AllUsersEntity data, Map<String, dynamic> json) {
  if (json['users_count'] != null) {
    data.usersCount = json['users_count'] is String
        ? int.tryParse(json['users_count'])
        : json['users_count'].toInt();
  }
  if (json['current_page'] != null) {
    data.currentPage = json['current_page'].toString();
  }
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['result'] != null) {
    data.result =
        (json['result'] as List).map((v) => DBAllUser.fromJson(v)).toList();
  }
  if (json['max_page_number'] != null) {
    data.maxPageNumber = json['max_page_number'] is String
        ? int.tryParse(json['max_page_number'])
        : json['max_page_number'].toInt();
  }
  return data;
}

Map<String, dynamic> allUsersEntityToJson(AllUsersEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['users_count'] = entity.usersCount;
  data['current_page'] = entity.currentPage;
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result?.map((v) => v.toJson()).toList();
  data['max_page_number'] = entity.maxPageNumber;
  return data;
}
