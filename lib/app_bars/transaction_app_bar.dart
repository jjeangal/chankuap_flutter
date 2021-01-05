import 'package:flutter/material.dart';

class TransactionAppBar extends StatelessWidget {
  final Color backgroundColor = Colors.amber;
  final AppBar appBar;
  const TransactionAppBar({Key key, this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Historial de transacionnes",
          style: TextStyle(fontSize: 19)),
      centerTitle: true,
      backgroundColor: backgroundColor,
      actions: <Widget>[new IconButton(
          icon: new Icon(Icons.search),
          onPressed: () => print("search")
      )],
    );
  }

 // @override
//  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
