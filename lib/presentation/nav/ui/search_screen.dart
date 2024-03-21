import 'package:flutter/material.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 40,
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: "Search",
              border:UnderlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(60))
              ) ,
              filled: true,
              fillColor: Color.fromARGB(26, 255, 255, 255),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.mic),
          ),
        ],
      ),
      body: ListView.builder(
      itemCount: 30,
      itemBuilder: (context, index) {
        return  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Expanded(
              flex: 1,
              child: Icon(Icons.timer_outlined),
            ),
            Expanded(
              flex: 3,
              child:Text("Item $index"),
            ),
            const Expanded(
              flex: 2,
              child:Image(image: AssetImage("assets/images/youtube-logo.png"),width: 60,),
            ),
            const Expanded(
              flex: 1,
              child: Icon(Icons.arrow_outward_rounded),
            ),
          ],
        );
      },
      ),
    );
    // return NestedScrollView(headerSliverBuilder: headerSliverBuilder, body: body)
  }

  
}