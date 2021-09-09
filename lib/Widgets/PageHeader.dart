import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  final String title;

  PageHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(top: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkResponse(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
              Future.delayed(
                  Duration(milliseconds: 100), () => Navigator.pop(context));
            },
            child: Icon(
              Icons.keyboard_backspace,
              size: 20.0,
            ),
          ),
          Text(
            (title).toUpperCase(),
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
          Container(
            width: 20.0,
          )
        ],
      ),
    );
  }
}
