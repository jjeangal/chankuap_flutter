import 'package:chankuap_flutter/app_icons.dart';
import 'package:chankuap_flutter/pages/Documents.dart';
import 'package:chankuap_flutter/pages/Processes.dart';
import 'package:chankuap_flutter/pages/Storage.dart';
import 'package:chankuap_flutter/pages/Transactions.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
  int _pageIndex = 0;

  final Transactions tran = Transactions();
  final Storage sto = Storage();
  final Processes pro = Processes();
  final Documents doc = Documents();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return tran;
        break;
      case 1:
        return sto;
        break;
      case 2:
        return pro;
        break;
      case 3:
        return doc;
        break;
      default:
        return tran;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
            child: _pageChooser(_pageIndex),
          )),
      bottomNavigationBar: CurvedNavigationBar(
        index: _pageIndex,
        color: Colors.amber,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.amber,
        height: 50,
        items: <Widget>[
          Icon(AppIcons.transaction, size: 25, color: Colors.black),
          Icon(AppIcons.storage, size: 25, color: Colors.black),
          Icon(AppIcons.processes, size: 25, color: Colors.black),
          Icon(AppIcons.document, size: 25, color: Colors.black),
        ],
        animationDuration: Duration(milliseconds: 200),
        onTap: (int tappedIndex) {
          _pageIndex = tappedIndex;
          debugPrint("the index is $_pageIndex");
          setState(() {
            //_showPage = _pageChooser(tappedIndex);
          });
        },
      ),
    );
  }
}
