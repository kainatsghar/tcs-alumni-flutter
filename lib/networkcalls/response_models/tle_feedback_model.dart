// To parse this JSON data, do
//
//     final tleFeedbackModel = tleFeedbackModelFromMap(jsonString);

import 'dart:convert';

class TleFeedbackModel {
  TleFeedbackModel({
    this.success,
    this.message,
    this.result,
  });

  int? success;
  String? message;
  bool? result;

  factory TleFeedbackModel.fromJson(String str) => TleFeedbackModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TleFeedbackModel.fromMap(Map<String, dynamic> json) => TleFeedbackModel(
    success: json["success"],
    message: json["message"],
    result: json["result"],
  );

  Map<String, dynamic> toMap() => {
    "success": success ,
    "message": message ,
    "result": result ,
  };
}
