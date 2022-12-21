import 'package:moor/moor.dart';

class DBStorySeens extends Table {
  @JsonKey('first_name')
  TextColumn get storyImage => text().withLength(min: 0, max: 200).nullable()();

  @JsonKey('last_name')
  TextColumn get mediaType => text().withLength(min: 0, max: 200).nullable()();

  @JsonKey('user_image')
  TextColumn get createdDate =>
      text().withLength(min: 0, max: 2000).nullable()();
}
