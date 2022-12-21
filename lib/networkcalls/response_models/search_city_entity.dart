// To parse this JSON data, do
//
//     final searchCityEntity = searchCityEntityFromMap(jsonString);

import 'dart:convert';

class SearchCityEntity {
  SearchCityEntity({
    this.success,
    this.message,
    this.city,
  });

  int? success;
  String? message;
  List<City>? city;

  factory SearchCityEntity.fromJson(String str) =>
      SearchCityEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SearchCityEntity.fromMap(Map<String, dynamic> json) =>
      SearchCityEntity(
        success: json["success"],
        message: json["message"],
        city: List<City>.from(json["city"].map((x) => City.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "city": List<dynamic>.from(city!.map((x) => x.toMap())),
      };
}

class City {
  City({
    this.countryId,
    this.cityId,
    this.cityName,
    this.stateId,
    this.isDeleted,
    this.updateDate,
  });

  int? countryId;
  int? cityId;
  String? cityName;
  int? stateId;
  String? isDeleted;
  String? updateDate;

  factory City.fromJson(String str) => City.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory City.fromMap(Map<String, dynamic> json) => City(
        countryId: json["country_id"],
        cityId: json["city_id"],
        cityName: json["city_name"],
        stateId: json["state_id"],
        isDeleted: json["is_deleted"],
        updateDate: json["update_date"],
      );

  Map<String, dynamic> toMap() => {
        "country_id": countryId,
        "city_id": cityId,
        "city_name": cityName,
        "state_id": stateId,
        "is_deleted": isDeleted,
        "update_date": updateDate,
      };
}
