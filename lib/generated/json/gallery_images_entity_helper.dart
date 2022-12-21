import 'package:iobm/networkcalls/response_models/gallery_images_entity.dart';
import 'package:iobm/local_db/local_db.dart';

galleryImagesEntityFromJson(
    GalleryImagesEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['gallery_images'] != null) {
    data.galleryImages = (json['gallery_images'] as List)
        .map((v) => DBGalleryImage.fromJson(v))
        .toList();
  }
  return data;
}

Map<String, dynamic> galleryImagesEntityToJson(GalleryImagesEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['gallery_images'] = entity.galleryImages.map((v) => v.toJson()).toList();
  return data;
}

galleryImagesGalleryImagesFromJson(
    GalleryImagesGalleryImages data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['gallery_id'] != null) {
    data.galleryId = json['gallery_id'].toString();
  }
  if (json['image'] != null) {
    data.image = json['image'].toString();
  }
  return data;
}

Map<String, dynamic> galleryImagesGalleryImagesToJson(
    GalleryImagesGalleryImages entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['gallery_id'] = entity.galleryId;
  data['image'] = entity.image;
  return data;
}
