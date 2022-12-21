import 'package:iobm/networkcalls/response_models/spotlight_alumini_entity.dart';

spotlightAluminiEntityFromJson(
    SpotlightAluminiEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['spotlight'] != null) {
    data.spotlight = SpotlightAluminiSpotlight().fromJson(json['spotlight']);
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  return data;
}

Map<String, dynamic> spotlightAluminiEntityToJson(
    SpotlightAluminiEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = entity.success;
  data['spotlight'] = entity.spotlight?.toJson();
  data['message'] = entity.message;
  return data;
}

spotlightAluminiSpotlightFromJson(
    SpotlightAluminiSpotlight data, Map<String, dynamic> json) {
  if (json['user_id'] != null) {
    data.userId = json['user_id'].toString();
  }
  if (json['login_with'] != null) {
    data.loginWith = json['login_with'].toString();
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
  if (json['is_registered'] != null) {
    data.isRegistered = json['is_registered'].toString();
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
  if (json['organization_name'] != null) {
    data.organizationName = json['organization_name'].toString();
  }
  if (json['designation'] != null) {
    data.designation = json['designation'].toString();
  }
  if (json['industry_name'] != null) {
    data.industryName = json['industry_name'];
  }
  if (json['graduation_year'] != null) {
    data.graduationYear = json['graduation_year'].toString();
  }
  if (json['description'] != null) {
    data.description = json['description'];
  }
  if (json['dob'] != null) {
    data.dob = json['dob'].toString();
  }
  if (json['cnic'] != null) {
    data.cnic = json['cnic'].toString();
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
  if (json['image'] != null) {
    data.image = json['image'].toString();
  }
  if (json['current_city_id'] != null) {
    data.currentCityId = json['current_city_id'].toString();
  }
  if (json['current_city_name'] != null) {
    data.currentCityName = json['current_city_name'].toString();
  }
  if (json['latitude'] != null) {
    data.latitude = json['latitude'].toString();
  }
  if (json['longitude'] != null) {
    data.longitude = json['longitude'].toString();
  }
  if (json['chapter_designation'] != null) {
    data.chapterDesignation = json['chapter_designation'];
  }
  if (json['is_mentor'] != null) {
    data.isMentor = json['is_mentor'].toString();
  }
  if (json['is_verified'] != null) {
    data.isVerified = json['is_verified'].toString();
  }
  if (json['is_update'] != null) {
    data.isUpdate = json['is_update'].toString();
  }
  if (json['is_deleted'] != null) {
    data.isDeleted = json['is_deleted'].toString();
  }
  if (json['connection_status'] != null) {
    data.connectionStatus = json['connection_status'].toString();
  }
  if (json['is_connected'] != null) {
    data.isConnected = json['is_connected'].toString();
  }
  if (json['chapter_id'] != null) {
    data.chapterId = json['chapter_id'].toString();
  }
  if (json['chapter_name'] != null) {
    data.chapterName = json['chapter_name'].toString();
  }
  return data;
}

Map<String, dynamic> spotlightAluminiSpotlightToJson(
    SpotlightAluminiSpotlight entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['user_id'] = entity.userId;
  data['login_with'] = entity.loginWith;
  data['first_name'] = entity.firstName;
  data['last_name'] = entity.lastName;
  data['country_id'] = entity.countryId;
  data['is_registered'] = entity.isRegistered;
  data['city_id'] = entity.cityId;
  data['branch_id'] = entity.branchId;
  data['branch_name'] = entity.branchName;
  data['organization_name'] = entity.organizationName;
  data['designation'] = entity.designation;
  data['industry_name'] = entity.industryName;
  data['graduation_year'] = entity.graduationYear;
  data['description'] = entity.description;
  data['dob'] = entity.dob;
  data['cnic'] = entity.cnic;
  data['registration_number'] = entity.registrationNumber;
  data['phone'] = entity.phone;
  data['email'] = entity.email;
  data['image'] = entity.image;
  data['current_city_id'] = entity.currentCityId;
  data['current_city_name'] = entity.currentCityName;
  data['latitude'] = entity.latitude;
  data['longitude'] = entity.longitude;
  data['chapter_designation'] = entity.chapterDesignation;
  data['is_mentor'] = entity.isMentor;
  data['is_verified'] = entity.isVerified;
  data['is_update'] = entity.isUpdate;
  data['is_deleted'] = entity.isDeleted;
  data['connection_status'] = entity.connectionStatus;
  data['is_connected'] = entity.isConnected;
  data['chapter_id'] = entity.chapterId;
  data['chapter_name'] = entity.chapterName;
  return data;
}
