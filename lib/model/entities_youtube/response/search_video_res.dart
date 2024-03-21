import 'package:flutter_application_1/model/entities_youtube/snippet_model.dart';

class SearchVideoResponse {
	String? kind;
	String? etag;
	Snippet? snippet;
  Id? id;
  String? channelTitle;
  String?  liveBroadcastContent;


	SearchVideoResponse({this.kind, this.etag, this.id, this.snippet,this.channelTitle,this.liveBroadcastContent});

	SearchVideoResponse.fromJson(Map<String, dynamic> json) {
		kind = json['kind'];
		etag = json['etag'];
    id = json['id'] != null ? Id.fromJson(json['id']) : null;
		snippet = json['snippet'] != null ? Snippet.fromJson(json['snippet']) : null;
    channelTitle = json['channelTitle'];
    liveBroadcastContent = json['liveBroadcastContent'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['kind'] = kind;
		data['etag'] = etag;
		data['id'] = id;
		if (snippet != null) {
      data['snippet'] = snippet!.toJson();
    }
    data['channelTitle'] = channelTitle;
    data['liveBroadcastContent'] = liveBroadcastContent;
		return data;
	}
}
class Id {
  String? kind;
  String? videoId;
  String? channelId;
  String? playlistId;

  Id({this.kind, this.videoId,this.channelId,this.playlistId});

  Id.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    videoId = json['videoId'];
    channelId = json['channelId'];
    playlistId = json['playlistId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kind'] = kind;
    data['videoId'] = videoId;
    data['channelId'] = channelId;
    data['playlistId'] = playlistId;
    return data;
  }
}

List<SearchVideoResponse> searchVideoFromJson(dynamic jsonString) {
  List<dynamic> jsonData = jsonString['items'] as List<dynamic>;
  return jsonData.map((item) => SearchVideoResponse.fromJson(item)).toList();
}