import 'package:flutter/material.dart';

class ResturantDetail extends StatefulWidget{
  int index;
  String image;

  ResturantDetail({this.index,this.image});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ResturantDetailState();
  }
}

class ResturantDetailState extends State<ResturantDetail>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Hero(
          tag: widget.index,
          child: Image.network(widget.image),
        )
      )
    );
  }
}