import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';
import 'package:iobm/local_db/local_db.dart';

class GalleryImagesEntity extends JsonConvert<GalleryImagesEntity> {
  late int success;
  late String message;
  @JSONField(name: "gallery_images")
  late List<DBGalleryImage> galleryImages;
}

class GalleryImagesGalleryImages extends JsonConvert<GalleryImagesGalleryImages> {
  late String id;
  @JSONField(name: "gallery_id")
  late String galleryId;
  late String image;
}
