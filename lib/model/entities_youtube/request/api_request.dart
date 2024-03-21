// ignore_for_file: public_member_api_docs, sort_constructors_first

class ApiResquest {
  String key;
  final String part;
  late String? forHandle;
  late int? maxResults;
  late String? channelId;
  late String? q;
  late String? type;
  late String? order;
  late String? pageToken;
  late String? regionCode;
  late String? videoCategoryId;
  late String? videoId;
  late String? chart;
  late String? id;
  late String? mine;
  late String? myRating;
  late String? onBehalfOfContentOwner;
  late String? onBehalfOfContentOwnerChannel;
  late String? categoryId;
  late String? hl;
  late String? location;
  late String? locationRadius;
  late String? maxHeight;
  late String? maxWidth;
  late String? publishedAfter;
  late String? publishedBefore;
  late String? relevanceLanguage;
  late String? safeSearch;
  late String? topicId;
  late String? videoSyndicated;
  late String? videoType;
  late String? fields;
  late String? quotaUser;
  late String? userIp;

  ApiResquest({
    this.key = "AIzaSyAsLvIYVPFXJoABkBgBiFWD85c5HmNw5bA",
    required this.part,
    this.forHandle,
    this.maxResults,
    this.channelId,
    this.q,
    this.type,
    this.order,
    this.pageToken,
    this.regionCode,
    this.videoCategoryId,
    this.videoId,
    this.chart,
    this.id,
    this.mine,
    this.myRating,
    this.onBehalfOfContentOwner,
    this.onBehalfOfContentOwnerChannel,
    this.categoryId,
    this.hl,
    this.location,
    this.locationRadius,
    this.maxHeight,
    this.maxWidth,
    this.publishedAfter,
    this.publishedBefore,
    this.relevanceLanguage,
    this.safeSearch,
    this.topicId,
    this.videoSyndicated,
    this.videoType,
    this.fields,
    this.quotaUser,
    this.userIp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'key': key,
      'part': part,
      'forHandle': forHandle,
      'maxResults': maxResults,
      'channelId': channelId,
      'q': q,
      // 'type': type,
      // 'order': order,
      // 'pageToken': pageToken,
      // 'regionCode': regionCode,
      // 'videoCategoryId': videoCategoryId,
      // 'videoId': videoId,
      // 'chart': chart,
      // 'id': id,
      // 'mine': mine,
      // 'myRating': myRating,
      // 'onBehalfOfContentOwner': onBehalfOfContentOwner,
      // 'onBehalfOfContentOwnerChannel': onBehalfOfContentOwnerChannel,
      // 'categoryId': categoryId,
      // 'hl': hl,
      // 'location': location,
      // 'locationRadius': locationRadius,
      // 'maxHeight': maxHeight,
      // 'maxWidth': maxWidth,
      // 'publishedAfter': publishedAfter,
      // 'publishedBefore': publishedBefore,
      // 'relevanceLanguage': relevanceLanguage,
      // 'safeSearch': safeSearch,
      // 'topicId': topicId,
      // 'videoSyndicated': videoSyndicated,
      // 'videoType': videoType,
      // 'fields': fields,
      // 'quotaUser': quotaUser,
      // 'userIp': userIp,
    };
  }
}
