import 'package:moor/moor.dart';

class DBOneUsers extends Table {
  TextColumn get userId => text().withLength(min: 0, max: 100).nullable()();

  TextColumn get designation =>
      text().withLength(min: 0, max: 1000).nullable()();

  TextColumn get firstName => text().withLength(min: 0, max: 500).nullable()();

  TextColumn get lastName => text().withLength(min: 0, max: 500).nullable()();

  TextColumn get branchName =>
      text().withLength(min: 0, max: 1000).nullable()();
  TextColumn get organizationName =>
      text().withLength(min: 0, max: 1000).nullable()();
  TextColumn get industryName =>
      text().withLength(min: 0, max: 1000).nullable()();
  TextColumn get graduationYear =>
      text().withLength(min: 0, max: 100).nullable()();
  TextColumn get description =>
      text().withLength(min: 0, max: 3000).nullable()();
  TextColumn get dateOfBirth =>
      text().withLength(min: 0, max: 500).nullable()();
  TextColumn get cnic => text().withLength(min: 0, max: 500).nullable()();
  TextColumn get registrationNumber =>
      text().withLength(min: 0, max: 500).nullable()();
  TextColumn get phoneNumber =>
      text().withLength(min: 0, max: 500).nullable()();
  TextColumn get email => text().withLength(min: 0, max: 1000).nullable()();
  TextColumn get image => text().withLength(min: 0, max: 1000).nullable()();
  TextColumn get currentCityName =>
      text().withLength(min: 0, max: 500).nullable()();
  TextColumn get longitude => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get latitude => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get isMentor => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get isVerified => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get isDeleted => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get connectionStatus =>
      text().withLength(min: 0, max: 100).nullable()();
  TextColumn get countryId => text().withLength(min: 0, max: 100).nullable()();

  TextColumn get isRegistered =>
      text().withLength(min: 0, max: 100).nullable()();

  TextColumn get cityId => text().withLength(min: 0, max: 100).nullable()();

  TextColumn get chapterName =>
      text().withLength(min: 0, max: 1000).nullable()();

  @override
  Set<Column> get primaryKey => {userId};
}
