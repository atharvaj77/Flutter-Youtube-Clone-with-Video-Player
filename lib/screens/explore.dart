import 'package:flutter/material.dart';

import 'package:youtube_clone/main.dart';

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(child: ListView(children: <Widget>[
          trendingUpper(),
          SizedBox(
            height: 800,
            child: ListView.builder(itemBuilder: (BuildContext context, int){return TileElement();}),)
        ],),)
      ),
    );
  }
}

Widget trendingUpper(){
  return Container(child:
  Row(children: <Widget>[
    Text('Trending Videos'),
    Icon(Icons.arrow_drop_down)
  ],));
}