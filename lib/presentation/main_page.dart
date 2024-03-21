// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/presentation/home/home_screen.dart';

// import 'nav/ui/search_screen.dart';

//   List<String> bottomAppBarItems = [
//     "All",
//     "Gaming",
//     "Live",
//     "Music",
//     "News",
//     "Movies",
//     "Fashion",
//     "Learning",
//   ];

// class MainPage extends StatefulWidget {
//   final ThemeMode themeMode;
//   final  Function(bool) handleBrightnessChanged;
//   const MainPage({super.key,required this.handleBrightnessChanged,required this.themeMode}) ;

//   @override
//   State<MainPage> createState() => _MainPageWidget();
// }

// class _MainPageWidget extends State<MainPage>{
//   int _selectedIndex = 0;
//   int _appBarIndex = 0;
  
//   List<Widget> _screens = [];

//   _changeScreen (int index){
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   void initState() {
//     _screens = [
//         HomeScreen(title:bottomAppBarItems[_appBarIndex]),
//         const Text("Shorts"),
//         const Text("Add Video"),
//         const Text("Subscriptions"),
//         const Text("Profile"),
//       ];
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // body: _screens[_selectedIndex],
//       body:_nestedScrollView ,
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         type: BottomNavigationBarType.fixed,
//         onTap: (index)=> _changeScreen(index),
//         unselectedLabelStyle:const TextStyle(fontSize:12 ),
//         items:  _bottomNavigationBarItems,
//       )
//     );
//   }

//   NestedScrollView get _nestedScrollView => NestedScrollView(
//     headerSliverBuilder: (context, innerBoxIsScrolled) => [
//       SliverOverlapAbsorber(
//         handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
//         sliver: _appBar(innerBoxIsScrolled),
//       ),
//     ],
//     body: _screens[_selectedIndex],
//   );

//   List<BottomNavigationBarItem> get _bottomNavigationBarItems => [
//     // home
//     const BottomNavigationBarItem(
//       icon: Icon(Icons.home_outlined),
//       activeIcon: Icon(Icons.home),
//       label: "Home",
//     ),
//     // shorts
//     const BottomNavigationBarItem(
//       icon: Icon(Icons.video_library_outlined),
//       activeIcon: Icon(Icons.video_library),
//       label: "Shorts"
//     ),
//     const BottomNavigationBarItem(
//       icon:Icon(Icons.add_circle_outline,size:30),
//       activeIcon:Icon(Icons.add_circle,size:30) ,
//       label: ""
//     ),
//     // Subscriptions
//     const BottomNavigationBarItem(
//       icon: Icon(Icons.subscriptions_outlined),
//       activeIcon: Icon(Icons.subscriptions),
//       label: "Subscriptions"
//     ),
//     const BottomNavigationBarItem(
//       icon: Icon(Icons.account_circle_outlined),
//       activeIcon: Icon(Icons.account_circle),
//       label:"Profile",
//     ),
//   ];

//   SliverAppBar _appBar(bool innerBoxIsScrolled) => SliverAppBar(
//     floating: true,
//     snap: true,
//     expandedHeight: 100,
//     forceElevated: innerBoxIsScrolled,
//     actions: <Widget>[
//         Container(
//           padding:const EdgeInsets.symmetric(vertical: 10),
//           width: 60,
//           child: TextButton(
//             onPressed: () =>widget.handleBrightnessChanged(!(widget.themeMode == ThemeMode.light)),
//             child: const Icon(Icons.brightness_6_outlined)
//           ),
//         ),
//         Container(
//           width: 40,
//           margin:const EdgeInsets.symmetric(horizontal: 7),
//           child: TextButton(
//             onPressed: () =>{},
//             child: const Icon(Icons.notifications_none_outlined)
//           ),
//         ),
//         Container(
//           margin:const EdgeInsets.symmetric(horizontal: 7),
//           width: 40,
//           child: TextButton(
//             onPressed: () =>{
//               Navigator.push(context, 
//               MaterialPageRoute(builder: (context)=>const SearchScreen()))
//             },
//             child: const Icon(Icons.search_outlined)
//           ),
//         ),
//       ],
//     title: const Image(image:AssetImage('assets/images/youtube-logo.png'), width: 100,),
//     bottom: PreferredSize(
//         preferredSize: const Size.fromHeight(50),
//         child: Container(
//           height: 50,
//           // width: double.infinity,
//           padding:const EdgeInsets.symmetric(horizontal: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//                 Container(
//                   padding:const EdgeInsets.fromLTRB(10,5,3,5),
//                   child: ElevatedButton(
//                   onPressed: ()=>{},
//                   style: TextButton.styleFrom(
//                     padding:const EdgeInsets.all(7),
//                     backgroundColor:const Color.fromARGB(169, 55, 55, 55),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(3),
//                     ),
//                   ),
//                   child: const Icon(Icons.play_circle_outline),
//                 ),
//                 ),
//                 const SizedBox(width: 10,),
//                 Flexible(
//                   child:ListView.builder(
//                   padding:const EdgeInsets.all(7),
//                   shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   itemCount: bottomAppBarItems.length,
//                   itemBuilder: (context,index) => Container(
//                     margin:const EdgeInsets.only(right: 10.0),
//                     child: TextButton(
//                       onPressed: ()=>{
//                         setState((){
//                           _appBarIndex = index;
//                           _screens[0] = HomeScreen(title:bottomAppBarItems[index]);
//                         })
//                       },
//                       style: TextButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12)
//                         ),
//                         backgroundColor: index == _appBarIndex ? Colors.white :const Color.fromARGB(169, 55, 55, 55),
//                         foregroundColor: index == _appBarIndex ? Color.fromARGB(169, 55, 55, 55) : Colors.white,
//                       ),
//                       child: Text(bottomAppBarItems[index]),
//                     ) ,
//                   )
//                 )
//                 )
//             ],
//           ),
//         ),
//       )
//   );


// }