import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';
import 'package:iobm/local_db/local_db.dart';

class CompanyHintsEntity with JsonConvert<CompanyHintsEntity> {
  int? success;
  String? message;
  @JSONField(name: "company_hints")
  List<DBCompanie>? companyHints;
}

class CompanyHintsCompanyHints with JsonConvert<CompanyHintsCompanyHints> {
  String? id;
  String? title;
  String? image;
  @JSONField(name: "logo_changeable")
  String? logoChangeable;
  int? workers;
}
