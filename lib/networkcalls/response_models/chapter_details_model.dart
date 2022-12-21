// To parse this JSON data, do
//
//     final chapterDetailsModel = chapterDetailsModelFromMap(jsonString);

import 'dart:convert';

class ChapterDetailsModel {
  ChapterDetailsModel({
    this.success,
    this.message,
    this.result,
  });

  int? success;
  String? message;
  Result? result;

  factory ChapterDetailsModel.fromJson(String str) => ChapterDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChapterDetailsModel.fromMap(Map<String, dynamic> json) => ChapterDetailsModel(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
    result: json["result"] == null ? null : Result.fromMap(json["result"]),
  );

  Map<String, dynamic> toMap() => {
    "success": success == null ? null : success,
    "message": message == null ? null : message,
    "result": result == null ? null : result!.toMap(),
  };
}

class Result {
  Result({
    this.chapterId,
    this.chapterName,
    this.chapterType,
    this.chapterDetail,
    this.chapterNumber,
    this.memeber,
    this.branches,
  });

  String? chapterId;
  String? chapterName;
  String? chapterType;
  String? chapterDetail;
  String? chapterNumber;
  List<Memeber>? memeber;
  List<Branch>? branches;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    chapterId: json["chapter_id"] == null ? null : json["chapter_id"],
    chapterName: json["chapter_name"] == null ? null : json["chapter_name"],
    chapterType: json["chapter_type"] == null ? null : json["chapter_type"],
    chapterDetail: json["chapter_detail"] == null ? null : json["chapter_detail"],
    chapterNumber: json["chapter_number"] == null ? null : json["chapter_number"],
    memeber: json["memeber"] == null ? null : List<Memeber>.from(json["memeber"].map((x) => Memeber.fromMap(x))),
    branches: json["branches"] == null ? null : List<Branch>.from(json["branches"].map((x) => Branch.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "chapter_id": chapterId == null ? null : chapterId,
    "chapter_name": chapterName == null ? null : chapterName,
    "chapter_type": chapterType == null ? null : chapterType,
    "chapter_detail": chapterDetail == null ? null : chapterDetail,
    "chapter_number": chapterNumber == null ? null : chapterNumber,
    "memeber": memeber == null ? null : List<dynamic>.from(memeber!.map((x) => x.toMap())),
    "branches": branches == null ? null : List<dynamic>.from(branches!.map((x) => x.toMap())),
  };
}

class Branch {
  Branch({
    this.chapterId,
    this.chapterName,
    this.branchId,
    this.branchName,
    this.address,
    this.contact,
  });

  String? chapterId;
  String? chapterName;
  String? branchId;
  String? branchName;
  String? address;
  String? contact;

  factory Branch.fromJson(String str) => Branch.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Branch.fromMap(Map<String, dynamic> json) => Branch(
    chapterId: json["chapter_id"] == null ? null : json["chapter_id"],
    chapterName: json["chapter_name"] == null ? null : json["chapter_name"],
    branchId: json["branch_id"] == null ? null : json["branch_id"],
    branchName: json["branch_name"] == null ? null : json["branch_name"],
    address: json["address"] == null ? null : json["address"],
    contact: json["contact"] == null ? null : json["contact"],
  );

  Map<String, dynamic> toMap() => {
    "chapter_id": chapterId == null ? null : chapterId,
    "chapter_name": chapterName == null ? null : chapterName,
    "branch_id": branchId == null ? null : branchId,
    "branch_name": branchName == null ? null : branchName,
    "address": address == null ? null : address,
    "contact": contact == null ? null : contact,
  };
}

class Memeber {
  Memeber({
    this.chapterId,
    this.chapterUserAlumniName,
    this.chapterUserAlumniContact,
    this.chapterUserAlumniEmail,
    this.chapterUserAlumniImage,
    this.chapterUserAlumniId,
    this.userId,
    this.chapterUserAlumniDesignation,
    this.employeeId,
    this.chapterUserAlumniType,
  });

  String? chapterId;
  String? chapterUserAlumniName;
  String? chapterUserAlumniContact;
  String? chapterUserAlumniEmail;
  String? chapterUserAlumniImage;
  String? chapterUserAlumniId;
  String? userId;
  String? chapterUserAlumniDesignation;
  String? employeeId;
  String? chapterUserAlumniType;

  factory Memeber.fromJson(String str) => Memeber.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Memeber.fromMap(Map<String, dynamic> json) => Memeber(
    chapterId: json["chapter_id"] == null ? null : json["chapter_id"],
    chapterUserAlumniName: json["chapter_user_alumni_name"] == null ? null : json["chapter_user_alumni_name"],
    chapterUserAlumniContact: json["chapter_user_alumni_contact"] == null ? null : json["chapter_user_alumni_contact"],
    chapterUserAlumniEmail: json["chapter_user_alumni_email"] == null ? null : json["chapter_user_alumni_email"],
    chapterUserAlumniImage: json["chapter_user_alumni_image"] == null ? null : json["chapter_user_alumni_image"],
    chapterUserAlumniId: json["chapter_user_alumni_id"] == null ? null : json["chapter_user_alumni_id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    chapterUserAlumniDesignation: json["chapter_user_alumni_designation"] == null ? null : json["chapter_user_alumni_designation"],
    employeeId: json["employee_id"] == null ? null : json["employee_id"],
    chapterUserAlumniType: json["chapter_user_alumni_type"] == null ? null : json["chapter_user_alumni_type"],
  );

  Map<String, dynamic> toMap() => {
    "chapter_id": chapterId == null ? null : chapterId,
    "chapter_user_alumni_name": chapterUserAlumniName == null ? null : chapterUserAlumniName,
    "chapter_user_alumni_contact": chapterUserAlumniContact == null ? null : chapterUserAlumniContact,
    "chapter_user_alumni_email": chapterUserAlumniEmail == null ? null : chapterUserAlumniEmail,
    "chapter_user_alumni_image": chapterUserAlumniImage == null ? null : chapterUserAlumniImage,
    "chapter_user_alumni_id": chapterUserAlumniId == null ? null : chapterUserAlumniId,
    "user_id": userId == null ? null : userId,
    "chapter_user_alumni_designation": chapterUserAlumniDesignation == null ? null : chapterUserAlumniDesignation,
    "employee_id": employeeId == null ? null : employeeId,
    "chapter_user_alumni_type": chapterUserAlumniType == null ? null : chapterUserAlumniType,
  };
}
