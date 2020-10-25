import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:youtube_clone/main.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          padding: EdgeInsets.only(top:0),
          itemBuilder: (BuildContext context, int){return TileElement();})
      )
    );
  }
}