import 'package:moor/moor.dart';

class DBPostImages extends Table {
  TextColumn get id => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('post_id')
  TextColumn get postId => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('post_media')
  TextColumn get postMedia => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('post_media_name')
  TextColumn get mediaName => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('media_type')
  TextColumn get mediaType => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('views')
  TextColumn get views => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('created_at')
  TextColumn get createdAt => text().withLength(min: 0, max: 100).nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
