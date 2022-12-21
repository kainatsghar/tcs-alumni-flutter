import 'package:moor/moor.dart';

class DBTleSpotlights extends Table {
  TextColumn get userId => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get loginWith => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get firstName => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get lastName => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get countryId => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get isRegistered => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get cityId => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get branchId => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get branchName => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get orgName => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get designation => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get industryName => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get graduataionYear => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get description => text().withLength(min: 0, max: 1000).nullable()();
  TextColumn get dob => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get regNumber => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get phone => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get currentCityId => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get currentCityName => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get latitude => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get longitude => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get chapterDesignation => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get isMentor => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get isDeleted => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get chatInvitationStatus => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get userLinkedinUrl => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get userFacebookUrl => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get gender => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get image => text().withLength(min: 0, max: 500).nullable()();
  TextColumn get connectionStatus => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get isConnected => text().withLength(min: 0, max: 100).nullable()();

}
