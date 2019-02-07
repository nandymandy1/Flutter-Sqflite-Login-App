import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home Page'),
        backgroundColor: Colors.green,
      ),
      body: new Center(
        child:
            new Text('This is Home Page', style: new TextStyle(fontSize: 20.0)),
      ),
    );
  }
}
