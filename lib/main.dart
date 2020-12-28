import 'package:chankuap_flutter/Documents.dart';
import 'package:chankuap_flutter/Processes.dart';
import 'package:chankuap_flutter/Storage.dart';
import 'package:chankuap_flutter/Transactions.dart';
import 'package:chankuap_flutter/app_icons.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main Page',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Transactions tran = Transactions();
  final Storage sto = Storage();
  final Processes pro = Processes();
  final Documents doc = Documents();

  int page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(widget.title, style: TextStyle(
            color: Colors.black),
        ),
      ),
      body: Container(color:
        Colors.white,
        child: Center(
          child: Text(page.toString(), textScaleFactor: 10.0)
        )
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        color: Colors.amber,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.amber,
        height: 50,
        items: <Widget>[
          Icon(AppIcons.transaction, size: 20, color: Colors.black),
          Icon(AppIcons.storage, size: 20, color: Colors.black),
          Icon(AppIcons.processes, size: 20, color: Colors.black),
          Icon(AppIcons.document, size: 20, color: Colors.black),
        ],
        animationDuration: Duration(milliseconds: 200),
        onTap: (index) {
          debugPrint("the index is $index");
          setState(() {
            page = index;
          });
        },
      ),
    );
  }
}