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
          style: TextStyle(fontSize: 19, color: Color(0xff073B3A))),
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Color(0xff073B3A)),
      actions: <Widget>[new IconButton(
          icon: new Icon(Icons.search, color: Color(0xff073B3A)),
          onPressed: () => print("search")
      )],
    );
  }
}
