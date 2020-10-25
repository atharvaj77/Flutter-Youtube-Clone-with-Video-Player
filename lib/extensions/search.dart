import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              child: Icon(Icons.arrow_back, color: Colors.black),
              onTap: (){Navigator.pop(context);},
            ),
            new Flexible(child: Container(
              padding: EdgeInsets.only(left:12, right:12),
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  hintText: 'Search Youtube',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
                  ),
                  contentPadding: EdgeInsets.zero
                )
              ),
            )),
            Icon(Icons.mic, color: Colors.black,)
        ],),
        )
      ),
    );
  }
}