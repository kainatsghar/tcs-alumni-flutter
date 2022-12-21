import 'package:moor/moor.dart';

class DBCSRs extends Table {
  @JsonKey('csr_id')
  TextColumn get csrId => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('csr_title')
  TextColumn get csrTitle => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('csr_description')
  TextColumn get csrDescription =>
      text().withLength(min: 0, max: 1000).nullable()();

  @JsonKey('from_date')
  TextColumn get fromDate => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('to_date')
  TextColumn get toDate => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('is_interested')
  IntColumn get isInterested => integer().nullable()();

  @override
  Set<Column> get primaryKey => {csrId};
}
