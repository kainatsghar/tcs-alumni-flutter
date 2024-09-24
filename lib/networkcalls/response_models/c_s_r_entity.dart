import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';
import 'package:iobm/local_db/local_db.dart';

class CSREntity extends JsonConvert<CSREntity> {
  late int success;
  late String message;
  late List<DBCSR> result;
}

class CSRResult extends JsonConvert<CSRResult> {
  @JSONField(name: "csr_id")
  late String csrId;
  @JSONField(name: "csr_title")
  late String csrTitle;
  @JSONField(name: "csr_description")
  late String csrDescription;
  @JSONField(name: "from_date")
  late String fromDate;
  @JSONField(name: "to_date")
  late String toDate;
  @JSONField(name: "is_interested")
  late int isInterested;
}
