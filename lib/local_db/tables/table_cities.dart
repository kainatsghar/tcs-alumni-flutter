import 'package:moor/moor.dart';

class DBCities extends Table {
  @JsonKey("city_id")
  TextColumn get cityId => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('country_id')
  TextColumn get countryId => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey("city_name")
  TextColumn get cityName => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('is_deleted')
  TextColumn get isDeleted => text().withLength(min: 0, max: 100).nullable()();

  @override
  Set<Column> get primaryKey => {cityId};
}
