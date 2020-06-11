import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:youtube_clone/main.dart';

class VideoInfo {
  String channelName;
  String subscribercount;
  String channelIcon;
  String videoViews;
  int uploadedAgo;
  String videoName;

  VideoInfo({this.channelName,this.subscribercount,this.channelIcon,this.videoViews,this.uploadedAgo,this.videoName});
}




class VideoPlayerBody extends StatefulWidget {
  const VideoPlayerBody({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VideoPlayerBodyState();
      }
    }

class _VideoPlayerBodyState extends State<VideoPlayerBody> {
  final videoInfo = VideoInfo(
    channelName: 'Sample Name',
    channelIcon: 'assets/icons/channel.png',
    subscribercount: '1 M',
    videoViews: '10,365',
    uploadedAgo: 1,
    videoName: 'Sample Video Name'
  );
  bool _isLiked = true;
  int _likeCount = 123;
  bool _isDisliked = true;
  int _dislikeCount = 25;
  bool _isSubscribed = true;
    @override
    Widget build(BuildContext context) {
    return Container(
      child: Column(children:<Widget>[
        SizedBox(
                      height: 20,
                      width: double.infinity,
                      child:Row(children: <Widget>[Text(videoInfo.videoName),Icon(Icons.arrow_drop_down,),],mainAxisAlignment: MainAxisAlignment.spaceBetween,)),
                    SizedBox(
                      height: 30,
                      width: double.infinity,
                      child:Row(children: <Widget>[Text(videoInfo.videoViews,style: TextStyle(color:Colors.grey),),Text('.',style: TextStyle(color:Colors.grey),),Text('1 year ago',style: TextStyle(color:Colors.grey),)],)),
                    SizedBox(
                      height: 64,
                      width: double.infinity,
                      child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                      Column(children:<Widget>[IconButton(
                        icon: (_isLiked ? Icon(Icons.thumb_up,color: Colors.grey,) : Icon(Icons.thumb_up,color: Colors.blue,)),
                        onPressed:_toggleLike,
                      ),
                      Text('$_likeCount',style: TextStyle(color: _isLiked ? Colors.grey : Colors.blue,))
                      ]),
                      Column(children:<Widget>[
                        IconButton(
                        icon: (_isDisliked ? Icon(Icons.thumb_down,color: Colors.grey,) : Icon(Icons.thumb_down,color: Colors.blue,)),
                        onPressed:_toggleDislike,
                        ),
                        Text('$_dislikeCount',style: TextStyle(color: _isDisliked ? Colors.grey : Colors.blue),)
                        ]),
                      Column(children:<Widget>[
                        IconButton(
                          icon:Icon(MdiIcons.share,color: Colors.grey,),
                          onPressed: null,
                          ),
                          Text('Share',style: TextStyle(color: Colors.grey),)]),
                      Column(children:<Widget>[
                        IconButton(
                          onPressed: null,
                          icon:Icon(Icons.file_download,color: Colors.grey),),
                        Text('Download',style: TextStyle(color: Colors.grey),)]),
                      Column(children:<Widget>[
                        IconButton(
                          onPressed: null,
                          icon:Icon(MdiIcons.contentSave,color: Colors.grey,)),
                        Text('Save',style: TextStyle(color: Colors.grey),)]),
                    ],)),
                    Divider(color: Colors.grey,),
                    SizedBox(
                      height: 50,
                      child:Row(children: <Widget>[
                      Image.asset(videoInfo.channelIcon,height: 40,width: 40,),
                      Column(children:<Widget>[
                        Row(children:<Widget>[
                          Text(videoInfo.channelName),
                          SizedBox(width: 30,),
                          Text(videoInfo.subscribercount+'  '+'Subscribers',style:TextStyle(color: Colors.grey))
                        ],
                        ),
                        SizedBox(height:5),
                        Row(children:<Widget>[
                          GestureDetector(child:Container(child:_isSubscribed ? Text('SUBSCRIBE',style: TextStyle(color: Colors.red),):Text('SUBSCRIBED',style: TextStyle(color: Colors.grey))),onTap: _toggleSubscribe,),
                          SizedBox(width:30),
                          Text('JOIN',style: TextStyle(color: Colors.blue),)
                        ],
                        )
                      ])
                    ],)
                    ),
                    Divider(color:Colors.grey),
                    Row(children:<Widget>[
                      Row(children:<Widget>[Text('Comments'),Text('1K')]),
                      Spacer(),
                      Column(children: <Widget>[
                      Icon(Icons.expand_more),
                      Icon(Icons.expand_less)
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    )]),
                    Row(children: <Widget>[
                      Image.asset('assets/icons/user.png',height:20,width:20),
                      new Flexible(
                          child:Container(
                          padding: EdgeInsets.only(left :12,right: 12),
                            decoration: BoxDecoration(color:Colors.grey.withOpacity(0.1)),
                            child:
                          TextField(
                          decoration: InputDecoration(
                          fillColor: Colors.grey,
                          hintText: 'Add a public comment...',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                          contentPadding: EdgeInsets.zero
                          ),),),),
                    ],),
                    Divider(color:Colors.grey),
                    Row(children:<Widget>[
                      Text('Up Next'),
                      Spacer(),
                      Row(children: <Widget>[
                        Text('Autoplay'),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      )
                    ]),
                    SizedBox(
                      height: 240,
                      child:
                      ListView.builder(
                        itemCount: 20,
                        itemBuilder:(BuildContext context,int){return TileElement();}))
      ],
      ),
    );
    }
  void _toggleLike() {
  setState(() {
    if (_isLiked) {
      _likeCount += 1;
      _isLiked = false;
    } else {
      _likeCount -= 1;
      _isLiked = true;
    }
  });
}

void _toggleDislike() {
  setState(() {
    if (_isDisliked) {
      _dislikeCount += 1;
      _isDisliked = false;
    } else {
      _dislikeCount -= 1;
      _isDisliked = true;
  }});
}

void _toggleSubscribe(){
  setState(() {
    if(_isSubscribed){
      _isSubscribed = false;
    }
    else{
      _isSubscribed = true;
    }
  });
}
}

