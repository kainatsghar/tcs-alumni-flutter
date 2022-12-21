import 'package:moor/moor.dart';

class DBAttendies extends Table {
  @JsonKey('user_id')
  TextColumn get userId => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('event_id')
  TextColumn get eventId => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('first_name')
  TextColumn get firstName => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('last_name')
  TextColumn get lastName => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('graduation_year')
  TextColumn get graduationYear =>
      text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('registration_number')
  TextColumn get registrationNumber =>
      text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('city_id')
  TextColumn get cityId => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('branch_id')
  TextColumn get branchId => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('country_id')
  TextColumn get countryId => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('status')
  TextColumn get status => text().withLength(min: 0, max: 100).nullable()();

  @override
  Set<Column> get primaryKey => {userId};
}
