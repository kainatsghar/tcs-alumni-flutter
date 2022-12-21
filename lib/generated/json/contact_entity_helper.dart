import 'package:iobm/networkcalls/response_models/contact_entity.dart';

contactEntityFromJson(ContactEntity data, Map<String, dynamic> json) {
  if (json['success'] != null) {
    data.success = json['success'] is String
        ? int.tryParse(json['success'])
        : json['success'].toInt();
  }
  if (json['message'] != null) {
    data.message = json['message'].toString();
  }
  if (json['result'] != null) {
    data.result = ContactResult().fromJson(json['result']);
  }
  return data;
}

Map<String, dynamic> contactEntityToJson(ContactEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = entity.success;
  data['message'] = entity.message;
  data['result'] = entity.result?.toJson();
  return data;
}

contactResultFromJson(ContactResult data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['email'] != null) {
    data.email = json['email'].toString();
  }
  if (json['fax'] != null) {
    data.fax = json['fax'].toString();
  }
  if (json['phone_no'] != null) {
    data.phoneNo = json['phone_no'].toString();
  }
  if (json['address'] != null) {
    data.address = json['address'].toString();
  }
  if (json['website'] != null) {
    data.website = json['website'].toString();
  }
  if (json['phone_ext'] != null) {
    data.phoneExt = json['phone_ext'].toString();
  }
  if (json['website_add'] != null) {
    data.websiteAdd = json['website_add'].toString();
  }
  if (json['whatsapp_link'] != null) {
    data.whatsappLink = json['whatsapp_link'].toString();
  }
  if (json['facebook_link'] != null) {
    data.facebookLink = json['facebook_link'].toString();
  }
  if (json['youtube_link'] != null) {
    data.youtubeLink = json['youtube_link'].toString();
  }
  if (json['linkedin_link'] != null) {
    data.linkedinLink = json['linkedin_link'].toString();
  }
  if (json['twitter_link'] != null) {
    data.twitterLink = json['twitter_link'].toString();
  }
  if (json['instagram_link'] != null) {
    data.instagramLink = json['instagram_link'].toString();
  }
  return data;
}

Map<String, dynamic> contactResultToJson(ContactResult entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['email'] = entity.email;
  data['fax'] = entity.fax;
  data['phone_no'] = entity.phoneNo;
  data['address'] = entity.address;
  data['website'] = entity.website;
  data['phone_ext'] = entity.phoneExt;
  data['website_add'] = entity.websiteAdd;
  data['whatsapp_link'] = entity.whatsappLink;
  data['facebook_link'] = entity.facebookLink;
  data['youtube_link'] = entity.youtubeLink;
  data['linkedin_link'] = entity.linkedinLink;
  data['twitter_link'] = entity.twitterLink;
  data['instagram_link'] = entity.instagramLink;
  return data;
}
