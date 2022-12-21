import 'package:moor/moor.dart';

class DBDesignations extends Table {
  TextColumn get id => text().withLength(min: 0, max: 100).nullable()();

  TextColumn get name => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('is_active')
  TextColumn get isActive => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('is_deleted')
  TextColumn get isDeleted => text().withLength(min: 0, max: 100).nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
