import 'package:flutter/material.dart';
import 'package:hupptest/Theme/Color.dart';
import 'dart:ui' as ui;
import 'ResturantListMapView.dart';
import 'ResturantListView.dart';


class RestaurantList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RestaurantListState();
  }
}

class RestaurantListState extends State<RestaurantList> with TickerProviderStateMixin{

  int activeView = 0;
  EdgeInsets padding = EdgeInsets.symmetric(horizontal:10.0,vertical: 15.0);
  double fromBottom = 0;
  late Animation animation;
  late AnimationController animationController;
  late Animation<Offset> offset;
  late TabController tabController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this,length: 2,initialIndex: 0);
    animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 200));
    animation = Tween<double>(begin: 0.0,end: 250.0)
                .animate(CurvedAnimation(parent: animationController,curve: Curves.ease));



    offset = Tween<Offset>(begin: Offset(0.0,1.0), end: Offset(0.0, 0.0))
        .animate(animationController);

    animation.addListener((){
      setState(() {
      });
    });
    offset.addListener((){
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              TabBar(
                controller: tabController,
                indicatorColor: Colors.transparent,
                isScrollable: false,
                unselectedLabelColor: greyColor,
                labelColor: primaryColor,
                tabs: <Widget>[
                  Tab(
                    child: Text("Resturant List"),
                  ),
                  Tab(
                    child: Text("Resturant Map"),
                  )
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: <Widget>[
                    RestaurantListView(),
                    RestaurantMapView()
                  ],
                ),
              )

            ],
          ),
         getBlurWidget(),
         Positioned(
            bottom: animation.value,
            child: Align(
              alignment: Alignment.center,
              child: SafeArea(
                bottom: (animation.value == 0) ? true : false,
                minimum: EdgeInsets.only(bottom: 10.0),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    child: FittedBox(
                      child: FloatingActionButton(
                        onPressed: (){
                          if(fromBottom == 100){
                            animationController.reverse();
                            setState(() {
                              fromBottom = 0;
                            });
                          }else{
                            setState(() {
                              fromBottom = 100;
                            });
                            animationController.forward();
                          }
                        },
                        child: Icon(Icons.filter_list),
                      ),
                    )
                ),
              ),
            )
         ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: offset,
              child: Container(
                height: 250.0,
                color: Colors.white,
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text("Filters",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w600),),
                    ),
                      Container(
                      decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.5)))),
                      ),
                    Expanded(
                      child: Container(
                        child: Wrap(
                          children: <Widget>[
                            getFilterWidgetIcon(Icons.local_pizza),
                            getFilterWidgetIcon(Icons.local_pizza),
                            getFilterWidgetIcon(Icons.local_pizza),
                            getFilterWidgetIcon(Icons.local_pizza),
                            getFilterWidgetIcon(Icons.local_pizza),
                            getFilterWidgetIcon(Icons.local_pizza)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ),
          )
        ],
      )
    );
  }
  ///
  /// Return Filter section icon UI
  ///
  getFilterWidgetIcon(IconData icon){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),
      child: Icon(icon,size: 60.0,),
    );
  }
  ///
  /// Blur widget while open filter
  ///
  getBlurWidget(){
    return (animation.value > 0) ? GestureDetector(
      onTap: (){
        print("TAP OUT SIDE");
        animationController.reverse();
        setState(() {
          fromBottom = 0;
        });
      },
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: Container(
          color: Colors.transparent,
        ),
      ),
    ) : Container();
  }
}