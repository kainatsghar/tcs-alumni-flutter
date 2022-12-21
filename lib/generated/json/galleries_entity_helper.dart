import 'package:iobm/networkcalls/response_models/galleries_entity.dart';
import 'package:iobm/local_db/local_db.dart';

galleriesEntityFromJson(GalleriesEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['gallery'] != null) {
    data.gallery =
        (json['gallery'] as List).map((v) => DBGallerie.fromJson(v)).toList();
  }
  return data;
}

Map<String, dynamic> galleriesEntityToJson(GalleriesEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['gallery'] = entity.gallery.map((v) => v.toJson()).toList();
  return data;
}

galleriesGalleryFromJson(GalleriesGallery data, Map<String, dynamic> json) {
  if (json['gallery_id'] != null) {
    data.galleryId = json['gallery_id'].toString();
  }
  if (json['gallery_title'] != null) {
    data.galleryTitle = json['gallery_title'].toString();
  }
  if (json['created_date'] != null) {
    data.createdDate = json['created_date'].toString();
  }
  if (json['gallery_image'] != null) {
    data.galleryImage = json['gallery_image'].toString();
  }
  return data;
}

Map<String, dynamic> galleriesGalleryToJson(GalleriesGallery entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['gallery_id'] = entity.galleryId;
  data['gallery_title'] = entity.galleryTitle;
  data['created_date'] = entity.createdDate;
  data['gallery_image'] = entity.galleryImage;
  return data;
}
