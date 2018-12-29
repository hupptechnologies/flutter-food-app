import 'package:flutter/material.dart';

/**
 *  @param text   - string datatype  : Button text anme
 *  @param color  - Color class      : Button Color
 *  @param width  - double datatype  : Button width   ( default full width )
 * */
class CustomButton extends StatelessWidget{
  String text;
  Color color;
  double width = null;
  CustomButton({@required this.text,@required this.color,this.width});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: (width != null ? width : double.infinity),
      height: 45.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(22.5)
      ),
      child: Text((text).toUpperCase(),style: TextStyle(fontSize: 15.0,color: Colors.white,letterSpacing: 0.0),),
    );
  }
}