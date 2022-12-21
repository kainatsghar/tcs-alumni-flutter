import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';
import 'package:iobm/local_db/local_db.dart';

class EventsEntity with JsonConvert<EventsEntity> {
  late int success;
  late String message;
  late EventsResult result;
}

class EventsResult with JsonConvert<EventsResult> {
  late List<DBEvent> post;
}

class EventsResultPost with JsonConvert<EventsResultPost> {
  late String id;
  late String title;
  late String description;
  late String image;
  @JSONField(name: "start_date")
  late String startDate;
  @JSONField(name: "end_date")
  late String endDate;
  late String venue;
  late String city;
  @JSONField(name: "created_at")
  late String createdAt;
  @JSONField(name: "start_time")
  late String startTime;
  @JSONField(name: "end_time")
  late String endTime;
  @JSONField(name: "total_like")
  late String totalLike;
  @JSONField(name: "is_like")
  late String isLike;
  @JSONField(name: "total_comments")
  late String totalComments;
  @JSONField(name: "total_going")
  late String totalGoing;
  @JSONField(name: "is_going")
  late String isGoing;
  @JSONField(name: "total_interested")
  late String totalInterested;
  @JSONField(name: "is_interested")
  late String isInterested;
  @JSONField(name: "is_paid")
  late String isPaid;
  @JSONField(name: "payment_done_by_user")
  late String paymentDoneByUser;
  @JSONField(name: "ticket_price")
  late String ticketPrice;
  @JSONField(name: "ticket_opening_date")
  late String ticketOpeningDate;
  @JSONField(name: "ticket_ending_date")
  late String ticketEndingDate;
  @JSONField(name: "purchase_address")
  late String purchaseAddress;
  @JSONField(name: "payment_open")
  late String paymentOpen;
}
