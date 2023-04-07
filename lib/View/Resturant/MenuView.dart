import 'package:flutter/material.dart';
import 'package:hupptest/Theme/Color.dart';

class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        key: new PageStorageKey('resturantMenuItem'),
        itemBuilder: (context, index) {
          return Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 70.0,
                      width: 80.0,
                      padding: EdgeInsets.only(left: 10.0),
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvxAJcSQRs2u2vkyS5GoKLm66Op0CqWt0rjg&usqp=CAU",fit: BoxFit.fitHeight,),
                    ),
                    Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 10.0),
                          height: 90.0,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      "Wayback Burger",
                                      style: TextStyle(
                                          fontSize: 16.0, fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Text(
                                    "\$12",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: primaryColor,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                              Text(
                                "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs",
                                maxLines: 2,
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                        )
                    )
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 5.0,
          );
        },
        itemCount: 10);
  }
}
