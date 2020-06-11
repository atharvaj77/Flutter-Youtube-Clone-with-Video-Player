import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(child: ListView(children: <Widget>[
          Text('Recent'),
          SizedBox(height:280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int){return Cards();}),
          ),
          Divider(color: Colors.grey),
          options('History', Icons.history),
          options('Downloads', Icons.file_download),
          options('Your Videos', Icons.video_library),
          options('Purchases', Icons.label),
          options('Watch Later', Icons.watch_later),
          Divider(color: Colors.grey),
          Row(children:<Widget>[
            Text('Playlists'),
            Row(children:<Widget>[
              Text('Recently Added'),
              Icon(Icons.arrow_drop_down)
            ])
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
          options('New Playlist', Icons.add, Colors.blue, Colors.blue),
          options('Liked videos', Icons.thumb_up)
        ],),)
      ),
    );
  }
}

class Cards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(top:0,bottom:0,left:10,right:10),
        height: 360,
        width: 240,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset('assets/images/SampleThumbnail.png',width: 240, height: 200,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget>[
                Column(children:<Widget>[
                 Text('Sample Title'),
                Text('Channel Name', style: TextStyle(color: Colors.grey)) 
                ]),
                Icon(Icons.more_vert)
            ]),
        ],)
      ),
    );
  }
}

Widget options(optionName, iconName,[iconColor = Colors.grey, textColor = Colors.black ]){
  return SizedBox(
    height: 50,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:<Widget>[
        Icon(iconName, color: iconColor,),
        SizedBox(width: 20),
        Text(optionName, style: TextStyle(color: textColor))
    ]),
  );
}