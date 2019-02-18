import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Home/Home.dart';

class Welcome extends StatelessWidget {
  FirebaseUser user;

  Welcome({this.user});

  logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          InkResponse(
            onTap: () => logout(context),
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(Icons.power_settings_new),
            ),
          )
        ],
      ),
      body: Container(
        child: Center(
          child: Text("Welcome ${user.email}"),
        ),
      ),
    );
  }
}
