import 'package:iobm/networkcalls/response_models/get_invitation_entity.dart';

getInvitationEntityFromJson(
    GetInvitationEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['result'] != null) {
    data.result = GetInvitationResult().fromJson(json['result']);
  }
  return data;
}

Map<String, dynamic> getInvitationEntityToJson(GetInvitationEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result.toJson();
  return data;
}

getInvitationResultFromJson(
    GetInvitationResult data, Map<String, dynamic> json) {
  if (json['sender_id'] != null) {
    data.senderId = json['sender_id'].toString();
  }
  if (json['reciver_id'] != null) {
    data.reciverId = json['reciver_id'].toString();
  }
  if (json['status'] != null) {
    data.status = json['status'].toString();
  }
  if (json['block_by'] != null) {
    data.blockBy = json['block_by'].toString();
  }
  if (json['receiver'] != null) {
    data.receiver = GetInvitationResultReceiver().fromJson(json['receiver']);
  }
  if (json['devices'] != null) {
    data.devices = (json['devices'] as List)
        .map((v) => GetInvitationResultDevices().fromJson(v))
        .toList();
  }
  return data;
}

Map<String, dynamic> getInvitationResultToJson(GetInvitationResult entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['sender_id'] = entity.senderId;
  data['reciver_id'] = entity.reciverId;
  data['status'] = entity.status;
  data['block_by'] = entity.blockBy;
  data['receiver'] = entity.receiver.toJson();
  data['devices'] = entity.devices.map((v) => v.toJson()).toList();
  return data;
}

getInvitationResultReceiverFromJson(
    GetInvitationResultReceiver data, Map<String, dynamic> json) {
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
  if (json['company_id'] != null) {
    data.companyId = json['company_id'].toString();
  }
  if (json['organization_name'] != null) {
    data.organizationName = json['organization_name'].toString();
  }
  if (json['designation'] != null) {
    data.designation = json['designation'].toString();
  }
  if (json['industry_name'] != null) {
    data.industryName = json['industry_name'].toString();
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
    data.chapterDesignation = json['chapter_designation'].toString();
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
  if (json['chat_invitation_status'] != null) {
    data.chatInvitationStatus = json['chat_invitation_status'].toString();
  }
  if (json['is_deleted'] != null) {
    data.isDeleted = json['is_deleted'].toString();
  }
  if (json['is_sharing_loc'] != null) {
    data.isSharingLoc = json['is_sharing_loc'].toString();
  }
  if (json['user_linkedin_url'] != null) {
    data.userLinkedinUrl = json['user_linkedin_url'].toString();
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
  if (json['interest'] != null) {
    data.interest =
        (json['interest'] as List).map((v) => v).toList().cast<dynamic>();
  }
  if (json['education'] != null) {
    data.education =
        (json['education'] as List).map((v) => v).toList().cast<dynamic>();
  }
  if (json['experience'] != null) {
    data.experience = (json['experience'] as List)
        .map((v) => GetInvitationResultReceiverExperience().fromJson(v))
        .toList();
  }
  return data;
}

Map<String, dynamic> getInvitationResultReceiverToJson(
    GetInvitationResultReceiver entity) {
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
  data['company_id'] = entity.companyId;
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
  data['chat_invitation_status'] = entity.chatInvitationStatus;
  data['is_deleted'] = entity.isDeleted;
  data['is_sharing_loc'] = entity.isSharingLoc;
  data['user_linkedin_url'] = entity.userLinkedinUrl;
  data['connection_status'] = entity.connectionStatus;
  data['is_connected'] = entity.isConnected;
  data['chapter_id'] = entity.chapterId;
  data['chapter_name'] = entity.chapterName;
  data['interest'] = entity.interest;
  data['education'] = entity.education;
  data['experience'] = entity.experience.map((v) => v.toJson()).toList();
  return data;
}

getInvitationResultReceiverExperienceFromJson(
    GetInvitationResultReceiverExperience data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['user_id'] != null) {
    data.userId = json['user_id'].toString();
  }
  if (json['position'] != null) {
    data.position = json['position'].toString();
  }
  if (json['campany_name'] != null) {
    data.campanyName = json['campany_name'].toString();
  }
  if (json['company_image'] != null) {
    data.companyImage = json['company_image'].toString();
  }
  if (json['logo_changeable'] != null) {
    data.logoChangeable = json['logo_changeable'].toString();
  }
  if (json['start_date'] != null) {
    data.startDate = json['start_date'].toString();
  }
  if (json['end_date'] != null) {
    data.endDate = json['end_date'].toString();
  }
  if (json['company_id'] != null) {
    data.companyId = json['company_id'].toString();
  }
  return data;
}

Map<String, dynamic> getInvitationResultReceiverExperienceToJson(
    GetInvitationResultReceiverExperience entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['user_id'] = entity.userId;
  data['position'] = entity.position;
  data['campany_name'] = entity.campanyName;
  data['company_image'] = entity.companyImage;
  data['logo_changeable'] = entity.logoChangeable;
  data['start_date'] = entity.startDate;
  data['end_date'] = entity.endDate;
  data['company_id'] = entity.companyId;
  return data;
}

getInvitationResultDevicesFromJson(
    GetInvitationResultDevices data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['user_id'] != null) {
    data.userId = json['user_id'].toString();
  }
  if (json['token'] != null) {
    data.token = json['token'].toString();
  }
  if (json['status'] != null) {
    data.status = json['status'].toString();
  }
  return data;
}

Map<String, dynamic> getInvitationResultDevicesToJson(
    GetInvitationResultDevices entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['user_id'] = entity.userId;
  data['token'] = entity.token;
  data['status'] = entity.status;
  return data;
}
