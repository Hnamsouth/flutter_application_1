// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:video_player/video_player.dart';

// class ShortDetailWidget extends StatefulWidget {
//   const ShortDetailWidget({super.key});

//   @override
//   State<ShortDetailWidget> createState() => _ShortDetailState();
// }

// class _ShortDetailState extends State<ShortDetailWidget> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;
//   double videoVolume=1.0;
//   bool isPlaying=false;

//   @override
//   void initState() {
//     _initVideo();
//     super.initState();
//   }
//   void _initVideo(){
    
//     // ignore: deprecated_member_use
//       _controller = VideoPlayerController.asset('assets/videos/boxing-0.mp4',);
//       _initializeVideoPlayerFuture = _controller.initialize().then((_) {
//       _controller.play();
//       // _controller.setLooping(true);
//       // _controller.setVolume(videoVolume);
//       setState(() {});
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Shorts"),
//         actions: const [
//           Icon(Icons.more_vert_outlined),
//           SizedBox(width: 10,),
//           Icon(Icons.search_outlined),
//         ],
//       ),
//       body: SizedBox(
//         height: double.infinity,
//         width: double.infinity,
//         child: Stack(
//           clipBehavior :Clip.antiAlias,
//           alignment: Alignment.center,
//             children: [
//               // video
//               FutureBuilder(
//               future: _initializeVideoPlayerFuture, 
//               builder:((context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done) {
//                   return AspectRatio(
//                     aspectRatio: 0.51,
//                     child: VideoPlayer(_controller),
//                   );
//                 } else {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//               })
//             ),
//               FloatingActionButton(
//                 backgroundColor:!isPlaying?Colors.black.withOpacity(0.5):Colors.transparent,
//                 onPressed: () {
//                   setState(() {
//                     _controller.value.isPlaying ? _controller.pause() : _controller.play();
//                     isPlaying = _controller.value.isPlaying;
//                   });
//                 },
//                 child: _controller.value.isPlaying ? Container():const Icon(Icons.play_arrow) ,
//               ),
//               // 
//               Positioned(
//                 bottom: 0,
//                 left: 5,
//                 child: Container(
//                   height: 150,
//                   width: 300,
//                   padding: const EdgeInsets.all(10),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                       Row(
//                         children: [
//                           const  CircleAvatar(
//                             radius: 17,
//                             backgroundImage: AssetImage('assets/images/avatar1.png'),
//                           ),
//                           const SizedBox(width: 10,),
//                           const Text("@username",style: TextStyle(color: Colors.white),),
//                           const SizedBox(width: 10,),
//                           TextButton(
//                             onPressed: ()=>{},
//                             style: TextButton.styleFrom(
//                               padding: const EdgeInsets.symmetric( horizontal: 12,vertical: -2),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30)
//                               ),
//                               backgroundColor: Colors.white,
//                               foregroundColor: Colors.black
//                             ),
//                             child: const Text("Subcribe",style: TextStyle(fontSize: 12),),
//                           )
//                         ],
//                       ),
//                       const SizedBox(height: 7,),
//                       const Text("Short title device stall time corrected using current time 331922831287232",style: TextStyle(color: Colors.white,fontSize: 14),),
//                       const SizedBox(height: 7,),
//                       const Row(
//                         children: [
//                           Icon(Icons.library_music_outlined,color: Colors.white,),
//                           SizedBox(width: 10,),
//                           Text("Song name",style: TextStyle(color: Colors.white,fontSize: 14),),
//                         ],
//                       )
                    
//                     ],
//                   ),
//                 ),
//               ),
//               // 
//               Positioned(
//                 right: -10,
//                 bottom: 0,
//                 child: SizedBox(
//                   height: 450,
//                   width: 90,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       _buildAction(Icons.thumb_up,"Like"),
//                       const SizedBox(height: 10,),
//                       _buildAction(Icons.thumb_down,"Dislike"),
//                       const SizedBox(height: 10,),
//                       _buildAction(Icons.message,"99"),
//                       const SizedBox(height: 10,),
//                       _buildAction(Icons.share,"Share"),
//                       const SizedBox(height: 10,),
//                       _buildAction(Icons.recycling,"Remix"),
//                       const SizedBox(height: 10,),
//                       Container(
//                         width: 40,
//                         height: 40,
//                         clipBehavior: Clip.antiAlias,
//                         decoration:const BoxDecoration(
//                           // shape: BoxShape.circle,
//                           borderRadius: BorderRadius.all(Radius.circular(10)),
//                         ),
//                         child:const Image(
//                           image: AssetImage('assets/images/avatar1.png'),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       const SizedBox(height: 10,),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//       )
//     );
//   }

//   Widget _buildAction(IconData icon,String text){
//     return Column(
//       children: [
//         Icon(icon,size: 30, color: Colors.grey.shade200,),
//         const SizedBox(height: 10,),
//         Text(text,style:const TextStyle(color: Colors.white,fontSize: 12),)
//       ],
//     );
//   }

// }

