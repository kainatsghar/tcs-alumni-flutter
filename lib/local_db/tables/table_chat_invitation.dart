import 'package:moor/moor.dart';

class DBChatStatuss extends Table {
  @JsonKey('sender_id')
  TextColumn get senderId => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('reciver_id')
  TextColumn get receiverId => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('status')
  TextColumn get status => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('block_by')
  TextColumn get blockBy => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('first_name')
  TextColumn get firstName => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('last_name')
  TextColumn get lastName => text().withLength(min: 0, max: 100).nullable()();
}
