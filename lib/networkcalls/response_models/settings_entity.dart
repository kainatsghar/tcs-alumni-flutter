import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';
import 'package:iobm/local_db/local_db.dart';

class SettingsEntity extends JsonConvert<SettingsEntity> {
  int? success;
  String? message;
  SettingsResult? result;
}

class SettingsResult extends JsonConvert<SettingsResult> {
  List<DBCountrie>? countries;
  List<DBCitie>? cities;
  List<DBBranche>? branches;
  List<DBIndustrie>? industries;
  @JSONField(name: "report_types")
  List<DBReportType>? reportTypes;
  List<DBDegree>? degrees;
  @JSONField(name: "MOBILE_API_BASE_URL")
  String? mobileApiBaseUrl;
}

class SettingsResultCountries extends JsonConvert<SettingsResultCountries> {
  @JSONField(name: "country_id")
  String? countryId;
  @JSONField(name: "country_name")
  String? countryName;
  @JSONField(name: "is_deleted")
  String? isDeleted;
}

class SettingsResultCities extends JsonConvert<SettingsResultCities> {
  @JSONField(name: "country_id")
  String? countryId;
  @JSONField(name: "city_id")
  String? cityId;
  @JSONField(name: "city_name")
  String? cityName;
  @JSONField(name: "is_deleted")
  String? isDeleted;
}

class SettingsResultBranches extends JsonConvert<SettingsResultBranches> {
  String? id;
  String? title;
  @JSONField(name: "city_id")
  String? cityId;
  @JSONField(name: "country_id")
  String? countryId;
  @JSONField(name: "chapter_id")
  String? chapterId;
  @JSONField(name: "is_deleted")
  String? isDeleted;
}

class SettingsResultIndustries extends JsonConvert<SettingsResultIndustries> {
  String? id;
  String? title;
  @JSONField(name: "is_deleted")
  String? isDeleted;
}

class SettingsResultReportTypes extends JsonConvert<SettingsResultReportTypes> {
  String? id;
  String? text;
  @JSONField(name: "created_at")
  String? createdAt;
  @JSONField(name: "is_deleted")
  String? isDeleted;
}

class SettingsResultDegrees extends JsonConvert<SettingsResultDegrees> {
  @JSONField(name: "degree_id")
  String? degreeId;
  @JSONField(name: "branch_id")
  String? branchId;
  @JSONField(name: "degree_name")
  String? degreeName;
  @JSONField(name: "degree_description")
  String? degreeDescription;
  @JSONField(name: "is_deleted")
  String? isDeleted;
  @JSONField(name: "update_date")
  String? updateDate;
}
