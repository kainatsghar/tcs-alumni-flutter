import 'package:moor/moor.dart';

class DBMentors extends Table {
  @JsonKey('user_id')
  TextColumn get userId => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('login_with')
  TextColumn get loginWith => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('first_name')
  TextColumn get firstName => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('last_name')
  TextColumn get lastName => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('country_id')
  TextColumn get countryId => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('is_registered')
  TextColumn get isRegistered =>
      text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('city_id')
  TextColumn get cityId => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('branch_id')
  TextColumn get branchId => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('branch_name')
  TextColumn get branchName => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('organization_name')
  TextColumn get organizationName =>
      text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('designation')
  TextColumn get designation =>
      text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('industry_name')
  TextColumn get industryName =>
      text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('graduation_year')
  TextColumn get graduationYear =>
      text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('description')
  TextColumn get description =>
      text().withLength(min: 0, max: 5000).nullable()();

  @JsonKey('dob')
  TextColumn get dob => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('cnic')
  TextColumn get cnic => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('registration_number')
  TextColumn get registrationNumber =>
      text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('phone')
  TextColumn get phone => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('email')
  TextColumn get email => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('image')
  TextColumn get image => text().withLength(min: 0, max: 1000).nullable()();

  @JsonKey('current_city_id')
  TextColumn get currentCityId =>
      text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('current_city_name')
  TextColumn get currentCityName =>
      text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('latitude')
  TextColumn get latitude => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('longitude')
  TextColumn get longitude => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('chapter_designation')
  TextColumn get chapterDesignation =>
      text().withLength(min: 0, max: 500).nullable()();
  @JsonKey('is_verified')
  TextColumn get isVerified => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('isMentor')
  TextColumn get isMentor => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('is_update')
  TextColumn get isUpdate => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('is_deleted')
  TextColumn get isDeleted => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('connection_status')
  TextColumn get connectionStatus =>
      text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('is_connected')
  TextColumn get isConnected =>
      text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('chapter_id')
  TextColumn get chapterId => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('chapter_name')
  TextColumn get chapterName =>
      text().withLength(min: 0, max: 100).nullable()();

  @override
  Set<Column> get primaryKey => {userId};
}
