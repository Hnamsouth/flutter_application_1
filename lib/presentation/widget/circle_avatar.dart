import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/palette.dart';
import 'package:flutter_application_1/model/entity/channel_subcription.dart';
import 'package:flutter_application_1/presentation/nav/screen_type.dart';

class CircleAvatarChannel extends StatelessWidget {
  final ChannelSubcription channelSubcription;
  const CircleAvatarChannel({super.key, required this.channelSubcription});

  @override
  Widget build(BuildContext context) {
    ChannelStatus channelStatus =
        ChannelStatus.values[channelSubcription.status];
    Widget getStatus() {
      switch (channelStatus) {
        case ChannelStatus.NEWVIDEOWATCHED:
          return Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              color: Palette.online,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
          );
        case ChannelStatus.STREAMING:
          return Container(
            height: 20,
            width: 25,
            decoration: BoxDecoration(
              color: Palette.youtubeRed,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: const Icon(
              Icons.online_prediction,
              color: Colors.white,
              size: 17,
            ),
          );
        default:
          return Container();
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 33,
          backgroundImage: NetworkImage(
              Uri.parse(channelSubcription.subscribed.imageUrl).toString()),
          child: Align(
            alignment: Alignment.bottomRight,
            child: getStatus(),
          ),
        ),
        Text(channelSubcription.subscribed.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center),
      ],
    );
  }
}
