import 'package:flutter/material.dart';

class FormInputDecoration extends InputDecoration{

  /*
    * Input field border design
    * @param string : Placeholder name
    * */
  static FormInputDesign({String name}){
    return InputDecoration(
      contentPadding: EdgeInsets.all(15.0),
      filled: true,
      enabledBorder:new OutlineInputBorder(
          borderSide: new BorderSide(color: Colors.transparent)
      ),
      disabledBorder: OutlineInputBorder(
          borderSide: new BorderSide(color: Colors.transparent)
      ),
      border: OutlineInputBorder(
          borderSide: new BorderSide(color: Colors.transparent)
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: new BorderSide(color: Colors.transparent)
      ),
      fillColor: Colors.grey[100],
      hintStyle: TextStyle(
          letterSpacing: 1.2,
          color: Colors.grey[500]
      ),
      hintText: (name).toUpperCase(),
    );
  }
  /**
   * Custom textStyle for input field
   * */
  static TextStyle CustomTextStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 15.0,
      letterSpacing: 1.2,
    );
  }
}