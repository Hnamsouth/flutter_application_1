import 'package:flutter_application_1/model/entities_youtube/snippet_model.dart';
import 'package:flutter_application_1/model/entities_youtube/thumnail_model.dart';

class MainResponse {
	String? kind;
	String? etag;
	String? id;
	Snippet? snippet;
  ContentDetails? contentDetails;
  Statistics? statistics;
  SubscriberSnippet? subscriberSnippet;

	MainResponse({this.kind, this.etag, this.id, this.snippet, this.contentDetails, this.statistics,this.subscriberSnippet});

	MainResponse.fromJson(Map<String, dynamic> json) {
		kind = json['kind'];
		etag = json['etag'];
		id = json['id'];
		snippet = json['snippet'] != null ? Snippet.fromJson(json['snippet']) : null;
    contentDetails = json['contentDetails'] != null ? ContentDetails.fromJson(json['contentDetails']) : null;
    statistics = json['statistics'] != null ? Statistics.fromJson(json['statistics']) : null;
    subscriberSnippet = json['subscriberSnippet'] != null ? SubscriberSnippet.fromJson(json['subscriberSnippet']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['kind'] = kind;
		data['etag'] = etag;
		data['id'] = id;
		if (snippet != null) {
      data['snippet'] = snippet!.toJson();
    }
    if (contentDetails != null) {
      data['contentDetails'] = contentDetails!.toJson();
    }
    if (statistics != null) {
      data['statistics'] = statistics!.toJson();
    }
    if (subscriberSnippet != null) {
      data['subscriberSnippet'] = subscriberSnippet!.toJson();
    }
		return data;
	}
}

List<MainResponse> responseToListFromJson(dynamic jsonString) {
  List<dynamic> jsonData = jsonString['items'] as List<dynamic>;
  return jsonData.map((item) => MainResponse.fromJson(item)).toList();
}

class SubscriberSnippet {
  String? title;
  String? description;
  String? channelId;
  String? channelTitle;
  Thumbnails? thumbnails;

  SubscriberSnippet(
      {this.title,
      this.description,
      this.channelId,
      this.channelTitle,
      this.thumbnails,
      });

  SubscriberSnippet.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    channelId = json['channelId'];
    channelTitle = json['channelTitle'];
    thumbnails = json['thumbnails'] != null ? Thumbnails.fromJson(json['thumbnails']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['channelId'] = channelId;
    data['channelTitle'] = channelTitle;
    if (thumbnails != null) {
      data['thumbnails'] = thumbnails!.toJson();
    }
    return data;
  }

}

class Statistics {
  String? viewCount;
  String? likeCount;
  String? dislikeCount;
  String? favoriteCount;
  String? commentCount;

  Statistics({
      this.viewCount,
      this.likeCount,
      this.dislikeCount,
      this.favoriteCount,
      this.commentCount});

  Statistics.fromJson(Map<String, dynamic> json) {
    viewCount = json['viewCount'];
    likeCount = json['likeCount'];
    dislikeCount = json['dislikeCount'];
    favoriteCount = json['favoriteCount'];
    commentCount = json['commentCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['viewCount'] = viewCount;
    data['likeCount'] = likeCount;
    data['dislikeCount'] = dislikeCount;
    data['favoriteCount'] = favoriteCount;
    data['commentCount'] = commentCount;
    return data;
  }

}

class ContentDetails {
  PlaylistItem? playlistItem;

  ContentDetails({this.playlistItem});

  ContentDetails.fromJson(Map<String, dynamic> json) {
    playlistItem = json['playlistItem'] != null
        ? PlaylistItem.fromJson(json['playlistItem'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (playlistItem != null) {
      data['playlistItem'] = playlistItem!.toJson();
    }
    return data;
  }
}

class PlaylistItem {
  ResourceId? resourceId;
  String? playlistId;

  PlaylistItem({this.resourceId, this.playlistId});

  PlaylistItem.fromJson(Map<String, dynamic> json) {
    resourceId = json['resourceId'] != null
        ? ResourceId.fromJson(json['resourceId'])
        : null;
    playlistId = json['playlistId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (resourceId != null) {
      data['resourceId'] = resourceId!.toJson();
    }
    data['playlistId'] = playlistId;
    return data;
  }
}

class ResourceId {
  String? kind;
  String? videoId;

  ResourceId({this.kind, this.videoId});

  ResourceId.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    videoId = json['videoId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kind'] = kind;
    data['videoId'] = videoId;
    return data;
  }
}