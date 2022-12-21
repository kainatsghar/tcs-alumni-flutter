import 'package:moor/moor.dart';

class DBEducations extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get userId => integer().nullable()();

  TextColumn get institute => text().withLength(min: 0, max: 500).nullable()();

  TextColumn get program => text().withLength(min: 0, max: 100).nullable()();

  TextColumn get startDate => text().withLength(min: 0, max: 100).nullable()();

  TextColumn get endDate => text().withLength(min: 0, max: 100).nullable()();

  TextColumn get companyId => text().withLength(min: 0, max: 100).nullable()();
}
