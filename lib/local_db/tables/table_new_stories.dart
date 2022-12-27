import 'package:moor/moor.dart';

class DbNewStories extends Table{

  IntColumn get storyId => integer().nullable()();

  TextColumn get storyImage => text().withLength(min: 0, max: 2000).nullable()();

  TextColumn get mediaType => text().withLength(min: 0, max: 2000).nullable()();

  TextColumn get updatedDate => text().withLength(min: 0, max: 100).nullable()();

  TextColumn get storyTime => text().withLength(min: 0, max: 100).nullable()();

  TextColumn get link => text().withLength(min: 0, max: 2000).nullable()();

}