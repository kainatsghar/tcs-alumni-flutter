import 'package:moor/moor.dart';

class DBSpotlightAlumis extends Table {
  TextColumn get userId => text().withLength(min: 0, max: 100).nullable()();

  TextColumn get designation =>
      text().withLength(min: 0, max: 1000).nullable()();

  TextColumn get firstName => text().withLength(min: 0, max: 500).nullable()();

  TextColumn get lastName => text().withLength(min: 0, max: 500).nullable()();

  TextColumn get image => text().withLength(min: 0, max: 1000).nullable()();

  TextColumn get graduationYear =>
      text().withLength(min: 0, max: 100).nullable()();

  @override
  Set<Column> get primaryKey => {userId};
}
