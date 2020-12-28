import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Processes());
}

class Processes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("widget 1"),);
  }
}

/**
Container(
  color: Colors.white,
  height: MediaQuery.of(context).size.height,
  width: MediaQuery.of(context).size.width,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        'Well',
        style: TextStyle(
        color: Colors.black
        ),
      ),
    ],
  ),
),
**/