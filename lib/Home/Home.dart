import 'package:flutter/material.dart';
import '../Widgets/CustomButton.dart';
import '../Login/Login.dart';
import '../Signup/Signup.dart';
import 'dart:async';
import '../Bloc/Bloc.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(

        children: <Widget>[
          Expanded(
            child: Image.asset("pictures/images/foody.jpg",fit: BoxFit.cover,),
          ),
          SizedBox(height: 20.0,),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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

//class Home extends StatefulWidget{
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return HomeState();
//  }
//}
//
//class HomeState extends State<Home>{
//
////  final counterStream = StreamController<int>();
////  int counter = 0;
//
//  final _bloc = Bloc();
//
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      body: Center(
//        child: Container(
//          child: StreamBuilder(
//            initialData: 0,
//            builder: (BuildContext context, AsyncSnapshot<int> snapshot){
//              return Text(snapshot.data.toString());
//            },
//            stream: _bloc.outCounter,
//          ),
//        ),
//      ),
//      floatingActionButton: Row(
//        children: <Widget>[
//          FloatingActionButton(
//            onPressed: (){
//              print("Called press");
//
//              _bloc.incrementCounter.add('add');
//            },
//            child: Icon(Icons.add),
//          ),
//          FloatingActionButton(
//            onPressed: (){
//              print("Called press");
//
//              _bloc.decrementCounter.add(null);
//            },
//            child: Icon(Icons.mic),
//          ),
//        ],
//      )
//    );
//  }
//}