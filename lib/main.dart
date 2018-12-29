import 'package:flutter/material.dart';
import 'Home/Home.dart';
import 'Signup/Signup.dart';
import 'Login/Login.dart';

void main(){
  runApp(MainPage());
}

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Foody",
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}


