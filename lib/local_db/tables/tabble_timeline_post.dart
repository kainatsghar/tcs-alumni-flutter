import 'package:moor/moor.dart';

class DBTimeLinePosts extends Table {
  TextColumn get id => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('is_pinned')
  TextColumn get isPinned => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('updated_at_date')
  TextColumn get updatedAt => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('updated_date')
  TextColumn get updatedDate =>
      text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('text')
  TextColumn get postText => text().withLength(min: 0, max: 5000).nullable()();

  @JsonKey('image')
  TextColumn get image => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('created_at')
  TextColumn get createdAt => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('created_by')
  TextColumn get createdBy => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('first_name')
  TextColumn get firstName => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('last_name')
  TextColumn get lastName => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('gender')
  TextColumn get gender => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('total_like')
  TextColumn get totalLikes => text().withLength(min: 0, max: 50).nullable()();

  @JsonKey('total_comments')
  TextColumn get totalComments =>
      text().withLength(min: 0, max: 50).nullable()();

  @JsonKey('is_like')
  TextColumn get isLike => text().withLength(min: 0, max: 50).nullable()();

  @JsonKey('post_privacy_type')
  TextColumn get privacyType =>
      text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('is_publish')
  TextColumn get isPublish => text().withLength(min: 0, max: 50).nullable()();

  @JsonKey('check_in_location')
  TextColumn get checkInLocation =>
      text().withLength(min: 0, max: 50).nullable()();

  @JsonKey('feelingIcon')
  TextColumn get feelingIcon =>
      text().withLength(min: 0, max: 1000).nullable()();

  @JsonKey('feelingName')
  TextColumn get feelingName => text().withLength(min: 0, max: 50).nullable()();

  @JsonKey('data_reaction')
  TextColumn get reaction => text().withLength(min: 0, max: 50).nullable()();

  @JsonKey('user_image')
  TextColumn get userImage => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('event_id')
  TextColumn get eventId => text().withLength(min: 0, max: 50).nullable()();

  @JsonKey('post_type')
  TextColumn get postType => text().withLength(min: 0, max: 500).nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
