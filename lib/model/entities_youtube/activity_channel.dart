import 'package:flutter_application_1/model/entities_youtube/snippet_model.dart';

class ChannelActivity {
	String? kind;
	String? etag;
	String? id;
	Snippet? snippet;
  ContentDetails? contentDetails;

	ChannelActivity({this.kind, this.etag, this.id, this.snippet, this.contentDetails});

	ChannelActivity.fromJson(Map<String, dynamic> json) {
		kind = json['kind'];
		etag = json['etag'];
		id = json['id'];
		snippet = json['snippet'] != null ? Snippet.fromJson(json['snippet']) : null;
    contentDetails = json['contentDetails'] != null ? ContentDetails.fromJson(json['contentDetails']) : null;
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
		return data;
	}
}

List<ChannelActivity> channelActivitiesFromJson(dynamic jsonString) {
  List<dynamic> jsonData = jsonString['items'] as List<dynamic>;
  return jsonData.map((item) => ChannelActivity.fromJson(item)).toList();
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