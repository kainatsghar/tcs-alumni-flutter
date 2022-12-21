import 'package:moor/moor.dart';

class DBProductCategories extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 0, max: 50).nullable()();

  @JsonKey('is_active')
  TextColumn get isActive => text().withLength(min: 0, max: 10).nullable()();

  @JsonKey('is_deleted')
  TextColumn get isDeleted => text().withLength(min: 0, max: 10).nullable()();
}
