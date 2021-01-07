import 'package:flutter/material.dart';

class TransactionAppBar extends StatelessWidget {
  String appBarTitle;

  TransactionAppBar(String title){
    this.appBarTitle = title;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("$appBarTitle",
          style: TextStyle(fontSize: 19)),
      centerTitle: true,
      backgroundColor: Colors.amber,
      actions: <Widget>[new IconButton(
          icon: new Icon(Icons.search),
          onPressed: () => print("search")
      )],
    );
  }
}
