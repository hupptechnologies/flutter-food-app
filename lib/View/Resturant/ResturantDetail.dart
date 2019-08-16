import 'package:flutter/material.dart';

class ResturantDetail extends StatefulWidget{
  int index;
  String image;
  String title;


  ResturantDetail({this.index,this.image,this.title});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ResturantDetailState();
  }
}

class ResturantDetailState extends State<ResturantDetail> with SingleTickerProviderStateMixin{

  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3,vsync: this,initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          InkResponse(
            onTap: (){},
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Hero(
              tag: widget.index,
              child: Image.network(widget.image),
            )
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                TabBar(
                  controller: tabController,
                  tabs: <Widget>[
                    Tab(
                      child: Text("Food menu"),
                    ),
                    Tab(
                      child: Text("Place detail"),
                    ),
                    Tab(
                      child: Text("Place review"),
                    )
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: <Widget>[
                      Center(
                        child: Text("MENU"),
                      ),
                      Center(
                        child: Text("Details"),
                      ),
                      Center(
                        child: Text("Revuiew"),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}