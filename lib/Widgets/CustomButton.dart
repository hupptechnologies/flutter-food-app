import 'package:flutter/material.dart';

///  @param [text] button text name
///  @param [color] button name
///  @param [width] button width.(Default full width)
class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final GestureTapCallback onPressed;
  final double? width;

  CustomButton(
      {required this.text,
      required this.color,
      this.width,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          onPrimary: color,
          padding: EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.0),
          )),
      onPressed: onPressed,
      child: Container(
        width: (width != null ? width : double.infinity),
        height: 45.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(22.0),
        ),
        child: Text(
          (text).toUpperCase(),
          style: TextStyle(
              fontSize: 15.0, color: Colors.white, letterSpacing: 0.0),
        ),
      ),
    );
  }
}
