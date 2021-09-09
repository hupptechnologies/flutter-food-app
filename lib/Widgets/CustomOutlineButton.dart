import 'package:flutter/material.dart';
import 'package:hupptest/Theme/Color.dart';

class CustomOutlineButton extends StatelessWidget{

  final GestureTapCallback? onPressed;
  final String text;
  final Color? highlightColor;
  final Color borderColor;
  final TextStyle? textStyle;
  final EdgeInsets? padding;

  CustomOutlineButton({this.onPressed,required this.text,this.highlightColor,required this.borderColor, this.textStyle,this.padding});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return OutlineButton(
      onPressed: onPressed,
      child: Text(text,style: textStyle,),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
      padding: padding,
      textColor: primaryColor,
      highlightedBorderColor: primaryColor,
      borderSide: BorderSide(color: borderColor)
    );
  }
}