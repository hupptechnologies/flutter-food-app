import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testproject/Widgets/CustomDivider.dart';
import 'package:testproject/Widgets/CustomRatingBar.dart';

class PlaceReviewView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child:  Column(
        children: <Widget>[
          CustomDivider(
            color: Colors.grey[200],
          ),
           Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("25 reviews",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                  CustomRatingBar(size: 2.0,)
                ],
              ),
            ),
          ),
          CustomDivider(
            color: Colors.grey[200],
          ),
          Expanded(
            child: Container(
              child: PlaceReivewList(),
            ),
          )
        ],
      ),
    );
  }
}

class PlaceReivewList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
        itemBuilder: (context,index){
          return PlaceReviewListItem();
        },
        separatorBuilder: (context,index){
          return SizedBox(height: 10.0,);
        },
        itemCount: 10
    );
  }
}

class PlaceReviewListItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
               Container(

                child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                  child: Image.network("https://www.w3schools.com/howto/img_avatar.png"),
                ),
                margin: EdgeInsets.symmetric(vertical: 10.0),
                height: 50.0,
                width: 50.0,
              ),
              SizedBox(width: 5.0,),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("User name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                      Text("July 20th,2019",style: TextStyle(fontSize: 14.0),)
                    ],
                  ),
                )
              ),
              CustomRatingBar(size: 3,)
            ],
          ),
          Text("Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.")
        ],
      ),
    );
  }
}