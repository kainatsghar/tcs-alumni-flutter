import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';
import 'package:iobm/local_db/local_db.dart';

class GalleriesEntity with JsonConvert<GalleriesEntity> {
  late int success;
  late String message;
  late List<DBGallerie> gallery;
}

class GalleriesGallery with JsonConvert<GalleriesGallery> {
  @JSONField(name: "gallery_id")
  late String galleryId;
  @JSONField(name: "gallery_title")
  late String galleryTitle;
  @JSONField(name: "created_date")
  late String createdDate;
  @JSONField(name: "gallery_image")
  late String galleryImage;
}
