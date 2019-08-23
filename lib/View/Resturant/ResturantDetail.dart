import 'package:flutter/material.dart';
import 'package:testproject/Theme/Color.dart';
import 'package:testproject/Theme/CustomTextStyle.dart';
import 'package:testproject/View/Resturant/MenuView.dart';
import 'package:testproject/View/Resturant/PlaceDetailsView.dart';
import 'package:testproject/View/Resturant/PlaceReviewView.dart';
import 'package:testproject/Widgets/CustomOutlineButton.dart';

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
            height: MediaQuery.of(context).size.height/3.5,
            padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
            child: Hero(
              tag: widget.index,
              child: Image.network(widget.image),
            )
          ),
          CustomOutlineButton(
              onPressed: (){

              },
              padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
              textStyle: resturantListButton().copyWith(fontSize: 16.0),
              highlightColor: primaryColor,
              borderColor: primaryColor,
              text: "Ready in 20Min",
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
        Container(
          child: TabBar(
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
          color: Colors.white,
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