// ignore_for_file: non_constant_identifier_names


import 'package:flutter_application_1/model/entities_youtube/snippet_model.dart';


class Channel {
  	String? kind;
	String? etag;
	String? id;
	Snippet? snippet;
	Channel({this.kind, this.etag, this.id, this.snippet});


	Channel.fromJson(Map<String, dynamic> json) {
		kind = json['kind'];
		etag = json['etag'];
		id = json['id'];
		snippet = json['snippet'] != null ? Snippet.fromJson(json['snippet']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['kind'] = kind;
		data['etag'] = etag;
		data['id'] = id;
		if (snippet != null) {
      data['snippet'] = snippet!.toJson();
    }
		return data;
	}
}








