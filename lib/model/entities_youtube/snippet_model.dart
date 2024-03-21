import 'package:flutter_application_1/model/entities_youtube/Localized.dart';
import 'package:flutter_application_1/model/entities_youtube/thumnail_model.dart';

class Snippet {
	String? title;
	String? description;
	String? customUrl;
	String? publishedAt;
  String? categoryId;
  String? liveBroadcastContent;
  String? defaultLanguage;

	Thumbnails? thumbnails;
	Localized? localized;
  List<String>? tags;

	Snippet({this.title, this.description, this.customUrl, this.publishedAt, this.thumbnails, this.localized});

	Snippet.fromJson(Map<String, dynamic> json) {
		title = json['title'];
		description = json['description'];
		customUrl = json['customUrl'];
		publishedAt = json['publishedAt'];
		thumbnails = json['thumbnails'] != null ? Thumbnails.fromJson(json['thumbnails']) : null;
		localized = json['localized'] != null ? Localized.fromJson(json['localized']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['title'] = title;
		data['description'] = description;
		data['customUrl'] = customUrl;
		data['publishedAt'] = publishedAt;
		if (thumbnails != null) {
      data['thumbnails'] = thumbnails!.toJson();
    }
		if (localized != null) {
      data['localized'] = localized!.toJson();
    }
		return data;
	}
}

