import 'package:iobm/generated/json/base/json_convert_content.dart';
import 'package:iobm/generated/json/base/json_field.dart';

class YoutubeEntity with JsonConvert<YoutubeEntity> {
  String? kind;
  String? etag;
  String? nextPageToken;
  List<YoutubeItems>? items;
  YoutubePageInfo? pageInfo;
}

class YoutubeItems with JsonConvert<YoutubeItems> {
  String? kind;
  String? etag;
  String? id;
  YoutubeItemsSnippet? snippet;
}

class YoutubeItemsSnippet with JsonConvert<YoutubeItemsSnippet> {
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
    with JsonConvert<YoutubeItemsSnippetThumbnails> {
  @JSONField(name: "default")
  YoutubeItemsSnippetThumbnailsDefault? xDefault;
  YoutubeItemsSnippetThumbnailsMedium? medium;
  YoutubeItemsSnippetThumbnailsHigh? high;
}

class YoutubeItemsSnippetThumbnailsDefault
    with JsonConvert<YoutubeItemsSnippetThumbnailsDefault> {
  String? url;
  int? width;
  int? height;
}

class YoutubeItemsSnippetThumbnailsMedium
    with JsonConvert<YoutubeItemsSnippetThumbnailsMedium> {
  String? url;
  int? width;
  int? height;
}

class YoutubeItemsSnippetThumbnailsHigh
    with JsonConvert<YoutubeItemsSnippetThumbnailsHigh> {
  String? url;
  int? width;
  int? height;
}

class YoutubeItemsSnippetResourceId
    with JsonConvert<YoutubeItemsSnippetResourceId> {
  String? kind;
  String? videoId;
}

class YoutubePageInfo with JsonConvert<YoutubePageInfo> {
  int? totalResults;
  int? resultsPerPage;
}
