import 'package:iobm/networkcalls/response_models/events_entity.dart';
import 'package:iobm/local_db/local_db.dart';

eventsEntityFromJson(EventsEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['result'] != null) {
    data.result = EventsResult().fromJson(json['result']);
  }
  return data;
}

Map<String, dynamic> eventsEntityToJson(EventsEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result.toJson();
  return data;
}

eventsResultFromJson(EventsResult data, Map<String, dynamic> json) {
  if (json['post'] != null) {
    data.post = (json['post'] as List).map((v) => DBEvent.fromJson(v)).toList();
  }
  return data;
}

Map<String, dynamic> eventsResultToJson(EventsResult entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['post'] = entity.post.map((v) => v.toJson()).toList();
  return data;
}

eventsResultPostFromJson(EventsResultPost data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['title'] != null) {
    data.title = json['title'].toString();
  }
  if (json['description'] != null) {
    data.description = json['description'].toString();
  }
  if (json['image'] != null) {
    data.image = json['image'].toString();
  }
  if (json['start_date'] != null) {
    data.startDate = json['start_date'].toString();
  }
  if (json['end_date'] != null) {
    data.endDate = json['end_date'].toString();
  }
  if (json['venue'] != null) {
    data.venue = json['venue'].toString();
  }
  if (json['city'] != null) {
    data.city = json['city'].toString();
  }
  if (json['created_at'] != null) {
    data.createdAt = json['created_at'].toString();
  }
  if (json['start_time'] != null) {
    data.startTime = json['start_time'].toString();
  }
  if (json['end_time'] != null) {
    data.endTime = json['end_time'].toString();
  }
  if (json['total_like'] != null) {
    data.totalLike = json['total_like'].toString();
  }
  if (json['is_like'] != null) {
    data.isLike = json['is_like'].toString();
  }
  if (json['total_comments'] != null) {
    data.totalComments = json['total_comments'].toString();
  }
  if (json['total_going'] != null) {
    data.totalGoing = json['total_going'].toString();
  }
  if (json['is_going'] != null) {
    data.isGoing = json['is_going'].toString();
  }
  if (json['total_interested'] != null) {
    data.totalInterested = json['total_interested'].toString();
  }
  if (json['is_interested'] != null) {
    data.isInterested = json['is_interested'].toString();
  }
  if (json['is_paid'] != null) {
    data.isPaid = json['is_paid'].toString();
  }
  if (json['payment_done_by_user'] != null) {
    data.paymentDoneByUser = json['payment_done_by_user'].toString();
  }
  if (json['ticket_price'] != null) {
    data.ticketPrice = json['ticket_price'].toString();
  }
  if (json['ticket_opening_date'] != null) {
    data.ticketOpeningDate = json['ticket_opening_date'].toString();
  }
  if (json['ticket_ending_date'] != null) {
    data.ticketEndingDate = json['ticket_ending_date'].toString();
  }
  if (json['purchase_address'] != null) {
    data.purchaseAddress = json['purchase_address'].toString();
  }
  if (json['payment_open'] != null) {
    data.paymentOpen = json['payment_open'].toString();
  }
  return data;
}

Map<String, dynamic> eventsResultPostToJson(EventsResultPost entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['description'] = entity.description;
  data['image'] = entity.image;
  data['start_date'] = entity.startDate;
  data['end_date'] = entity.endDate;
  data['venue'] = entity.venue;
  data['city'] = entity.city;
  data['created_at'] = entity.createdAt;
  data['start_time'] = entity.startTime;
  data['end_time'] = entity.endTime;
  data['total_like'] = entity.totalLike;
  data['is_like'] = entity.isLike;
  data['total_comments'] = entity.totalComments;
  data['total_going'] = entity.totalGoing;
  data['is_going'] = entity.isGoing;
  data['total_interested'] = entity.totalInterested;
  data['is_interested'] = entity.isInterested;
  data['is_paid'] = entity.isPaid;
  data['payment_done_by_user'] = entity.paymentDoneByUser;
  data['ticket_price'] = entity.ticketPrice;
  data['ticket_opening_date'] = entity.ticketOpeningDate;
  data['ticket_ending_date'] = entity.ticketEndingDate;
  data['purchase_address'] = entity.purchaseAddress;
  data['payment_open'] = entity.paymentOpen;
  return data;
}
