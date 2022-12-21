import 'package:moor/moor.dart';

class DBCommentReplies extends Table {
  @JsonKey('id')
  TextColumn get id => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('comment_id')
  TextColumn get commentId => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('text')
  TextColumn get comment => text().withLength(min: 0, max: 1000).nullable()();

  @JsonKey('created_date')
  TextColumn get createdDate =>
      text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('first_name')
  TextColumn get firstName => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('last_name')
  TextColumn get lastName => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('user_image')
  TextColumn get userImage => text().withLength(min: 0, max: 1000).nullable()();

  @JsonKey('commented_by')
  TextColumn get commentedBy =>
      text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('type')
  TextColumn get type => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('is_like')
  TextColumn get isLike => text().withLength(min: 0, max: 1000).nullable()();

  @JsonKey('like_count')
  TextColumn get likeCount => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('data_reaction')
  TextColumn get reaction => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('comment_image')
  TextColumn get commentImage =>
      text().withLength(min: 0, max: 1000).nullable()();

  @JsonKey('comment_image_type')
  TextColumn get imageType => text().withLength(min: 0, max: 100).nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
