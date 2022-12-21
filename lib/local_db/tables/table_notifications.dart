import 'package:moor/moor.dart';

class DBNotifications extends Table {
  @JsonKey("notification_id")
  TextColumn get id => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('event_id')
  TextColumn get eventId => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('schedule_date')
  TextColumn get date => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('user_id')
  TextColumn get userId => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('title')
  TextColumn get title => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('description')
  TextColumn get description =>
      text().withLength(min: 0, max: 1000).nullable()();

  @JsonKey('read_status')
  TextColumn get readStatus => text().withLength(min: 0, max: 50).nullable()();

  @JsonKey('notification_type')
  TextColumn get type => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('other_user_id')
  TextColumn get from => text().withLength(min: 0, max: 100).nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
