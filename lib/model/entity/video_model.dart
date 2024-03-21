import 'package:flutter_application_1/model/entity/channel_model.dart';

class Video {
  final int id;
  final String title;
  final String description;
  final String thumbnailUrl;
  final String videoUrl;
  final String channelTitle;
  final int viewCount;
  final int likeCount;
  final int dislikeCount;
  final int commentCount;
  final String publishedAt;
  final List<Topic> topics;
  final Channel channel;

  Video({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.videoUrl,
    required this.channelTitle,
    required this.viewCount,
    required this.likeCount,
    required this.dislikeCount,
    required this.commentCount,
    required this.publishedAt,
    required this.topics,
    required this.channel,
  });
}

class Topic {
  final int id;
  final String name;

  Topic({
    required this.id,
    required this.name,
  });
}