import 'package:flutter/material.dart';

class Inbox extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Column(
          children:<Widget>[
            Icon(Icons.notifications,size:150, color: Colors.grey),
            Text('Your notifications live here', style: TextStyle(fontWeight: FontWeight.w800),),
            Text('Subscribe to your favourite channels to'),
            Text('receive notifications about their latest'),
            Text('videos')
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),)
      ),
    );
  }
  
}