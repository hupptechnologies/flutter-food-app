import 'package:flutter/material.dart';
import 'package:testproject/Theme/Color.dart';
import 'package:testproject/Theme/CustomTextStyle.dart';
import 'package:testproject/View/Resturant/MenuView.dart';
import 'package:testproject/View/Resturant/PlaceDetailsView.dart';
import 'package:testproject/View/Resturant/PlaceReviewView.dart';

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
            padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
            child: Hero(
              tag: widget.index,
              child: Image.network(widget.image),
            )
          ),
          OutlineButton(
              onPressed: (){

              },
              highlightedBorderColor: primaryColor,
              borderSide: BorderSide(color: primaryColor),
              color: primaryColor,
              child: Text("Redy in 25Min"),
            ),
          Expanded(
            child: DetailTabView(tabController: tabController,),
          )
        ],
      )
    );
  }
}

class DetailTabView extends StatelessWidget{
  TabController tabController;

  DetailTabView({this.tabController});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        TabBar(
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide.none
          ),
          labelStyle: TextStyle(color: primaryColor),
          unselectedLabelColor: greyColor,
          labelColor: primaryColor,
          controller: tabController,
          tabs: <Widget>[
            Tab(
              child: Text(toUpper("Food menu"),style: detailsTabTitle(),),
            ),
            Tab(
              child: Text(toUpper("Place detail"),style: detailsTabTitle(),),
            ),
            Tab(
              child: Text(toUpper("Place review"),style: detailsTabTitle(),),
            )
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: <Widget>[
              MenuView(),
              PlaceDetailView(),
              PlaceReviewView()
            ],
          ),
        )
      ],
    );
  }
}