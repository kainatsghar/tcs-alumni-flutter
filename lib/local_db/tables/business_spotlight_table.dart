import 'package:moor/moor.dart';

class DBBusinessSpotlights extends Table {
  TextColumn get id => text().withLength(min: 0, max: 100).nullable()();

  TextColumn get isDeleted => text().withLength(min: 0, max: 100).nullable()();

  TextColumn get banner => text().withLength(min: 0, max: 1000).nullable()();

  TextColumn get createdBy => text().withLength(min: 0, max: 100).nullable()();

  TextColumn get updatedBy => text().withLength(min: 0, max: 100).nullable()();

  TextColumn get sortingOrder => text().withLength(min: 0, max: 100).nullable()();

  TextColumn get updatedAt => text().withLength(min: 0, max: 100).nullable()();

  TextColumn get createdAt => text().withLength(min: 0, max: 100).nullable()();

  TextColumn get clickUrl => text().withLength(min: 0, max: 100).nullable()();
}
