import 'package:flutter/material.dart';

class StorageAppBar extends StatelessWidget {
  String appBarTitle;

  StorageAppBar(String title){
    this.appBarTitle = title;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("$appBarTitle"),
      centerTitle: true,
      backgroundColor: Colors.amber,
      actions: <Widget>[new IconButton(
          icon: new Icon(Icons.search),
          onPressed: () => print("search")
      )],
    );
  }
}
