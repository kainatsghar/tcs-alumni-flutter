import 'package:moor/moor.dart';

class DBChapterDetails extends Table {
  TextColumn get chapterId => text().withLength(min: 0, max: 10000).nullable()();

  TextColumn get chapterName => text().withLength(min: 0, max: 10000).nullable()();

  TextColumn get branchId => text().withLength(min: 0, max: 10000).nullable()();

  TextColumn get branchName => text().withLength(min: 0, max: 10000).nullable()();

  TextColumn get address => text().withLength(min: 0, max: 10000).nullable()();

  TextColumn get contact => text().withLength(min: 0, max: 10000).nullable()();
}
