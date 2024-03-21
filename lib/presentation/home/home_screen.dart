// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/data/data.dart';
// import 'package:flutter_application_1/model/entity/video_model.dart';
// import 'package:flutter_application_1/presentation/home/ui/shorts_widget.dart';
// import 'package:flutter_application_1/presentation/home/ui/video_widget.dart';

// // ignore: must_be_immutable
// class HomeScreen extends StatefulWidget {
//   final Topic topic;
//   const HomeScreen({super.key, required this.topic});

//   @override
//   State<HomeScreen> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomeScreen> {
//   List<Video> videos = [];

//   @override
//   void didUpdateWidget(covariant HomeScreen oldWidget) {
//     _initData();
//     print(videos.length);
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   void initState() {
//     super.initState();
//     _initData();
//   }

//   void _initData() {
//     setState(() {
//       videos = widget.topic.id != 0
//           ? videosData
//               .where((element) => element.topics.contains(widget.topic))
//               .toList()
//           : videosData;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               widget.topic.name,
//               style: const TextStyle(fontSize: 30),
//               textAlign: TextAlign.start,
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Flexible(
//             child: ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: videos.isEmpty ? videos.length : videos.length + 1,
//               itemBuilder: (context, index) {
//                 return index != 1
//                     ? VideoPlayerWidget(
//                         video: videos[index > 1 ? index - 1 : index],
//                       )
//                     : const ShortsViewWidget();
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
