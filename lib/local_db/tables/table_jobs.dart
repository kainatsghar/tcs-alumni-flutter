import 'package:moor/moor.dart';

class DBJobs extends Table {
  TextColumn get id => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('designation')
  TextColumn get designation =>
      text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('company_name')
  TextColumn get companyName =>
      text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('job_link')
  TextColumn get joblink => text().withLength(min: 0, max: 1000).nullable()();

  @JsonKey('due_date')
  TextColumn get duaDate => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('posted_by')
  TextColumn get postedBy => text().withLength(min: 0, max: 1000).nullable()();
  @JsonKey('first_name')
  TextColumn get firstName => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('last_name')
  TextColumn get lastName => text().withLength(min: 0, max: 1000).nullable()();
  @JsonKey('user_image')
  TextColumn get userImage => text().withLength(min: 0, max: 1000).nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
