import 'package:flutter/material.dart';

class FormInputDecoration extends InputDecoration {
  /*
    * Input field border design
    * @param string : Placeholder name
    * */
  static FormInputDesign({String? name, String? errorText}) {
    return InputDecoration(
        contentPadding:
            EdgeInsets.only(top: 12, bottom: 12, left: 10, right: 10),
        filled: true,
        enabledBorder: new OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.transparent)),
        disabledBorder: OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.transparent)),
        border: OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.transparent)),
        fillColor: Colors.grey[100],
        hintStyle: TextStyle(letterSpacing: 1.2, color: Colors.grey[500]),
        errorMaxLines: 3,
        hintText: (name!).toUpperCase(),
        errorStyle: TextStyle(
            letterSpacing: 1.2, decorationStyle: TextDecorationStyle.dashed));
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
