import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hupptest/Theme/Color.dart';
import 'package:hupptest/View/Home/Home.dart';
import 'package:hupptest/View/Resturant/ResturantList.dart';

class Welcome extends StatelessWidget {
  final User? user;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Welcome({this.user});

  logout(BuildContext? context) async {
    try {
      await FirebaseAuth.instance.signOut();
      if(context != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Restaurant Nearby"),
        backgroundColor: primaryColor,
        actions: <Widget>[
          InkResponse(
            onTap: (){

            },
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      drawer: drawer(),
      body: RestaurantList(),
    );
  }

  Drawer drawer(){
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child:Text("Foodsy",style: TextStyle(color: primaryColor,fontSize: 30.0),),
            ),
            drawerMenu(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Barcelona, Spain",style: TextStyle(fontSize: titleText,color: secondryColor),),
                  SizedBox(height: 5.0,),
                  Text("Change",style: TextStyle(color: primaryColor,fontSize: normalText),),
                ],
              )
            ),
          ],
        ),
      )
    );
  }

  Widget drawerMenu(){
    return Column(
      children: <Widget>[
        drawerList(active: true,icon: Icons.home,name:"Home",id: "HOME"),
        drawerList(active: false,icon: Icons.bookmark_border,name:"My Orders",id: "MY_ORDER"),
        drawerList(active: false,icon: Icons.notifications_none,name:"Notifications",id: "NOTIFICATION"),
        drawerList(active: false,icon: Icons.settings,name:"Settings",id: "SETTING"),
        drawerList(active: false,icon: Icons.power_settings_new,name:"Log Out",id: "LOGOUT"),
      ],
    );
  }

  Widget drawerList({required String name,required IconData icon,required bool active,required String id}){
      return InkWell(
        onTap: (){
          if(id == "LOGOUT"){
            logout(scaffoldKey.currentContext);
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
          child: Row(
            children: <Widget>[
              Icon(icon,color: active ? primaryColor : secondryColor,size: titleText,),
              SizedBox(width: 10.0,),
              Text(name,style: TextStyle(color: active ? primaryColor : secondryColor,fontSize: titleText),)
            ],
          ),
        ),
      );
  }

}
