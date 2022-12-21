import 'package:moor/moor.dart';

class DBProductImages extends Table {
  IntColumn get id => integer().autoIncrement()();

  @JsonKey('product_id')
  IntColumn get productId => integer().nullable()();

  @JsonKey('product_media')
  TextColumn get productMedia =>
      text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('created_at')
  TextColumn get createdAt => text().withLength(min: 0, max: 50).nullable()();

  @JsonKey('type')
  TextColumn get type => text().withLength(min: 0, max: 50).nullable()();
}
