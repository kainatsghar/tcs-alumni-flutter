import 'package:iobm/networkcalls/response_models/user_profile_entity.dart';

userProfileEntityFromJson(UserProfileEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['result'] != null) {
    data.result = UserProfileResult().fromJson(json['result']);
  }
  return data;
}

Map<String, dynamic> userProfileEntityToJson(UserProfileEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result?.toJson();
  return data;
}

userProfileResultFromJson(UserProfileResult data, Map<String, dynamic> json) {
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
  if (json['user_facebook_url'] != null) {
    data.userfacebookUrl = json['user_facebook_url'].toString();
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
    data.interest = (json['interest'] as List)
        .map((v) => UserProfileResultInterest().fromJson(v))
        .toList();
  }
  if (json['education'] != null) {
    data.education = (json['education'] as List)
        .map((v) => UserProfileResultEducation().fromJson(v))
        .toList();
  }
  if (json['experience'] != null) {
    data.experience = (json['experience'] as List)
        .map((v) => UserProfileResultExperience().fromJson(v))
        .toList();
  }
  if (json['product'] != null) {
    data.product = (json['product'] as List)
        .map((v) => UserProfileResultProduct().fromJson(v))
        .toList();
  }
  return data;
}

Map<String, dynamic> userProfileResultToJson(UserProfileResult entity) {
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
  data['user_facebook_url'] = entity.userfacebookUrl;
  data['connection_status'] = entity.connectionStatus;
  data['is_connected'] = entity.isConnected;
  data['chapter_id'] = entity.chapterId;
  data['chapter_name'] = entity.chapterName;
  data['interest'] = entity.interest?.map((v) => v.toJson()).toList();
  data['education'] = entity.education?.map((v) => v.toJson()).toList();
  data['experience'] = entity.experience?.map((v) => v.toJson()).toList();
  data['product'] = entity.product?.map((v) => v.toJson()).toList();
  return data;
}

userProfileResultInterestFromJson(
    UserProfileResultInterest data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['user_id'] != null) {
    data.userId = json['user_id'].toString();
  }
  if (json['interest'] != null) {
    data.interest = json['interest'].toString();
  }
  return data;
}

Map<String, dynamic> userProfileResultInterestToJson(
    UserProfileResultInterest entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['user_id'] = entity.userId;
  data['interest'] = entity.interest;
  return data;
}

userProfileResultEducationFromJson(
    UserProfileResultEducation data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['user_id'] != null) {
    data.userId = json['user_id'].toString();
  }
  if (json['institute'] != null) {
    data.institute = json['institute'].toString();
  }
  if (json['program'] != null) {
    data.program = json['program'].toString();
  }
  if (json['start_date'] != null) {
    data.startDate = json['start_date'].toString();
  }
  if (json['end_date'] != null) {
    data.endDate = json['end_date'].toString();
  }
  return data;
}

Map<String, dynamic> userProfileResultEducationToJson(
    UserProfileResultEducation entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['user_id'] = entity.userId;
  data['institute'] = entity.institute;
  data['program'] = entity.program;
  data['start_date'] = entity.startDate;
  data['end_date'] = entity.endDate;
  return data;
}

userProfileResultExperienceFromJson(
    UserProfileResultExperience data, Map<String, dynamic> json) {
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

Map<String, dynamic> userProfileResultExperienceToJson(
    UserProfileResultExperience entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
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

userProfileResultProductFromJson(
    UserProfileResultProduct data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['added_by'] != null) {
    data.addedBy = json['added_by'].toString();
  }
  if (json['cover_image'] != null) {
    data.coverImage = json['cover_image'].toString();
  }
  if (json['product_name'] != null) {
    data.productName = json['product_name'].toString();
  }
  if (json['product_price'] != null) {
    data.productPrice = json['product_price'].toString();
  }
  if (json['category'] != null) {
    data.category = json['category'].toString();
  }
  if (json['city_name'] != null) {
    data.cityName = json['city_name'].toString();
  }
  if (json['product_qty'] != null) {
    data.productQty = json['product_qty'].toString();
  }
  if (json['product_desc'] != null) {
    data.productDescription = json['product_desc'].toString();
  }
  if (json['is_active'] != null) {
    data.isActive = json['is_active'].toString();
  }
  if (json['due_date'] != null) {
    data.dueDate = json['due_date'].toString();
  }
  if (json['is_anonymous'] != null) {
    data.isAnonymous = json['is_anonymous'].toString();
  }
  if (json['is_premium'] != null) {
    data.isPremium = json['is_premium'].toString();
  }
  if (json['posted_by'] != null) {
    data.postedBy = json['posted_by'].toString();
  }
  return data;
}

Map<String, dynamic> userProfileResultProductToJson(
    UserProfileResultProduct entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['added_by'] = entity.addedBy;
  data['cover_image'] = entity.coverImage;
  data['product_name'] = entity.productName;
  data['product_price'] = entity.productPrice;
  data['category'] = entity.category;
  data['city_name'] = entity.cityName;
  data['product_qty'] = entity.productQty;
  data['product_desc'] = entity.productDescription;
  data['is_active'] = entity.isActive;
  data['due_date'] = entity.dueDate;
  data['is_anonymous'] = entity.isAnonymous;
  data['is_premium'] = entity.isPremium;
  data['posted_by'] = entity.postedBy;
  return data;
}
