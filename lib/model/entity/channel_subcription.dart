

import 'package:flutter_application_1/model/entity/channel_model.dart';

class ChannelSubcription{
  final int id;
  final Channel channel;
  final Channel subscribed;
  final int status;

  ChannelSubcription({
    required this.id,
    required this.channel,
    required this.subscribed,
    required this.status
  });
}