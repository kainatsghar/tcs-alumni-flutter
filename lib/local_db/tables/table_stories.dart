import 'package:moor/moor.dart';

class DBStories extends Table {
  IntColumn get storyById => integer().nullable()();

  IntColumn get addedBy => integer().nullable()();

  TextColumn get name => text().withLength(min: 0, max: 100).nullable()();

  TextColumn get userImage => text().withLength(min: 0, max: 1000).nullable()();
}
