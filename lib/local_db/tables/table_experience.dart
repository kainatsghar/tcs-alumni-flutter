import 'package:moor/moor.dart';

class DBExperieces extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get userId => integer().nullable()();

  TextColumn get position => text().withLength(min: 0, max: 500).nullable()();

  TextColumn get campanyName =>
      text().withLength(min: 0, max: 100).nullable()();

  TextColumn get companyImage =>
      text().withLength(min: 0, max: 500).nullable()();

  TextColumn get logoChangeable =>
      text().withLength(min: 0, max: 100).nullable()();

  TextColumn get startDate => text().withLength(min: 0, max: 100).nullable()();

  TextColumn get endDate => text().withLength(min: 0, max: 100).nullable()();
}
