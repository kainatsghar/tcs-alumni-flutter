import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';
import 'package:iobm/local_db/local_db.dart';

class SettingsEntity with JsonConvert<SettingsEntity> {
  int? success;
  String? message;
  SettingsResult? result;
}

class SettingsResult with JsonConvert<SettingsResult> {
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

class SettingsResultCountries with JsonConvert<SettingsResultCountries> {
  @JSONField(name: "country_id")
  String? countryId;
  @JSONField(name: "country_name")
  String? countryName;
  @JSONField(name: "is_deleted")
  String? isDeleted;
}

class SettingsResultCities with JsonConvert<SettingsResultCities> {
  @JSONField(name: "country_id")
  String? countryId;
  @JSONField(name: "city_id")
  String? cityId;
  @JSONField(name: "city_name")
  String? cityName;
  @JSONField(name: "is_deleted")
  String? isDeleted;
}

class SettingsResultBranches with JsonConvert<SettingsResultBranches> {
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

class SettingsResultIndustries with JsonConvert<SettingsResultIndustries> {
  String? id;
  String? title;
  @JSONField(name: "is_deleted")
  String? isDeleted;
}

class SettingsResultReportTypes with JsonConvert<SettingsResultReportTypes> {
  String? id;
  String? text;
  @JSONField(name: "created_at")
  String? createdAt;
  @JSONField(name: "is_deleted")
  String? isDeleted;
}

class SettingsResultDegrees with JsonConvert<SettingsResultDegrees> {
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
