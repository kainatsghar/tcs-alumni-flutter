import 'package:iobm/networkcalls/response_models/discount_entity.dart';
import 'package:iobm/local_db/local_db.dart';

discountEntityFromJson(DiscountEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['result'] != null) {
    data.result = DiscountResult().fromJson(json['result']);
  }
  return data;
}

Map<String, dynamic> discountEntityToJson(DiscountEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result?.toJson();
  return data;
}

discountResultFromJson(DiscountResult data, Map<String, dynamic> json) {
  if (json['discount_partners'] != null) {
    data.discountPartners = (json['discount_partners'] as List)
        .map((v) => DBDiscount.fromJson(v))
        .toList();
  }
  return data;
}

Map<String, dynamic> discountResultToJson(DiscountResult entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['discount_partners'] =
      entity.discountPartners?.map((v) => v.toJson()).toList();
  return data;
}

discountResultDiscountPartnersFromJson(
    DiscountResultDiscountPartners data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['title'] != null) {
    data.title = json['title'].toString();
  }
  if (json['latitude'] != null) {
    data.latitude = json['latitude'].toString();
  }
  if (json['longitude'] != null) {
    data.longitude = json['longitude'].toString();
  }
  if (json['address'] != null) {
    data.address = json['address'].toString();
  }
  if (json['city_name'] != null) {
    data.cityName = json['city_name'].toString();
  }
  if (json['image'] != null) {
    data.image = json['image'].toString();
  }
  if (json['percent_off'] != null) {
    data.percentOff = json['percent_off'].toString();
  }
  if (json['from_date'] != null) {
    data.fromDate = json['from_date'].toString();
  }
  if (json['to_date'] != null) {
    data.toDate = json['to_date'].toString();
  }
  if (json['is_active'] != null) {
    data.isActive = json['is_active'].toString();
  }
  if (json['added_by'] != null) {
    data.addedBy = json['added_by'].toString();
  }
  if (json['cover_image'] != null) {
    data.coverImage = json['cover_image'].toString();
  }
  return data;
}

Map<String, dynamic> discountResultDiscountPartnersToJson(
    DiscountResultDiscountPartners entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['latitude'] = entity.latitude;
  data['longitude'] = entity.longitude;
  data['address'] = entity.address;
  data['city_name'] = entity.cityName;
  data['image'] = entity.image;
  data['percent_off'] = entity.percentOff;
  data['from_date'] = entity.fromDate;
  data['to_date'] = entity.toDate;
  data['is_active'] = entity.isActive;
  data['added_by'] = entity.addedBy;
  data['cover_image'] = entity.coverImage;
  return data;
}
