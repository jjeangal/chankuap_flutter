import 'package:flutter/material.dart';

class StorageAppBar extends StatelessWidget {
  final Color backgroundColor = Colors.amber;
  final AppBar appBar;
  const StorageAppBar({Key key, this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Storage for now"),
      centerTitle: true,
      backgroundColor: backgroundColor,

      actions: <Widget>[new IconButton(
          icon: new Icon(Icons.search),
          onPressed: () => print("search")
      )],
    );
  }
}
