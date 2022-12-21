import 'package:moor/moor.dart';

class DBCountries extends Table {
  @JsonKey('country_id')
  TextColumn get countryId => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('country_name')
  TextColumn get countryName =>
      text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('is_deleted')
  TextColumn get isDeleted => text().withLength(min: 0, max: 100).nullable()();

  @override
  Set<Column> get primaryKey => {countryId};
}
