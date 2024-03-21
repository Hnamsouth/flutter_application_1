class ThumbnailSize {
  String? url;
  int? width;
  int? height;

  ThumbnailSize({this.url, this.width, this.height});

  ThumbnailSize.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}

class Thumbnails {
  ThumbnailSize? defaults;
  ThumbnailSize? medium;
  ThumbnailSize? high;

  Thumbnails({this.defaults, this.medium, this.high});

  Thumbnails.fromJson(Map<String, dynamic> json) {
    defaults = json['default'] != null
        ? ThumbnailSize.fromJson(json['default'])
        : null;
    medium =
        json['medium'] != null ? ThumbnailSize.fromJson(json['medium']) : null;
    high = json['high'] != null ? ThumbnailSize.fromJson(json['high']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (defaults != null) {
      data['default'] = defaults!.toJson();
    }
    if (medium != null) {
      data['medium'] = medium!.toJson();
    }
    if (high != null) {
      data['high'] = high!.toJson();
    }
    return data;
  }
}
