import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';

class ContactEntity extends JsonConvert<ContactEntity> {
  int? success;
  String? message;
  ContactResult? result;
}

class ContactResult extends JsonConvert<ContactResult> {
  String? id;
  String? email;
  String? fax;
  @JSONField(name: "phone_no")
  String? phoneNo;
  String? address;
  String? website;
  @JSONField(name: "phone_ext")
  String? phoneExt;
  @JSONField(name: "website_add")
  String? websiteAdd;
  @JSONField(name: "whatsapp_link")
  String? whatsappLink;
  @JSONField(name: "facebook_link")
  String? facebookLink;
  @JSONField(name: "youtube_link")
  String? youtubeLink;
  @JSONField(name: "linkedin_link")
  String? linkedinLink;
  @JSONField(name: "twitter_link")
  String? twitterLink;
  @JSONField(name: "instagram_link")
  String? instagramLink;
}
