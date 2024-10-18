import 'package:moor/moor.dart';

class DBDiscounts extends Table {
  @JsonKey("id")
  TextColumn get id => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('title')
  TextColumn get title => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('latitude')
  TextColumn get latitude => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('longitude')
  TextColumn get longitude => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('address')
  TextColumn get address => text().withLength(min: 0, max: 1000).nullable()();

  @JsonKey('image')
  TextColumn get image => text().withLength(min: 0, max: 1000).nullable()();

  @JsonKey('city_name')
  TextColumn get cityName => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('percent_off')
  TextColumn get percentOff => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('from_date')
  TextColumn get from => text().withLength(min: 0, max: 1000).nullable()();

  @JsonKey('to_date')
  TextColumn get toDate => text().withLength(min: 0, max: 1000).nullable()();

  @JsonKey('is_active')
  TextColumn get isActive => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('added_by')
  TextColumn get addedBy => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('code_name')
  TextColumn get codeName => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('cover_image')
  TextColumn get coverImage => text().withLength(min: 0, max: 500).nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
