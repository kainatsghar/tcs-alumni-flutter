import 'package:moor/moor.dart';

class DBGalleryImages extends Table {
  TextColumn get id => text().withLength(min: 0, max: 50).nullable()();

  @JsonKey('gallery_id')
  TextColumn get title => text().withLength(min: 0, max: 500).nullable()();

  TextColumn get image => text().withLength(min: 0, max: 500).nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
