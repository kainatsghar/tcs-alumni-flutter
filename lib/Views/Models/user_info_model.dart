// To parse this JSON data, do
//
//     const userInfoModel = userInfoModelFromMap(jsonString);

import 'dart:convert';

class UserInfoModel {
  UserInfoModel({
    this.success,
    this.message,
    this.result,
  });

  int? success;
  String? message;
  Result? result;

  factory UserInfoModel.fromJson(String str) =>
      UserInfoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserInfoModel.fromMap(Map<String, dynamic> json) => UserInfoModel(
        success: json["success"],
        message: json["message"],
        result: Result.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "result": result!.toMap(),
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
    this.email,
    this.image,
    this.currentCityId,
    this.currentCityName,
    this.latitude,
    this.longitude,
    this.chapterDesignation,
    this.isMentor,
    this.isVerified,
    this.isUpdate,
    this.isDeleted,
    this.connectionStatus,
    this.isConnected,
    this.chapterId,
    this.chapterName,
    this.chatInvitationStatus,
    this.interest,
    this.education,
    this.experience,
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
  String? email;
  String? image;
  String? currentCityId;
  dynamic currentCityName;
  String? latitude;
  String? longitude;
  dynamic chapterDesignation;
  String? isMentor;
  String? isVerified;
  String? isUpdate;
  String? isDeleted;
  String? connectionStatus;
  String? isConnected;
  String? chapterId;
  String? chapterName;
  String? chatInvitationStatus;
  List<dynamic>? interest;
  List<Education>? education;
  List<Experience>? experience;

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
        email: json["email"],
        image: json["image"],
        currentCityId: json["current_city_id"],
        currentCityName: json["current_city_name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        chapterDesignation: json["chapter_designation"],
        isMentor: json["is_mentor"],
        isVerified: json["is_verified"],
        isUpdate: json["is_update"],
        isDeleted: json["is_deleted"],
        connectionStatus: json["connection_status"],
        isConnected: json["is_connected"],
        chapterId: json["chapter_id"],
        chapterName: json["chapter_name"],
        chatInvitationStatus: json["chat_invitation_status"],
        interest: List<dynamic>.from(json["interest"].map((x) => x)),
        education: List<Education>.from(
            json["education"].map((x) => Education.fromMap(x))),
        experience: List<Experience>.from(
            json["experience"].map((x) => Experience.fromMap(x))),
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
        "email": email,
        "image": image,
        "current_city_id": currentCityId,
        "current_city_name": currentCityName,
        "latitude": latitude,
        "longitude": longitude,
        "chapter_designation": chapterDesignation,
        "is_mentor": isMentor,
        "is_verified": isVerified,
        "is_update": isUpdate,
        "is_deleted": isDeleted,
        "connection_status": connectionStatus,
        "is_connected": isConnected,
        "chapter_id": chapterId,
        "chapter_name": chapterName,
        "chat_invitation_status": chatInvitationStatus,
        "interest": List<dynamic>.from(interest!.map((x) => x)),
        "education": List<dynamic>.from(education!.map((x) => x.toMap())),
        "experience": List<dynamic>.from(experience!.map((x) => x.toMap())),
      };
}

class Education {
  Education({
    this.id,
    this.userId,
    this.institute,
    this.program,
    this.startDate,
    this.endDate,
  });

  String? id;
  String? userId;
  String? institute;
  String? program;
  String? startDate;
  String? endDate;

  factory Education.fromJson(String str) => Education.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Education.fromMap(Map<String, dynamic> json) => Education(
        id: json["id"],
        userId: json["user_id"],
        institute: json["institute"],
        program: json["program"],
        startDate: json["start_date"],
        endDate: json["end_date"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "institute": institute,
        "program": program,
        "start_date": startDate,
        "end_date": endDate,
      };
}

class Experience {
  Experience({
    this.id,
    this.userId,
    this.position,
    this.campanyName,
    this.companyImage,
    this.logoChangeable,
    this.startDate,
    this.endDate,
    this.companyId,
  });

  String? id;
  String? userId;
  String? position;
  String? campanyName;
  String? companyImage;
  String? logoChangeable;
  String? startDate;
  String? endDate;
  String? companyId;

  factory Experience.fromJson(String str) =>
      Experience.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Experience.fromMap(Map<String, dynamic> json) => Experience(
        id: json["id"],
        userId: json["user_id"],
        position: json["position"],
        campanyName: json["campany_name"],
        companyImage: json["company_image"],
        logoChangeable: json["logo_changeable"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        companyId: json["company_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "position": position,
        "campany_name": campanyName,
        "company_image": companyImage,
        "logo_changeable": logoChangeable,
        "start_date": startDate,
        "end_date": endDate,
        "company_id": companyId,
      };
}
