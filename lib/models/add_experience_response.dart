// To parse this JSON data, do
//
//     final addExperienceResponse = addExperienceResponseFromMap(jsonString);

import 'dart:convert';

class AddExperienceResponse {
  AddExperienceResponse({
    this.success,
    this.message,
    this.result,
  });

  int? success;
  String? message;
  Result? result;

  factory AddExperienceResponse.fromJson(String str) =>
      AddExperienceResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddExperienceResponse.fromMap(Map<String, dynamic> json) =>
      AddExperienceResponse(
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
    this.experience,
  });

  List<Experience>? experience;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        experience: List<Experience>.from(
            json["experience"].map((x) => Experience.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "experience": List<dynamic>.from(experience!.map((x) => x.toMap())),
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
  });

  String? id;
  String? userId;
  String? position;
  String? campanyName;
  String? companyImage;
  String? logoChangeable;
  String? startDate;
  String? endDate;

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
      };
}
