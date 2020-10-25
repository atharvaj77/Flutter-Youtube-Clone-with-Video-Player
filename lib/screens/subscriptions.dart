import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:youtube_clone/main.dart';

class Subscriptions extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(children: <Widget>[
          SizedBox(child: storiesTile(), height: 100,),
          Row(children: <Widget>[
            Text('Videos and Posts'),
            Icon(Icons.arrow_drop_down)
          ],),
          Expanded(child: posts())
        ],)
      ),
    );
  }
  
}

Widget storiesTile(){
  return Container(
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int){
     return Column(children:<Widget>[
       Image.asset('assets/icons/channel.png', width: 100, height: 80,),
       Text('Channel Name') 
     ]);
    }),
  );
}

Widget posts(){
  return Container(
    child: ListView.builder(itemBuilder: (BuildContext context, int){
      return TileElement();
    },
  ));
}