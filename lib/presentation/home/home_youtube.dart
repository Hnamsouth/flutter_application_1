import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/entities_youtube/response/main_response.dart';
import 'package:flutter_application_1/presentation/home/ui/video_youtube_widget.dart';
import 'package:flutter_application_1/provider/channel_provider.dart';
import 'package:provider/provider.dart';

class HomeYoutube extends StatefulWidget {
  const HomeYoutube({super.key});
  @override
  State<HomeYoutube> createState() => _HomeYoutubeState();
}

class _HomeYoutubeState extends State<HomeYoutube> {
  bool isPlay = false;
  bool isLoadingVertical = false;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    _controller.addListener(() {
      if (kDebugMode) {
        print('Notified through the scroll controller.');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // void _setVideo(){
  //   setState(() {
  //     videos = context.watch<ChannelProvider>().getVideos;
  //   });
  // }

  Future<void> _getMoreVideo() async {
    if (kDebugMode) {
      print("Load more video");
    }
    context.read<ChannelProvider>().getMoreVideo();
    // await Future.delayed(const Duration(seconds: 2), () {
    //
    // });
  }

  @override
  Widget build(BuildContext context) {
    List<MainResponse> videos = context.watch<ChannelProvider>().getVideos;
    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: videos.length + 1,
        itemBuilder: (context, index) {
          return index != videos.length
              ? SizedBox(
                  width: double.infinity,
                  child: VideoPlayerWidget(video: videos[index]),
                )
              : Center(
                  // child: CircularProgressIndicator(),
                  child: FloatingActionButton(
                  onPressed: () => _getMoreVideo(),
                  child: const Icon(Icons.add),
                ));
        },
      ),
    );
  }
}
