// import 'package:firebase_database/firebase_database.dart';
//
// class MessagesResponse {
//  String? id;
//  String? imageUrl;
//  String? caption;
// String? title;
//
//   MessagesResponse({
//     this.id,
//     this.imageUrl,
//     this.caption,
//     this.title,
//   });
//
//   MessagesResponse.fromSnapshot(DataSnapshot snapshot) :
//         id = snapshot.key,
//         imageUrl = snapshot.value["imageUrl"],
//         caption = snapshot.value["caption"],
//         title = snapshot.value["postTitle"];
//
//   toJson() {
//     return {
//       "imageUrl": imageUrl,
//       "caption": caption,
//       "title": title,
//     };
//   }
// }
