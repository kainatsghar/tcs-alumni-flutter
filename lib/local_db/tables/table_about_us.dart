import 'package:moor/moor.dart';

class DBAbouts extends Table {
  TextColumn get mission => text().withLength(min: 0, max: 10000).nullable()();

  TextColumn get vission => text().withLength(min: 0, max: 10000).nullable()();

  @JsonKey('message_from_ce')
  TextColumn get aboutMessage =>
      text().withLength(min: 0, max: 10000).nullable()();

  @JsonKey('message_from_oar')
  TextColumn get message => text().withLength(min: 0, max: 10000).nullable()();

  @JsonKey('objective')
  TextColumn get objective =>
      text().withLength(min: 0, max: 10000).nullable()();
}
