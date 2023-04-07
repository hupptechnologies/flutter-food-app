import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              strokeWidth: 3.0)),
      color: Colors.white54,
    );
  }
}
