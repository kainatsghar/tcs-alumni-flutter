import 'package:moor/moor.dart';

class DBContacts extends Table {
  TextColumn get id => text().withLength(min: 0, max: 100).nullable()();

  TextColumn get email => text().withLength(min: 0, max: 500).nullable()();

  TextColumn get fax => text().withLength(min: 0, max: 100).nullable()();

  @JsonKey('phone_no')
  TextColumn get phone => text().withLength(min: 0, max: 100).nullable()();

  TextColumn get address => text().withLength(min: 0, max: 500).nullable()();

  TextColumn get website => text().withLength(min: 0, max: 500).nullable()();

  @JsonKey('website_add')
  TextColumn get websiteAddress =>
      text().withLength(min: 0, max: 1000).nullable()();

  @JsonKey('phone_ext')
  TextColumn get phoneExt =>
      text().withLength(min: 0, max: 1000).nullable()();

  @JsonKey('whatsapp_link')
  TextColumn get whatsappLink =>
      text().withLength(min: 0, max: 1000).nullable()();

  @JsonKey('facebook_link')
  TextColumn get faceBookLink =>
      text().withLength(min: 0, max: 1000).nullable()();

  @JsonKey('youtube_link')
  TextColumn get youtubeLink =>
      text().withLength(min: 0, max: 1000).nullable()();

  @JsonKey('linkedin_link')
  TextColumn get linkedInUrl =>
      text().withLength(min: 0, max: 1000).nullable()();

  @JsonKey('twitter_link')
  TextColumn get twitterLink =>
      text().withLength(min: 0, max: 1000).nullable()();

  @JsonKey('instagram_link')
  TextColumn get instagramLink =>
      text().withLength(min: 0, max: 1000).nullable()();
}
