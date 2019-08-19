import 'package:flutter/material.dart';
import 'package:testproject/Theme/Color.dart';

class CustomOutlineButton extends StatelessWidget{

  GestureTapCallback onPressed;
  String text;
  Color highlightColor;
  Color borderColor;
  TextStyle textStyle = TextStyle();

  CustomOutlineButton({this.onPressed,this.text,this.highlightColor,this.borderColor,this.textStyle});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return OutlineButton(
      onPressed: onPressed,
      child: Text(text,style: textStyle,),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
      textColor: primaryColor,
      highlightedBorderColor: primaryColor,
      borderSide: BorderSide(color: borderColor)
    );
  }
}