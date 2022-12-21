import 'package:moor/moor.dart';

class DBStories extends Table {
  IntColumn get id => integer().autoIncrement()();

  @JsonKey('added_by')
  IntColumn get addedBy => integer().nullable()();

  @JsonKey('story_image')
  TextColumn get storyImage =>
      text().withLength(min: 0, max: 2000).nullable()();

  @JsonKey('media_type')
  TextColumn get mediaType => text().withLength(min: 0, max: 2000).nullable()();

  @JsonKey('created_at')
  TextColumn get createdDate =>
      text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('updated_at')
  TextColumn get updatedDate =>
      text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('name')
  TextColumn get name => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('storyTime')
  TextColumn get storyTime => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('user_image')
  TextColumn get userImage => text().withLength(min: 0, max: 1000).nullable()();
}
