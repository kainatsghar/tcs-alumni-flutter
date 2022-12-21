import 'package:iobm/networkcalls/response_models/cities_entity.dart';
import 'package:iobm/local_db/local_db.dart';

citiesEntityFromJson(CitiesEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['cities'] != null) {
    data.cities =
        (json['cities'] as List).map((v) => DBCitie.fromJson(v)).toList();
  }
  return data;
}

Map<String, dynamic> citiesEntityToJson(CitiesEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['cities'] = entity.cities.map((v) => v.toJson()).toList();
  return data;
}

citiesCitiesFromJson(CitiesCities data, Map<String, dynamic> json) {
  if (json['country_id'] != null) {
    data.countryId = json['country_id'].toString();
  }
  if (json['city_id'] != null) {
    data.cityId = json['city_id'].toString();
  }
  if (json['city_name'] != null) {
    data.cityName = json['city_name'].toString();
  }
  if (json['state_id'] != null) {
    data.stateId = json['state_id'].toString();
  }
  if (json['is_deleted'] != null) {
    data.isDeleted = json['is_deleted'].toString();
  }
  if (json['update_date'] != null) {
    data.updateDate = json['update_date'].toString();
  }
  return data;
}

Map<String, dynamic> citiesCitiesToJson(CitiesCities entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['country_id'] = entity.countryId;
  data['city_id'] = entity.cityId;
  data['city_name'] = entity.cityName;
  data['state_id'] = entity.stateId;
  data['is_deleted'] = entity.isDeleted;
  data['update_date'] = entity.updateDate;
  return data;
}
