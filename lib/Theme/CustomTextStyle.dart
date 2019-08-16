import 'package:flutter/material.dart';
import 'package:testproject/Theme/Color.dart';


String toUpper(String txt) => txt.toUpperCase();

TextStyle resturantListSwitchText(bool active){
  return TextStyle(
    color: active ? primaryColor : greyColor,
    fontSize: normalText-2
  );
}


TextStyle resturantListButton(){
  return TextStyle(
      color: primaryColor,
      fontSize: normalText-4
  );
}

TextStyle resturantListTitleText(){
  return TextStyle(
      color: Colors.black,
      fontSize: normalText-2,
      fontWeight: FontWeight.bold
  );
}


TextStyle resturantListSubTitleText(){
  return TextStyle(
      color: greyColor,
      fontSize: normalText-4
  );
}


TextStyle detailsTabTitle(){
  return TextStyle(
    fontWeight: FontWeight.w500
  );
}
