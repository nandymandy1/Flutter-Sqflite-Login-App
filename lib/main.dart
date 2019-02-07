import 'package:flutter/material.dart';
import './pages/login/login_page.dart';
import './pages/home_page.dart';

void main() => runApp(new MyApp());

final routes = {
  '/login': (BuildContext context) => new LoginPage(),
  '/home': (BuildContext context) => new HomePage(),
  '/': (BuildContext context) => new LoginPage(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'SQFlite App',
        theme: new ThemeData(primarySwatch: Colors.blue),
        routes: routes);
  }
}
