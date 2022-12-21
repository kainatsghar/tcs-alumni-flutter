import 'package:moor/moor.dart';

class DBEvents extends Table {
  TextColumn get id => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('title')
  TextColumn get title => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('description')
  TextColumn get description =>
      text().withLength(min: 0, max: 5000).nullable()();

  @JsonKey('image')
  TextColumn get image => text().withLength(min: 0, max: 1000).nullable()();

  @JsonKey('start_date')
  TextColumn get startDate => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('end_date')
  TextColumn get endDate => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('venue')
  TextColumn get venue => text().withLength(min: 0, max: 5000).nullable()();

  @JsonKey('city')
  TextColumn get city => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('start_time')
  TextColumn get startTime => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('end_time')
  TextColumn get endTime => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('total_like')
  TextColumn get totalLike => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('is_like')
  TextColumn get isLike => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('total_comments')
  TextColumn get totalComments =>
      text().withLength(min: 0, max: 1000).nullable()();

  @JsonKey('total_going')
  TextColumn get totalGoing => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('is_going')
  TextColumn get isGoing => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('total_interested')
  TextColumn get totalInterested =>
      text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('is_interested')
  TextColumn get isInterested =>
      text().withLength(min: 0, max: 5000).nullable()();

  @JsonKey('is_paid')
  TextColumn get is_paid => text().withLength(min: 0, max: 1000).nullable()();

  @JsonKey('payment_done_by_user')
  TextColumn get paymentByUser =>
      text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('ticket_price')
  TextColumn get ticketPrice =>
      text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('ticket_opening_date')
  TextColumn get ticketOpeningDate =>
      text().withLength(min: 0, max: 5000).nullable()();

  @JsonKey('ticket_ending_date')
  TextColumn get ticketEndingDate =>
      text().withLength(min: 0, max: 1000).nullable()();

  @JsonKey('purchase_address')
  TextColumn get purchaseAddress =>
      text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('payment_open')
  TextColumn get paymentOpen =>
      text().withLength(min: 0, max: 100).nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
