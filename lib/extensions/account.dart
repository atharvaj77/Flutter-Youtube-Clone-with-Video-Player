import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:youtube_clone/screens/library.dart';

class Account extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: (){Navigator.pop(context);},
                child: Icon(Icons.cancel, color: Colors.grey,),
              ),
              SizedBox(width: 30),
              Text('Account', style: TextStyle(color: Colors.black),)
            ],
          ),
        ),
        body: Container(
          child: Column(children: <Widget>[
            Row(children: <Widget>[
              Image.asset('assets/icons/user.png', width: 40, height: 50),
              SizedBox(width:30),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children:<Widget>[
                  Row(children: <Widget>[
                    Text('Account name'),
                    Icon(Icons.arrow_drop_down),
                  ],),
                  Text('Accountemail@gmil.com')
                ]
              )
            ],),
            Text('Manage your Google Account', style: TextStyle(color: Colors.blue),),
            options('Your Channel', Icons.contacts),
            options('Youtube Studio', Icons.settings),
            options('Time Watched', Icons.graphic_eq),
            options('Get Youtube Premium', MdiIcons.youtube,Colors.grey),
            options('Paid Memberships', Icons.monetization_on),
            options('Switch Account', MdiIcons.accountSwitch),
            options('Turn on Incognito', MdiIcons.incognito),
            options('Your data in Youtube', Icons.account_circle),
            options('Settings', Icons.settings),
            options('Help and Feedback', Icons.help)
          ],)
        ),
      ),
    );
  }
  
}