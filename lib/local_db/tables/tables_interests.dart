import 'package:moor/moor.dart';

class DBInterests extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get userId => integer().nullable()();

  TextColumn get interest => text().withLength(min: 0, max: 2000).nullable()();
}
