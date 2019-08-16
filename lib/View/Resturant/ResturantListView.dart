import 'package:flutter/material.dart';
import 'package:testproject/Theme/Color.dart';
import 'package:testproject/Theme/CustomTextStyle.dart';
import 'package:testproject/View/Resturant/ResturantDetail.dart';


String image = 'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';

class ResturantListView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutBuilder(
      builder: (context,constraint){

        double height = constraint.biggest.height;
        double width = constraint.biggest.width;
        return ListView.separated(
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResturantDetail(index: index,image: image,),
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
          child: OutlineButton(
            color: primaryColor,
            borderSide: BorderSide(color: primaryColor),
            onPressed: (){

            },
            highlightedBorderColor: primaryColor,
            highlightColor: primaryColor.withOpacity(0.2),
            child: Text("Ready in 25Min",style: resturantListButton()),
          ),
        )
      ],
    );
  }
}

class ResturantListItem extends StatelessWidget{

  double height;
  double width;
  int index;
  ResturantListItem({this.width,this.height,this.index});

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