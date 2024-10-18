import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';
import 'package:iobm/local_db/local_db.dart';

class DiscountEntity extends JsonConvert<DiscountEntity> {
  int? success;
  String? message;
  DiscountResult? result;
}

class DiscountResult extends JsonConvert<DiscountResult> {
  @JSONField(name: "discount_partners")
  List<DBDiscount>? discountPartners;
}

class DiscountResultDiscountPartners
    extends JsonConvert<DiscountResultDiscountPartners> {
  String? id;
  String? title;
  String? latitude;
  String? longitude;
  String? address;
  @JSONField(name: "city_name")
  String? cityName;
  String? image;
  @JSONField(name: "percent_off")
  String? percentOff;
  @JSONField(name: "from_date")
  String? fromDate;
  @JSONField(name: "to_date")
  String? toDate;
  @JSONField(name: "is_active")
  String? isActive;
  @JSONField(name: "added_by")
  String? addedBy;
  @JSONField(name: "cover_image")
  String? coverImage;
  @JSONField(name: "code_name")
  String? codeName;
}
