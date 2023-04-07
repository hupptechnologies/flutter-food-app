import 'package:flutter/material.dart';

///  @param [onPressed] button press event
///  @param [text] button name
///  @param [borderColor] button border color
///  @param [textStyle] button text style
///  @param [padding] custom padding inside button
class CustomOutlineButton extends StatelessWidget {
  final GestureTapCallback? onPressed;
  final String text;
  final Color? highlightColor;
  final Color borderColor;
  final TextStyle? textStyle;
  final EdgeInsets? padding;

  CustomOutlineButton({
    this.onPressed,
    required this.text,
    this.highlightColor,
    required this.borderColor,
    this.textStyle,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          padding: padding,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          side: BorderSide(color: borderColor)),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
