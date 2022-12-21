// To parse this JSON data, do
//
//     final deleteWorkOrderModel = deleteWorkOrderModelFromMap(jsonString);

import 'dart:convert';

class DeleteWorkOrderModel {
  DeleteWorkOrderModel({
    this.success,
    this.message,
    this.result,
  });

  int? success;
  String? message;
  bool? result;

  factory DeleteWorkOrderModel.fromJson(String str) => DeleteWorkOrderModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeleteWorkOrderModel.fromMap(Map<String, dynamic> json) => DeleteWorkOrderModel(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
    result: json["result"] == null ? null : json["result"],
  );

  Map<String, dynamic> toMap() => {
    "success": success == null ? null : success,
    "message": message == null ? null : message,
    "result": result == null ? null : result,
  };
}
