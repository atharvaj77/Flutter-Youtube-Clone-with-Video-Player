import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:swipedetector/swipedetector.dart';

import 'package:youtube_clone/player/video_player_body.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  @override
  void initState(){
    _controller = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(padding: EdgeInsets.only(top:0),
      children: <Widget>[
        SwipeDetector(
          onSwipeDown: (){Navigator.pop(context);},
          child: Stack(children: <Widget>[
          FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context,snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                  );
              }
              else{
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Center(
            child: ButtonTheme(
              height: 100,
              minWidth: 200,
              child: RaisedButton(
                padding: EdgeInsets.all(50),
                color: Colors.transparent,
                textColor: Colors.white,
                onPressed:(){
                  setState(() {
                    if(_controller.value.isPlaying){
                      _controller.pause();
                    }
                    else{
                      _controller.play();
                    }
                  });
                },
                child: Icon(
                  _controller.value.isPlaying?Icons.pause:Icons.play_arrow,
                  size: 120,
                ),
              ),
            )
          )
        ],)),
        VideoPlayerBody(),
      ],
      ),
    );
  }
}