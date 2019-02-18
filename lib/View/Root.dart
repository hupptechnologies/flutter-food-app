import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Widgets/Loader.dart';
import 'Home/Home.dart';
import 'Welcome/Welcome.dart';

class Root extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RootState();
  }
}

class RootState extends State<Root> {
  Widget launchWidget = LoaderWidget();

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  checkUser() async {
    try {
      FirebaseUser user = await FirebaseAuth.instance.currentUser();
      if (user != null) {
        setState(() {
          launchWidget = Welcome(
            user: user,
          );
        });
      } else {
        setState(() {
          launchWidget = Home();
        });
      }
    } catch (e) {
      print("ERROR IN LAUNCH ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: launchWidget);
    ;
  }
}
