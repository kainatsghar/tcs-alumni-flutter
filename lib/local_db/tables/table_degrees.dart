import 'package:moor/moor.dart';

class DBDegrees extends Table {
  @JsonKey("degree_id")
  TextColumn get degreeId => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('branch_id')
  TextColumn get branchId => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('degree_name')
  TextColumn get degreeName => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('degree_description')
  TextColumn get degreeDescription =>
      text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('update_date')
  TextColumn get updateDate => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('is_deleted')
  TextColumn get isDeleted => text().withLength(min: 0, max: 100).nullable()();

  @override
  Set<Column> get primaryKey => {degreeId};
}
