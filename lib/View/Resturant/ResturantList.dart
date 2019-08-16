import 'package:flutter/material.dart';
import 'package:testproject/Theme/Color.dart';
import 'package:testproject/Theme/CustomTextStyle.dart';
import 'package:testproject/View/Resturant/ResturantListMapView.dart';

import 'ResturantListView.dart';


class ResturantList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ResturantListState();
  }
}

class ResturantListState extends State<ResturantList>{


  int activeView = 0;
  EdgeInsets padding = EdgeInsets.symmetric(horizontal:10.0,vertical: 15.0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        if(activeView == 0){
                          return;
                        }
                        setState(() {
                          activeView = 0;
                        });
                      },
                      child: Padding(
                        padding: padding,
                        child: Text("Resturant List".toUpperCase(),style: resturantListSwitchText(activeView == 0 ? true : false),),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        if(activeView == 1){
                          return;
                        }
                        setState(() {
                          activeView = 1;
                        });
                      },
                      child: Padding(
                          padding: padding,
                          child: Text("Resturant Map".toUpperCase(),style: resturantListSwitchText(activeView == 1 ? true : false),)
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    child: activeView == 0 ? ResturantListView() : ResturantMapView()
                ),
              )
            ],
          ),
          Positioned(
            bottom: 10,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40.0,
                  child: FittedBox(
                    child: FloatingActionButton(

                      onPressed: (){

                      },
                      child: Icon(Icons.filter_list),
                    ),
                  )
              ),
            )
          )
        ],
      )
    );
  }
}