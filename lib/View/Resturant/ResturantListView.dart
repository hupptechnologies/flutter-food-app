import 'package:flutter/material.dart';
import 'package:hupptest/Theme/Color.dart';
import 'package:hupptest/Theme/CustomTextStyle.dart';
import 'package:hupptest/Widgets/CustomOutlineButton.dart';

import 'ResturantDetail.dart';


String image = 'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';

class RestaurantListView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraint){

        double height = constraint.biggest.height;
        double width = constraint.biggest.width;
        return ListView.separated(
          key: PageStorageKey("list_data"),
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RestaurantDetail(index: index,image: image,title: "Burger",),
                    ),
                );
              },
              child: ResturantListItem(width: width,height: height,index: index,),
            );
          },
          separatorBuilder: (context,index){
            return Container();
          },
          itemCount: 10,
        );
      },
    );
  }
}

class TextSection extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Burger cafe",style: resturantListTitleText(),),
                Text("Hamburger",style: resturantListSubTitleText())
              ],
            ),
          ),
        ),
        Container(
          child: CustomOutlineButton(
          onPressed: (){

          },
          textStyle: resturantListButton(),
          highlightColor: primaryColor,
          borderColor: primaryColor,
          text: "Ready in 20Min",
          ),
        ),
      ],
    );
  }
}

class ResturantListItem extends StatelessWidget{

  final double height;
  final double width;
  final int index;
  ResturantListItem({required this.width,required this.height,required this.index});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      height: height/3,
      child: Column(
        children: <Widget>[
          Expanded(
              child: Hero(
                tag: index,
                child: Container(
                  width: width-20,
                  child: Image.network(image,fit: BoxFit.fitWidth,),
                ),
              )
          ),
          TextSection()
        ],
      ),
    );
  }
}