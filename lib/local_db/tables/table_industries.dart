import 'package:moor/moor.dart';

class DBIndustries extends Table {
  TextColumn get id => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('title')
  TextColumn get title => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('is_deleted')
  TextColumn get isDeleted => text().withLength(min: 0, max: 100).nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
