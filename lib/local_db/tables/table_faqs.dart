import 'package:moor/moor.dart';

class DBFaqs extends Table {
  @JsonKey('question_id')
  TextColumn get questionId => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('question')
  TextColumn get question => text().withLength(min: 0, max: 5000).nullable()();

  @JsonKey('question_answer')
  TextColumn get questionAnswer =>
      text().withLength(min: 0, max: 5000).nullable()();

  @JsonKey('status')
  TextColumn get status => text().withLength(min: 0, max: 100).nullable()();

  @override
  Set<Column> get primaryKey => {questionId};
}
