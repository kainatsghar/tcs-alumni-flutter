import 'package:moor/moor.dart';

class DBGalleries extends Table {
  @JsonKey("gallery_id")
  TextColumn get id => text().withLength(min: 0, max: 50).nullable()();

  @JsonKey('gallery_title')
  TextColumn get title => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('created_date')
  TextColumn get createdDAte =>
      text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('gallery_image')
  TextColumn get image => text().withLength(min: 0, max: 500).nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
