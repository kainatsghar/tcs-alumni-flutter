import 'package:iobm/networkcalls/response_models/youtube_entity.dart';

youtubeEntityFromJson(YoutubeEntity data, Map<String, dynamic> json) {
  if (json['kind'] != null) {
    data.kind = json['kind'].toString();
  }
  if (json['etag'] != null) {
    data.etag = json['etag'].toString();
  }
  if (json['nextPageToken'] != null) {
    data.nextPageToken = json['nextPageToken'].toString();
  }
  if (json['items'] != null) {
    data.items =
        (json['items'] as List).map((v) => YoutubeItems().fromJson(v)).toList();
  }
  if (json['pageInfo'] != null) {
    data.pageInfo = YoutubePageInfo().fromJson(json['pageInfo']);
  }
  return data;
}

Map<String, dynamic> youtubeEntityToJson(YoutubeEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['kind'] = entity.kind;
  data['etag'] = entity.etag;
  data['nextPageToken'] = entity.nextPageToken;
  data['items'] = entity.items?.map((v) => v.toJson()).toList();
  data['pageInfo'] = entity.pageInfo?.toJson();
  return data;
}

youtubeItemsFromJson(YoutubeItems data, Map<String, dynamic> json) {
  if (json['kind'] != null) {
    data.kind = json['kind'].toString();
  }
  if (json['etag'] != null) {
    data.etag = json['etag'].toString();
  }
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['snippet'] != null) {
    data.snippet = YoutubeItemsSnippet().fromJson(json['snippet']);
  }
  return data;
}

Map<String, dynamic> youtubeItemsToJson(YoutubeItems entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['kind'] = entity.kind;
  data['etag'] = entity.etag;
  data['id'] = entity.id;
  data['snippet'] = entity.snippet?.toJson();
  return data;
}

youtubeItemsSnippetFromJson(
    YoutubeItemsSnippet data, Map<String, dynamic> json) {
  if (json['publishedAt'] != null) {
    data.publishedAt = json['publishedAt'].toString();
  }
  if (json['channelId'] != null) {
    data.channelId = json['channelId'].toString();
  }
  if (json['title'] != null) {
    data.title = json['title'].toString();
  }
  if (json['description'] != null) {
    data.description = json['description'].toString();
  }
  if (json['thumbnails'] != null) {
    data.thumbnails =
        YoutubeItemsSnippetThumbnails().fromJson(json['thumbnails']);
  }
  if (json['channelTitle'] != null) {
    data.channelTitle = json['channelTitle'].toString();
  }
  if (json['playlistId'] != null) {
    data.playlistId = json['playlistId'].toString();
  }
  if (json['position'] != null) {
    data.position = json['position'] is String
        ? int.tryParse(json['position'])
        : json['position'].toInt();
  }
  if (json['resourceId'] != null) {
    data.resourceId =
        YoutubeItemsSnippetResourceId().fromJson(json['resourceId']);
  }
  if (json['videoOwnerChannelTitle'] != null) {
    data.videoOwnerChannelTitle = json['videoOwnerChannelTitle'].toString();
  }
  if (json['videoOwnerChannelId'] != null) {
    data.videoOwnerChannelId = json['videoOwnerChannelId'].toString();
  }
  return data;
}

Map<String, dynamic> youtubeItemsSnippetToJson(YoutubeItemsSnippet entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['publishedAt'] = entity.publishedAt;
  data['channelId'] = entity.channelId;
  data['title'] = entity.title;
  data['description'] = entity.description;
  data['thumbnails'] = entity.thumbnails?.toJson();
  data['channelTitle'] = entity.channelTitle;
  data['playlistId'] = entity.playlistId;
  data['position'] = entity.position;
  data['resourceId'] = entity.resourceId?.toJson();
  data['videoOwnerChannelTitle'] = entity.videoOwnerChannelTitle;
  data['videoOwnerChannelId'] = entity.videoOwnerChannelId;
  return data;
}

youtubeItemsSnippetThumbnailsFromJson(
    YoutubeItemsSnippetThumbnails data, Map<String, dynamic> json) {
  if (json['default'] != null) {
    data.xDefault =
        YoutubeItemsSnippetThumbnailsDefault().fromJson(json['default']);
  }
  if (json['medium'] != null) {
    data.medium =
        YoutubeItemsSnippetThumbnailsMedium().fromJson(json['medium']);
  }
  if (json['high'] != null) {
    data.high = YoutubeItemsSnippetThumbnailsHigh().fromJson(json['high']);
  }
  return data;
}

Map<String, dynamic> youtubeItemsSnippetThumbnailsToJson(
    YoutubeItemsSnippetThumbnails entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['default'] = entity.xDefault?.toJson();
  data['medium'] = entity.medium?.toJson();
  data['high'] = entity.high?.toJson();
  return data;
}

youtubeItemsSnippetThumbnailsDefaultFromJson(
    YoutubeItemsSnippetThumbnailsDefault data, Map<String, dynamic> json) {
  if (json['url'] != null) {
    data.url = json['url'].toString();
  }
  if (json['width'] != null) {
    data.width = json['width'] is String
        ? int.tryParse(json['width'])
        : json['width'].toInt();
  }
  if (json['height'] != null) {
    data.height = json['height'] is String
        ? int.tryParse(json['height'])
        : json['height'].toInt();
  }
  return data;
}

Map<String, dynamic> youtubeItemsSnippetThumbnailsDefaultToJson(
    YoutubeItemsSnippetThumbnailsDefault entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['url'] = entity.url;
  data['width'] = entity.width;
  data['height'] = entity.height;
  return data;
}

youtubeItemsSnippetThumbnailsMediumFromJson(
    YoutubeItemsSnippetThumbnailsMedium data, Map<String, dynamic> json) {
  if (json['url'] != null) {
    data.url = json['url'].toString();
  }
  if (json['width'] != null) {
    data.width = json['width'] is String
        ? int.tryParse(json['width'])
        : json['width'].toInt();
  }
  if (json['height'] != null) {
    data.height = json['height'] is String
        ? int.tryParse(json['height'])
        : json['height'].toInt();
  }
  return data;
}

Map<String, dynamic> youtubeItemsSnippetThumbnailsMediumToJson(
    YoutubeItemsSnippetThumbnailsMedium entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['url'] = entity.url;
  data['width'] = entity.width;
  data['height'] = entity.height;
  return data;
}

youtubeItemsSnippetThumbnailsHighFromJson(
    YoutubeItemsSnippetThumbnailsHigh data, Map<String, dynamic> json) {
  if (json['url'] != null) {
    data.url = json['url'].toString();
  }
  if (json['width'] != null) {
    data.width = json['width'] is String
        ? int.tryParse(json['width'])
        : json['width'].toInt();
  }
  if (json['height'] != null) {
    data.height = json['height'] is String
        ? int.tryParse(json['height'])
        : json['height'].toInt();
  }
  return data;
}

Map<String, dynamic> youtubeItemsSnippetThumbnailsHighToJson(
    YoutubeItemsSnippetThumbnailsHigh entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['url'] = entity.url;
  data['width'] = entity.width;
  data['height'] = entity.height;
  return data;
}

youtubeItemsSnippetResourceIdFromJson(
    YoutubeItemsSnippetResourceId data, Map<String, dynamic> json) {
  if (json['kind'] != null) {
    data.kind = json['kind'].toString();
  }
  if (json['videoId'] != null) {
    data.videoId = json['videoId'].toString();
  }
  return data;
}

Map<String, dynamic> youtubeItemsSnippetResourceIdToJson(
    YoutubeItemsSnippetResourceId entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['kind'] = entity.kind;
  data['videoId'] = entity.videoId;
  return data;
}

youtubePageInfoFromJson(YoutubePageInfo data, Map<String, dynamic> json) {
  if (json['totalResults'] != null) {
    data.totalResults = json['totalResults'] is String
        ? int.tryParse(json['totalResults'])
        : json['totalResults'].toInt();
  }
  if (json['resultsPerPage'] != null) {
    data.resultsPerPage = json['resultsPerPage'] is String
        ? int.tryParse(json['resultsPerPage'])
        : json['resultsPerPage'].toInt();
  }
  return data;
}

Map<String, dynamic> youtubePageInfoToJson(YoutubePageInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['totalResults'] = entity.totalResults;
  data['resultsPerPage'] = entity.resultsPerPage;
  return data;
}
