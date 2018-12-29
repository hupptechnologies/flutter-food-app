import 'package:flutter/material.dart';
import '../Widgets/CustomButton.dart';
import '../Login/Login.dart';
import '../Signup/Signup.dart';


class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Image.network("https://media3.s-nbcnews.com/j/streams/2014/October/141002/2D274906915359-today-plates-14101-tease.fit-760w.jpg",fit: BoxFit.cover,),
          ),
          SizedBox(height: 20.0,),
          Container(
            child: Column(
              children: <Widget>[
                Text(("Foodsy").toUpperCase(),style: TextStyle(fontSize: 30.0),),
                SizedBox(height: 15.0,),
                FlatButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
                    },
                    child: CustomButton(text: "Sign Up",color: Colors.green,width: 250.0,)
                ),
                SizedBox(height: 5.0,),
                FlatButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                    },
                    child: CustomButton(text: "Log In",color: Colors.black,width: 250.0,)
                ),
                SizedBox(height: 50.0,),
              ],
            ),
          )
        ],
      ),
    );
  }
}