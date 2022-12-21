import 'package:iobm/networkcalls/response_models/attendies_entity.dart';
import 'package:iobm/local_db/local_db.dart';

attendiesEntityFromJson(AttendiesEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['result'] != null) {
    data.result = AttendiesResult().fromJson(json['result']);
  }
  return data;
}

Map<String, dynamic> attendiesEntityToJson(AttendiesEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result.toJson();
  return data;
}

attendiesResultFromJson(AttendiesResult data, Map<String, dynamic> json) {
  if (json['member_details'] != null) {
    data.memberDetails = (json['member_details'] as List)
        .map((v) => DBAttendie.fromJson(v))
        .toList();
  }
  return data;
}

Map<String, dynamic> attendiesResultToJson(AttendiesResult entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['member_details'] = entity.memberDetails.map((v) => v.toJson()).toList();
  return data;
}

attendiesResultMemberDetailsFromJson(
    AttendiesResultMemberDetails data, Map<String, dynamic> json) {
  if (json['user_id'] != null) {
    data.userId = json['user_id'].toString();
  }
  if (json['event_id'] != null) {
    data.eventId = json['event_id'].toString();
  }
  if (json['first_name'] != null) {
    data.firstName = json['first_name'].toString();
  }
  if (json['last_name'] != null) {
    data.lastName = json['last_name'].toString();
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
  if (json['graduation_year'] != null) {
    data.graduationYear = json['graduation_year'].toString();
  }
  if (json['dob'] != null) {
    data.dob = json['dob'].toString();
  }
  if (json['registration_number'] != null) {
    data.registrationNumber = json['registration_number'].toString();
  }
  if (json['phone'] != null) {
    data.phone = json['phone'].toString();
  }
  if (json['email'] != null) {
    data.email = json['email'].toString();
  }
  if (json['status'] != null) {
    data.status = json['status'].toString();
  }
  return data;
}

Map<String, dynamic> attendiesResultMemberDetailsToJson(
    AttendiesResultMemberDetails entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['user_id'] = entity.userId;
  data['event_id'] = entity.eventId;
  data['first_name'] = entity.firstName;
  data['last_name'] = entity.lastName;
  data['country_id'] = entity.countryId;
  data['city_id'] = entity.cityId;
  data['branch_id'] = entity.branchId;
  data['graduation_year'] = entity.graduationYear;
  data['dob'] = entity.dob;
  data['registration_number'] = entity.registrationNumber;
  data['phone'] = entity.phone;
  data['email'] = entity.email;
  data['status'] = entity.status;
  return data;
}
