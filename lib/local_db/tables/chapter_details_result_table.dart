import 'package:moor/moor.dart';

class DBChapterDetailResults extends Table {
  TextColumn get rChapterId => text().withLength(min: 0, max: 100).nullable()();

  TextColumn get rChapterName =>
      text().withLength(min: 0, max: 100).nullable()();

  TextColumn get rChapterType =>
      text().withLength(min: 0, max: 100).nullable()();

  TextColumn get rChapterDetail =>
      text().withLength(min: 0, max: 100).nullable()();

  TextColumn get rChapterNumber =>
      text().withLength(min: 0, max: 100).nullable()();
}
