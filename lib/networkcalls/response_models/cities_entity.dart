import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';
import 'package:iobm/local_db/local_db.dart';

class CitiesEntity extends JsonConvert<CitiesEntity> {
  late int success;
  late String message;
  late List<DBCitie> cities;
}

class CitiesCities extends JsonConvert<CitiesCities> {
  @JSONField(name: "country_id")
  late String countryId;
  @JSONField(name: "city_id")
  late String cityId;
  @JSONField(name: "city_name")
  late String cityName;
  @JSONField(name: "state_id")
  late String stateId;
  @JSONField(name: "is_deleted")
  late String isDeleted;
  @JSONField(name: "update_date")
  late String updateDate;
}
