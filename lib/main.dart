import 'package:flutter/material.dart';
import 'View/Home/Home.dart';
import 'View/Signup/Signup.dart';
import 'View/Login/Login.dart';
import 'View/Root.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Foody",
      home: Root(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{'/root': (context) => Root()},
    );
  }
}
