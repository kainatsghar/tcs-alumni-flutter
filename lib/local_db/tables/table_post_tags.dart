import 'package:moor/moor.dart';

class DBPostTags extends Table {
  TextColumn get id => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('post_id')
  TextColumn get postId => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('user_id')
  TextColumn get userId => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('first_name')
  TextColumn get firstName => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('last_name')
  TextColumn get lastName => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('user_image')
  TextColumn get userImage => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('tag_by')
  TextColumn get tagBy => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('created_at')
  TextColumn get createdAt => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('updated_at')
  TextColumn get updatedAt => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('updated_by')
  TextColumn get updatedBy => text().withLength(min: 0, max: 100).nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
