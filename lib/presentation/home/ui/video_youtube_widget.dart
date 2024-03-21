import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/entities_youtube/response/main_response.dart';
import 'package:flutter_application_1/provider/channel_provider.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

// ignore: must_be_immutable
class VideoPlayerWidget extends StatefulWidget {
  final MainResponse video;
  const VideoPlayerWidget({super.key, required this.video});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  double videoVolume = 0;
  bool isPlaying = false;
  bool isInit = false;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        enabled: !context.watch<ChannelProvider>().isLoading,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // YoutubePlayer(
            //   controller: YoutubePlayerController(
            //     initialVideoId: checkKind
            //         ? widget.video.id ?? ""
            //         : widget.video.contentDetails!.playlistItem?.resourceId
            //                 ?.videoId ??
            //             "",
            //     flags: const YoutubePlayerFlags(
            //       autoPlay: false,
            //       loop: true,
            //     ),
            //   ),
            //   showVideoProgressIndicator: true,
            //   progressIndicatorColor: Palette.youtubeRed,
            //   progressColors: const ProgressBarColors(
            //     playedColor: Palette.youtubeRed,
            //     handleColor: Palette.youtubeRed,
            //   ),
            // ),
            SizedBox(
                width: double.infinity,
                height: 220,
                child: Image.network(
                  widget.video.snippet?.thumbnails?.high?.url ?? "",
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 10,
            ),
            // VIDEO INFO
            Container(
              alignment: AlignmentDirectional.center,
              height: 70,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage('assets/images/avatar1.png'),
                        radius: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.video.snippet?.title}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Channel Name - ${widget.video.statistics?.viewCount} views - ${widget.video.snippet?.publishedAt}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.more_vert,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey.shade800,
              thickness: 1,
              height: 10,
            )
          ],
        ));
  }
}
