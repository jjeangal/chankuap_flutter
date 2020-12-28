import 'package:flutter/material.dart';

void main() {
  runApp(Processes());
}

class Processes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Processes'),
    );
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