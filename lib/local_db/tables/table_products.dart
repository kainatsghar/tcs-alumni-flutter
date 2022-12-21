import 'package:moor/moor.dart';

class DBProducts extends Table {
  IntColumn get id => integer().autoIncrement()();

  @JsonKey('product_name')
  TextColumn get productName =>
      text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('product_price')
  TextColumn get productPrice =>
      text().withLength(min: 0, max: 50).nullable()();

  @JsonKey('category')
  TextColumn get category => text().withLength(min: 0, max: 50).nullable()();

  @JsonKey('city_name')
  TextColumn get cityName => text().withLength(min: 0, max: 50).nullable()();

  @JsonKey('product_qty')
  TextColumn get productQuantity =>
      text().withLength(min: 0, max: 10).nullable()();

  @JsonKey('product_desc')
  TextColumn get description =>
      text().withLength(min: 0, max: 1000).nullable()();

  @JsonKey('is_active')
  TextColumn get isActive => text().withLength(min: 0, max: 10).nullable()();

  @JsonKey('is_favourite')
  TextColumn get isFavourite => text().withLength(min: 0, max: 10).nullable()();

  @JsonKey('added_by')
  IntColumn get addedBy => integer().nullable()();

  @JsonKey('due_date')
  TextColumn get dueDate => text().withLength(min: 0, max: 50).nullable()();

  @JsonKey('is_anonymous')
  TextColumn get isAnonymous => text().withLength(min: 0, max: 10).nullable()();

  @JsonKey('is_premium')
  TextColumn get isPremium => text().withLength(min: 0, max: 10).nullable()();

  @JsonKey('posted_by')
  TextColumn get postedBy => text().withLength(min: 0, max: 50).nullable()();

  @JsonKey('cover_image')
  TextColumn get coverImage => text().withLength(min: 0, max: 500).nullable()();
}
