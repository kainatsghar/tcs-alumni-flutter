import 'package:iobm/networkcalls/response_models/boss_search_entity.dart';

bossSearchEntityFromJson(BossSearchEntity data, Map<String, dynamic> json) {
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
        .map((v) => BossSearchResult().fromJson(v))
        .toList();
  }
  return data;
}

Map<String, dynamic> bossSearchEntityToJson(BossSearchEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result?.map((v) => v.toJson()).toList();
  return data;
}

bossSearchResultFromJson(BossSearchResult data, Map<String, dynamic> json) {
  if (json['user_id'] != null) {
    data.userId = json['user_id'].toString();
  }
  if (json['first_name'] != null) {
    data.firstName = json['first_name'].toString();
  }
  if (json['last_name'] != null) {
    data.lastName = json['last_name'].toString();
  }
  if (json['registration_number'] != null) {
    data.registrationNumber = json['registration_number'].toString();
  }
  if (json['father_name'] != null) {
    data.fatherName = json['father_name'].toString();
  }
  if (json['country_id'] != null) {
    data.countryId = json['country_id'].toString();
  }
  if (json['city_id'] != null) {
    data.cityId = json['city_id'].toString();
  }
  if (json['branch_id'] != null) {
    data.branchId = json['branch_id'].toString();
  }
  if (json['branch_name'] != null) {
    data.branchName = json['branch_name'].toString();
  }
  if (json['graduation_year'] != null) {
    data.graduationYear = json['graduation_year'].toString();
  }
  if (json['description'] != null) {
    data.description = json['description'].toString();
  }
  if (json['dob'] != null) {
    data.dob = json['dob'].toString();
  }
  if (json['bss_student_id'] != null) {
    data.bssStudentId = json['bss_student_id'].toString();
  }
  if (json['phone'] != null) {
    data.phone = json['phone'].toString();
  }
  if (json['email'] != null) {
    data.email = json['email'].toString();
  }
  return data;
}

Map<String, dynamic> bossSearchResultToJson(BossSearchResult entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['user_id'] = entity.userId;
  data['first_name'] = entity.firstName;
  data['last_name'] = entity.lastName;
  data['registration_number'] = entity.registrationNumber;
  data['father_name'] = entity.fatherName;
  data['country_id'] = entity.countryId;
  data['city_id'] = entity.cityId;
  data['branch_id'] = entity.branchId;
  data['branch_name'] = entity.branchName;
  data['graduation_year'] = entity.graduationYear;
  data['description'] = entity.description;
  data['dob'] = entity.dob;
  data['bss_student_id'] = entity.bssStudentId;
  data['phone'] = entity.phone;
  data['email'] = entity.email;
  return data;
}
