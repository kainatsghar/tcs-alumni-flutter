import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';

class YoutubeEntity extends JsonConvert<YoutubeEntity> {
  String? kind;
  String? etag;
  String? nextPageToken;
  List<YoutubeItems>? items;
  YoutubePageInfo? pageInfo;
}

class YoutubeItems extends JsonConvert<YoutubeItems> {
  String? kind;
  String? etag;
  String? id;
  YoutubeItemsSnippet? snippet;
}

class YoutubeItemsSnippet extends JsonConvert<YoutubeItemsSnippet> {
  String? publishedAt;
  String? channelId;
  String? title;
  String? description;
  YoutubeItemsSnippetThumbnails? thumbnails;
  String? channelTitle;
  String? playlistId;
  int? position;
  YoutubeItemsSnippetResourceId? resourceId;
  String? videoOwnerChannelTitle;
  String? videoOwnerChannelId;
}

class YoutubeItemsSnippetThumbnails
    extends JsonConvert<YoutubeItemsSnippetThumbnails> {
  @JSONField(name: "default")
  YoutubeItemsSnippetThumbnailsDefault? xDefault;
  YoutubeItemsSnippetThumbnailsMedium? medium;
  YoutubeItemsSnippetThumbnailsHigh? high;
}

class YoutubeItemsSnippetThumbnailsDefault
    extends JsonConvert<YoutubeItemsSnippetThumbnailsDefault> {
  String? url;
  int? width;
  int? height;
}

class YoutubeItemsSnippetThumbnailsMedium
    extends JsonConvert<YoutubeItemsSnippetThumbnailsMedium> {
  String? url;
  int? width;
  int? height;
}

class YoutubeItemsSnippetThumbnailsHigh
    extends JsonConvert<YoutubeItemsSnippetThumbnailsHigh> {
  String? url;
  int? width;
  int? height;
}

class YoutubeItemsSnippetResourceId
    extends JsonConvert<YoutubeItemsSnippetResourceId> {
  String? kind;
  String? videoId;
}

class YoutubePageInfo extends JsonConvert<YoutubePageInfo> {
  int? totalResults;
  int? resultsPerPage;
}
