
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_application_1/presentation/home/ui/short_detail_widget.dart';


// class ShortsViewWidget extends StatefulWidget {
//   const ShortsViewWidget({super.key});

//   @override
//   State<ShortsViewWidget> createState() =>  ShortsViewWidgetState();
// }

// class  ShortsViewWidgetState extends State<ShortsViewWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return  SizedBox(
//       height: 400,
//       width: double.infinity,
//       child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         // Title
//         Container(
//           padding:const EdgeInsets.fromLTRB(15,10,0,0),
//           margin: const EdgeInsets.only(bottom: 10),
//           child:const Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Icon(Icons.shop_two_outlined,size: 30,),
//               SizedBox(width: 10,),
//               Text("Shorts", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
//             ],
//           ),
//         ),
//         // Videos
//         Flexible(
//             child:ListView.builder(
//             // padding:const EdgeInsets.only(right: 15),
//             shrinkWrap: true,
//             scrollDirection: Axis.horizontal,
//             itemCount: 3,
//             itemBuilder: (context,index) =>  buildVideoItem(context,index),
//             ),
//           ),
        
//       ],
//     ),
//     );
//   }


//   Stack buildVideoItem(BuildContext context, int index) {
//     return Stack(
//           alignment: Alignment.center,
//           fit: StackFit.passthrough,
//           children: [
//             // short img
//             InkWell(
//               onTap: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ShortDetailWidget()));
//               },
//               child: Container(
//                 margin: EdgeInsets.fromLTRB(13,0,3,10),
//                 child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: Image.network(
//                   // image: AssetImage('assets/videos/shorts/img/boxing.jpg'),
//                   fit: BoxFit.cover,
//                   "https://i.ytimg.com/vi/ZNc5pBhi_24/oardefault.jpg?sqp=-oaymwEdCJUDENAFSFWQAgHyq4qpAwwIARUAAIhCcAHAAQY=&rs=AOn4CLCwBOEc5byARwFhfKIf_E8RcZFvtg",
//                   width: 170,
//                   height: 300,
//                 ),
//               ),
//               )
//             ),
//             // shost title
//             const Positioned(
//               bottom: 20,
//               left: 20,
//               child: Text( "Short title", style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.white),),
//             ),
//             const Positioned(
//               top: 10,
//               right: 0,
//               child: Icon(Icons.more_vert),
//             )
//           ],
//       );
//   }
// }