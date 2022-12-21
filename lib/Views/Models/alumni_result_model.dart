// To parse this JSON data, do
//
//     const aLumniResultModel = aLumniResultModelFromMap(jsonString);

import 'dart:convert';

class ALumniResultModel {
  ALumniResultModel({
    this.success,
    this.message,
    this.result,
  });

  int? success;
  String? message;
  List<Result>? result = [];

  factory ALumniResultModel.fromJson(String str) =>
      ALumniResultModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ALumniResultModel.fromMap(Map<String, dynamic> json) =>
      ALumniResultModel(
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
    this.userId,
    this.loginWith,
    this.firstName,
    this.lastName,
    this.countryId,
    this.isRegistered,
    this.cityId,
    this.branchId,
    this.branchName,
    this.organizationName,
    this.designation,
    this.industryName,
    this.graduationYear,
    this.description,
    this.dob,
    this.cnic,
    this.registrationNumber,
    this.phone,
    this.currentCityId,
    this.currentCityName,
    this.latitude,
    this.longitude,
    this.chapterDesignation,
    this.isMentor,
    this.isDeleted,
    this.chatInvitationStatus,
    this.userLinkedinUrl,
    this.gender,
    this.image,
    this.connectionStatus,
    this.isConnected,
    this.chapterId,
    this.chapterName,
  });

  String? userId;
  String? loginWith;
  String? firstName;
  String? lastName;
  String? countryId;
  String? isRegistered;
  String? cityId;
  String? branchId;
  String? branchName;
  String? organizationName;
  String? designation;
  String? industryName;
  String? graduationYear;
  String? description;
  String? dob;
  String? cnic;
  String? registrationNumber;
  String? phone;
  String? currentCityId;
  String? currentCityName;
  String? latitude;
  String? longitude;
  dynamic chapterDesignation;
  String? isMentor;
  String? isDeleted;
  String? chatInvitationStatus;
  dynamic userLinkedinUrl;
  dynamic gender;
  String? image;
  String? connectionStatus;
  String? isConnected;
  String? chapterId;
  dynamic chapterName;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        userId: json["user_id"],
        loginWith: json["login_with"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        countryId: json["country_id"],
        isRegistered: json["is_registered"],
        cityId: json["city_id"],
        branchId: json["branch_id"],
        branchName: json["branch_name"],
        organizationName: json["organization_name"],
        designation: json["designation"],
        industryName: json["industry_name"],
        graduationYear: json["graduation_year"],
        description: json["description"],
        dob: json["dob"],
        cnic: json["cnic"],
        registrationNumber: json["registration_number"],
        phone: json["phone"],
        currentCityId: json["current_city_id"],
        currentCityName: json["current_city_name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        chapterDesignation: json["chapter_designation"],
        isMentor: json["is_mentor"],
        isDeleted: json["is_deleted"],
        chatInvitationStatus: json["chat_invitation_status"],
        userLinkedinUrl: json["user_linkedin_url"],
        gender: json["gender"],
        image: json["image"],
        connectionStatus: json["connection_status"],
        isConnected: json["is_connected"],
        chapterId: json["chapter_id"],
        chapterName: json["chapter_name"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "login_with": loginWith,
        "first_name": firstName,
        "last_name": lastName,
        "country_id": countryId,
        "is_registered": isRegistered,
        "city_id": cityId,
        "branch_id": branchId,
        "branch_name": branchName,
        "organization_name": organizationName,
        "designation": designation,
        "industry_name": industryName,
        "graduation_year": graduationYear,
        "description": description,
        "dob": dob,
        "cnic": cnic,
        "registration_number": registrationNumber,
        "phone": phone,
        "current_city_id": currentCityId,
        "current_city_name": currentCityName,
        "latitude": latitude,
        "longitude": longitude,
        "chapter_designation": chapterDesignation,
        "is_mentor": isMentor,
        "is_deleted": isDeleted,
        "chat_invitation_status": chatInvitationStatus,
        "user_linkedin_url": userLinkedinUrl,
        "gender": gender,
        "image": image,
        "connection_status": connectionStatus,
        "is_connected": isConnected,
        "chapter_id": chapterId,
        "chapter_name": chapterName,
      };
}

class AlumniResult {
  dynamic id;
  String? image;
  String? firstName;
  String? lastName;
  String? graduationYear;
  String? currentCity;
  String? organizationName;

  AlumniResult(
      {this.id,
      this.firstName,
      this.lastName,
      this.image,
      this.graduationYear,
      this.currentCity,
      this.organizationName});
}
