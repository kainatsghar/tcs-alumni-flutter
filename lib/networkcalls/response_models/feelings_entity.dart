// To parse this JSON data, do
//
//     final feelingsEntity = feelingsEntityFromMap(jsonString);

import 'dart:convert';

class FeelingsEntity {
  FeelingsEntity({
    this.success,
    this.message,
    this.result,
  });

  int? success;
  String? message;
  List<Result>? result;

  factory FeelingsEntity.fromJson(String str) => FeelingsEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FeelingsEntity.fromMap(Map<String, dynamic> json) => FeelingsEntity(
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
    this.id,
    this.feelingName,
    this.feelingIcon,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? feelingName;
  String? feelingIcon;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    id: json["id"],
    feelingName: json["feeling_name"],
    feelingIcon: json["feeling_icon"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "feeling_name": feelingName,
    "feeling_icon": feelingIcon,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
