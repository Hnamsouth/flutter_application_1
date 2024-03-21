// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/model/entity/video_model.dart';
// import 'package:video_player/video_player.dart';

// // ignore: must_be_immutable
// class VideoPlayerWidget extends StatefulWidget {
//   final Video video;
//   VideoPlayerWidget({super.key, required this.video});

//   @override
//   State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
// }

// class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;
//   double videoVolume = 0;
//   bool isPlaying = false;
//   bool isInit = false;

//   @override
//   void initState() {
//     _initVideo();
//     super.initState();
//   }

//   @override
//   void didUpdateWidget(covariant VideoPlayerWidget oldWidget) {
//     if (oldWidget.video.id != widget.video.id) {
//       _initVideo();
//     }
//     super.didUpdateWidget(oldWidget);
//   }

//   void _initVideo() {
//     _controller = widget.video.id == 1
//         ? VideoPlayerController.asset('assets/videos/buon-hay-vui-0.mp4')
//         : VideoPlayerController.networkUrl(Uri.parse(widget.video.videoUrl));
//     _initializeVideoPlayerFuture = _controller.initialize().then((_) {
//       _controller.setLooping(true);
//       _controller.setCaptionOffset(Durations.long1);
//       _controller.setVolume(videoVolume);
//       videoVolume = 0;
//       isPlaying = false;
//       setState(() {
//         isInit = true;
//       });
//     });
//   }

//   void _onVideoTap() {
//     setState(() {
//       _controller.value.isPlaying ? _controller.pause() : _controller.play();
//       isPlaying = _controller.value.isPlaying;
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Stack(
//           alignment: Alignment.center,
//           children: [
//             // VideoPlayer(_controller),
//             isInit
//                 ? FutureBuilder(
//                     future: _initializeVideoPlayerFuture,
//                     builder: ((context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.done) {
//                         return AspectRatio(
//                           aspectRatio: _controller.value.aspectRatio,
//                           child: VideoPlayer(_controller),
//                         );
//                       } else {
//                         return const Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       }
//                     }))
//                 : SizedBox(
//                     width: double.infinity,
//                     child: widget.video.id != 1
//                         ? Image(
//                             image: NetworkImage(widget.video.thumbnailUrl),
//                             fit: BoxFit.cover,
//                           )
//                         : Image.asset(
//                             widget.video.thumbnailUrl,
//                             fit: BoxFit.cover,
//                           ),
//                   ),
//             // ACTION BUTTONS
//             FloatingActionButton(
//               backgroundColor: !isPlaying
//                   ? Colors.black.withOpacity(0.5)
//                   : const Color.fromARGB(0, 0, 0, 0),
//               onPressed: _onVideoTap,
//               child: _controller.value.isPlaying
//                   ? Container()
//                   : const Icon(Icons.play_arrow),
//             ),
//             Positioned(
//               top: -5,
//               right: -5,
//               child: FloatingActionButton(
//                 backgroundColor: Colors.transparent,
//                 onPressed: () {
//                   setState(() {
//                     videoVolume = videoVolume == 0.0 ? 1.0 : 0.0;
//                     _controller.setVolume(videoVolume);
//                   });
//                 },
//                 child: Icon(
//                     videoVolume == 0.0 ? Icons.volume_off : Icons.volume_up),
//               ),
//             ),
//             Positioned(
//               top: 50,
//               right: -5,
//               child: FloatingActionButton(
//                 backgroundColor: Colors.transparent,
//                 onPressed: () {},
//                 child: const Icon(Icons.subtitles_outlined),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         // VIDEO INFO
//         Container(
//           alignment: AlignmentDirectional.center,
//           height: 70,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Expanded(
//                 flex: 1,
//                 child: SizedBox(
//                   width: 40,
//                   height: 40,
//                   child: CircleAvatar(
//                     backgroundColor: Colors.white,
//                     backgroundImage: AssetImage('assets/images/avatar1.png'),
//                     radius: 30,
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 4,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       widget.video.title,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                           fontSize: 15, fontWeight: FontWeight.w500),
//                     ),
//                     Text(
//                       "${widget.video.channel.name} - ${widget.video.viewCount} views - ${widget.video.publishedAt}",
//                       style: const TextStyle(
//                           fontSize: 12, fontWeight: FontWeight.normal),
//                     ),
//                   ],
//                 ),
//               ),
//               const Expanded(
//                 flex: 1,
//                 child: Icon(
//                   Icons.more_vert,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Divider(
//           color: Colors.grey.shade800,
//           thickness: 1,
//           height: 10,
//         )
//       ],
//     );
//   }
// }
