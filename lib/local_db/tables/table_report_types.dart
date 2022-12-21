import 'package:moor/moor.dart';

class DBReportTypes extends Table {
  TextColumn get id => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('text')
  TextColumn get reportText =>
      text().withLength(min: 0, max: 2000).nullable()();

  @JsonKey('created_at')
  TextColumn get createdAt => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('updated_at')
  TextColumn get updatedAt => text().withLength(min: 0, max: 100).nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
