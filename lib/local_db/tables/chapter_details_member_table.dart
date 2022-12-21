import 'package:moor/moor.dart';

class DBChapterDetailMembers extends Table {
  TextColumn get mChapterId => text().withLength(min: 0, max: 100).nullable()();

  TextColumn get mAlumniName =>
      text().withLength(min: 0, max: 100).nullable()();

  TextColumn get mAlumniContact =>
      text().withLength(min: 0, max: 100).nullable()();

  TextColumn get mAlumniEmail =>
      text().withLength(min: 0, max: 100).nullable()();

  TextColumn get mAlumniImage =>
      text().withLength(min: 0, max: 500).nullable()();

  TextColumn get mAlumniId => text().withLength(min: 0, max: 100).nullable()();

  TextColumn get mUserId => text().withLength(min: 0, max: 100).nullable()();

  TextColumn get mAlumniDesignation =>
      text().withLength(min: 0, max: 100).nullable()();

  TextColumn get mEmployId => text().withLength(min: 0, max: 100).nullable()();

  TextColumn get mAlumniType =>
      text().withLength(min: 0, max: 100).nullable()();
}
