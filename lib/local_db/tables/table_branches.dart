import 'package:moor/moor.dart';

class DBBranches extends Table {
  TextColumn get id => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('city_id')
  TextColumn get cityId => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('country_id')
  TextColumn get countryId => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('title')
  TextColumn get title => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('chapter_id')
  TextColumn get chapterId => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('is_deleted')
  TextColumn get isDeleted => text().withLength(min: 0, max: 100).nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
