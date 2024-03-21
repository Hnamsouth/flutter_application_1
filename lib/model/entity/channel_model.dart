import 'package:flutter_application_1/model/entity/video_model.dart';

class Channel {
  final int id;
  final String name;
  final String description;
  final int subscribers;
  final String imageUrl;
  final List<Video> videos=[];
  final List<Channel>? subscriptions;

  Channel({
    required this.id,
    required this.name,
    required this.description,
    required this.subscribers,
    required this.imageUrl,
    this.subscriptions
  });
}