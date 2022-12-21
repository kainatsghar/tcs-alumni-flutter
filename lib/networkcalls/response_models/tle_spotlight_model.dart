// To parse this JSON data, do
//
//     final tleSpotlightModel = tleSpotlightModelFromMap(jsonString);

import 'dart:convert';

class TleSpotlightModel {
  TleSpotlightModel({
    this.success,
    this.message,
    this.result,
  });

  int? success;
  String? message;
  List<Result>? result;

  factory TleSpotlightModel.fromJson(String str) => TleSpotlightModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TleSpotlightModel.fromMap(Map<String, dynamic> json) => TleSpotlightModel(
    success: json["success"],
    message: json["message"],
    result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "message": message,
    "result": List<dynamic>.from(result!.map((x) => x.toMap())),
  };
}

class Result {
  Result({
    this.chapterId,
    this.chapterName,
    this.email,
    this.userRole,
    this.isVerified,
    this.isUpdate,
    this.interest,
    this.education,
    this.experience,
    this.userId,
    this.loginWith,
    this.firstName,
    this.lastName,
    this.countryId,
    this.cityId,
    this.branchId,
    this.designation,
    this.organization,
    this.graduationYear,
    this.description,
    this.dob,
    this.registrationNumber,
    this.phone,
    this.image,
    this.currentCityId,
    this.currentCityName,
    this.latitude,
    this.longitude,
    this.chapterDesignation,
    this.isMentor,
    this.companyName,
    this.activeStatus,
    this.chatInvitationStatus,
  });

  String? chapterId;
  String? chapterName;
  String? email;
  String? userRole;
  String? isVerified;
  String? isUpdate;
  List<Interest>? interest;
  List<dynamic>? education;
  List<Experience>? experience;
  String? userId;
  String? loginWith;
  String? firstName;
  String? lastName;
  String? countryId;
  String? cityId;
  String? branchId;
  String? designation;
  String? organization;
  String? graduationYear;
  String? description;
  String? dob;
  String? registrationNumber;
  String? phone;
  String? image;
  String? currentCityId;
  String? currentCityName;
  String? latitude;
  String? longitude;
  String? chapterDesignation;
  String? isMentor;
  String? companyName;
  String? chatInvitationStatus;
  ActiveStatus? activeStatus;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    chapterId: json["chapter_id"],
    chapterName: json["chapter_name"],
    email: json["email"],
    userRole: json["user_role"],
    isVerified: json["is_verified"],
    isUpdate: json["is_update"],
    interest: List<Interest>.from(json["interest"].map((x) => Interest.fromMap(x))),
    education: List<dynamic>.from(json["education"].map((x) => x)),
    experience: List<Experience>.from(json["experience"].map((x) => Experience.fromMap(x))),
    userId: json["user_id"],
    loginWith: json["login_with"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    countryId: json["country_id"],
    cityId: json["city_id"],
    branchId: json["branch_id"],
    designation: json["designation"],
    organization: json["organization"],
    graduationYear: json["graduation_year"],
    description: json["description"],
    dob: json["dob"],
    registrationNumber: json["registration_number"],
    phone: json["phone"],
    image: json["image"],
    currentCityId: json["current_city_id"],
    currentCityName: json["current_city_name"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    chapterDesignation: json["chapter_designation"],
    isMentor: json["is_mentor"],
    companyName: json["company_name"],
    chatInvitationStatus: json["chat_invitation_status"],
    activeStatus: ActiveStatus.fromMap(json["active_status"]),
  );

  Map<String, dynamic> toMap() => {
    "chapter_id": chapterId,
    "chapter_name": chapterName,
    "email": email,
    "user_role": userRole,
    "is_verified": isVerified,
    "is_update": isUpdate,
    "interest": List<dynamic>.from(interest!.map((x) => x.toMap())),
    "education": List<dynamic>.from(education!.map((x) => x)),
    "experience": List<dynamic>.from(experience!.map((x) => x.toMap())),
    "user_id": userId,
    "login_with": loginWith,
    "first_name": firstName,
    "last_name": lastName,
    "country_id": countryId,
    "city_id": cityId,
    "branch_id": branchId,
    "designation": designation,
    "organization": organization,
    "graduation_year": graduationYear,
    "description": description,
    "dob": dob,
    "registration_number": registrationNumber,
    "phone": phone,
    "image": image,
    "current_city_id": currentCityId,
    "current_city_name": currentCityName,
    "latitude": latitude,
    "longitude": longitude,
    "chapter_designation": chapterDesignation,
    "is_mentor": isMentor,
    "company_name": companyName,
    "chat_invitation_status": chatInvitationStatus,
    "active_status": activeStatus!.toMap(),
  };
}

class ActiveStatus {
  ActiveStatus({
    this.id,
    this.userId,
    this.manufacturer,
    this.model,
    this.platform,
    this.serial,
    this.uuid,
    this.version,
    this.appVersion,
    this.token,
    this.status,
    this.entryDate,
    this.updateDate,
  });

  int? id;
  int? userId;
  String? manufacturer;
  String? model;
  String? platform;
  String? serial;
  String? uuid;
  String? version;
  String? appVersion;
  String? token;
  String? status;
  String? entryDate;
  String? updateDate;

  factory ActiveStatus.fromJson(String str) => ActiveStatus.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ActiveStatus.fromMap(Map<String, dynamic> json) => ActiveStatus(
    id: json["id"],
    userId: json["user_id"],
    manufacturer: json["manufacturer"],
    model: json["model"],
    platform: json["platform"],
    serial: json["serial"],
    uuid: json["uuid"],
    version: json["version"],
    appVersion: json["app_version"],
    token: json["token"],
    status: json["status"],
    entryDate: json["entry_date"],
    updateDate:json["update_date"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "manufacturer": manufacturer,
    "model": model,
    "platform": platform,
    "serial": serial,
    "uuid": uuid,
    "version": version,
    "app_version": appVersion,
    "token": token,
    "status": status,
    "entry_date": entryDate,
    "update_date": updateDate,
  };
}

class Experience {
  Experience({
    this.id,
    this.userId,
    this.position,
    this.campanyName,
    this.companyImage,
    this.startDate,
    this.endDate,
    this.logoChangeable,
  });

  String? id;
  String? userId;
  String? position;
  String? campanyName;
  String? companyImage;
  String? startDate;
  String? endDate;
  String? logoChangeable;

  factory Experience.fromJson(String str) => Experience.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Experience.fromMap(Map<String, dynamic> json) => Experience(
    id: json["id"],
    userId: json["user_id"],
    position: json["position"],
    campanyName: json["campany_name"],
    companyImage: json["company_image"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    logoChangeable: json["logo_changeable"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "position": position,
    "campany_name": campanyName,
    "company_image": companyImage,
    "start_date": startDate,
    "end_date": endDate,
    "logo_changeable": logoChangeable,
  };
}

class Interest {
  Interest({
    this.id,
    this.userId,
    this.interest,
  });

  String? id;
  String? userId;
  String? interest;

  factory Interest.fromJson(String str) => Interest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Interest.fromMap(Map<String, dynamic> json) => Interest(
    id: json["id"],
    userId: json["user_id"],
    interest: json["interest"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "interest": interest,
  };
}
