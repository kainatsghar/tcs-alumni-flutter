// import 'package:firebase_database/firebase_database.dart';
//
// class Message {
//   String? key;
//   String? name;
//   String? address;
//   String? phone;
//   String? thumbnail;
//
//   Message(this.name, this.address, this.phone, this.thumbnail);
//
//   Message.fromSnapshot(DataSnapshot snapshot)
//       : key = snapshot.key,
//         name = snapshot.value["name"],
//         address = snapshot.value["address"],
//         phone = snapshot.value["phone"],
//         thumbnail = snapshot.value["thumbnail"];
//
//   toJson() {
//     return {
//       "name": name,
//       "address": address,
//       "phone": phone,
//       "thumbnail": thumbnail,
//     };
//   }
// }

// To parse this JSON data, do
//
//     final Message = MessageFromMap(jsonString);

import 'dart:convert';

class Message {
  Message({
    this.itemId,
    this.message,
    this.messageId,
    this.messageKey,
    this.read,
    this.received,
    this.receiverId,
    this.send,
    this.senderId,
    this.timeStamp,
  });

  String? itemId;
  String? message;
  String? messageId;
  String? messageKey;
  bool? read;
  bool? received;
  String? receiverId;
  bool? send;
  String? senderId;
  String? timeStamp;

  factory Message.fromJson(String str) => Message.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Message.fromMap(Map<String, dynamic> json) => Message(
        itemId: json["itemID"],
        message: json["message"],
        messageId: json["messageID"],
        messageKey: json["messageKey"],
        read: json["read"],
        received: json["received"],
        receiverId: json["receiverId"],
        send: json["send"],
        senderId: json["senderId"],
        timeStamp: json["timeStamp"],
      );

  Map<String, dynamic> toMap() => {
        "itemID": itemId,
        "message": message,
        "messageID": messageId,
        "messageKey": messageKey,
        "read": read,
        "received": received,
        "receiverId": receiverId,
        "send": send,
        "senderId": senderId,
        "timeStamp": timeStamp,
      };
}

class ChatsModel {
  ChatsModel({
    this.id,
    this.imageUrl,
    this.index,
    this.lastText,
    this.messageKey,
    this.name,
    this.senderId,
    this.time,
  });

  String? id;
  String? imageUrl;
  int? index;
  String? lastText;
  String? messageKey;
  String? name;
  String? senderId;
  String? time;

  factory ChatsModel.fromJson(String str) =>
      ChatsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChatsModel.fromMap(Map<String, dynamic> json) => ChatsModel(
        id: json["id"],
        imageUrl: json["imageUrl"],
        index: json["index"],
        messageKey: json["messageKey"],
        lastText: json["lastText"],
        name: json["name"],
        senderId: json["senderId"],
        time: json["time"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "imageUrl": imageUrl,
        "index": index,
        "messageKey": messageKey,
        "lastText": lastText,
        "name": name,
        "senderId": senderId,
        "time": time,
      };
}
