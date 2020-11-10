import 'package:flutter/material.dart';

import 'package:youtube_clone/screens/home.dart';
import 'package:youtube_clone/screens/explore.dart';
import 'package:youtube_clone/screens/inbox.dart';
import 'package:youtube_clone/screens/library.dart';
import 'package:youtube_clone/screens/subscriptions.dart';
import 'package:youtube_clone/player/video_player.dart';
import 'package:youtube_clone/extensions/account.dart';
import 'package:youtube_clone/extensions/search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Base());
  }
}

class Base extends StatefulWidget {
  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _currentIndex = 0;
  final List<Widget> children = [
    Home(),
    Explore(),
    Subscriptions(),
    Inbox(),
    LibraryPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube',
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(
                    'assets/icons/youtube.png',
                    width: 40,
                    height: 30,
                  ),
                  Text(
                    'Youtube',
                    style:
                        TextStyle(color: Colors.black, fontFamily: 'BebasNeue'),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              Spacer(),
              Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        child: Icon(
                          Icons.videocam,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new Search()));
                          },
                          child: Icon(Icons.search, color: Colors.black)),
                      SizedBox(width: 10),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new Account()));
                          },
                          child: Image.asset(
                            'assets/icons/user.png',
                            width: 40,
                            height: 30,
                          ))
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  )
                ],
              )
            ],
          ),
          backgroundColor: Colors.white,
        ),
        body: children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore), label: 'Explore'),
            BottomNavigationBarItem(
                icon: Icon(Icons.subscriptions), label: 'Subscriptions'),
            BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Inbox'),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_library), label: 'Library'),
          ],
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class Data {
  String imgLoc;
  String title;
  String channelLogo;
  String channelName;
  String videoViews;
  String uploadedago;
  Data(
      {this.channelLogo,
      this.channelName,
      this.imgLoc,
      this.title,
      this.uploadedago,
      this.videoViews});
}

class TileElement extends StatelessWidget {
  final data = Data(
      title: 'Sample Title',
      imgLoc: 'assets/images/SampleThumbnail.png',
      channelLogo: 'assets/icons/channel.png',
      channelName: 'Sample Name',
      videoViews: '10k Views',
      uploadedago: '1 month ago');
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new VideoPlayerScreen()));
      },
      child: Container(
          padding: EdgeInsets.only(bottom: 50, top: 0),
          child: Column(children: <Widget>[
            Image.asset(data.imgLoc),
            Row(children: <Widget>[
              Image.asset(data.channelLogo, width: 40, height: 30),
              SizedBox(width: 50),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data.title,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 20),
                    Row(children: <Widget>[
                      Text(
                        data.channelName,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text('.'),
                      Text(
                        data.videoViews,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text('.'),
                      Text(
                        data.uploadedago,
                        style: TextStyle(color: Colors.grey),
                      )
                    ], mainAxisAlignment: MainAxisAlignment.spaceEvenly)
                  ]),
              Spacer(),
              Icon(Icons.more_vert)
            ])
          ])),
    );
  }
}
