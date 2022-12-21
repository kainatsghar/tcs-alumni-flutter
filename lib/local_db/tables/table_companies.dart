import 'package:moor/moor.dart';

class DBCompanies extends Table {
  TextColumn get id => text().withLength(min: 0, max: 100).nullable()();

  TextColumn get title => text().withLength(min: 0, max: 500).nullable()();

  TextColumn get image => text().withLength(min: 0, max: 1000).nullable()();

  @JsonKey('logo_changeable')
  TextColumn get logoChangeable =>
      text().withLength(min: 0, max: 100).nullable()();

  IntColumn get workers => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
