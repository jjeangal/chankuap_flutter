import 'package:chankuap_flutter/app_bars/transaction_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../drawer_header.dart';

class Transactions extends StatefulWidget {
  Transactions({ Key key }) : super(key: key);

  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transactions> {

  String _title = "Transactions";
  String entrada = "Entrada de Mercaderia";
  String salida = "Salida de Mercaderia";

  changeTitle(String title) {
    setState(() {
      _title = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: TransactionAppBar(_title),
        ),
        drawer: new Drawer(
          child: ListView(
            children: <Widget>[
              drawerHeader(),
              ListTile(
                title: Text(entrada),
                onTap: () {
                  changeTitle(entrada);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text(salida),
                onTap: () {
                  changeTitle(salida);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
        body: Row (
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Icon(Icons.add),
            ),
            Expanded(
              flex: 6,
              child: Text("hello"),
            ),
            Expanded(
              flex: 2,
              child: IconButton(
                icon: Icon(Icons.add),
                onPressed: () => print("hello"),
              ),
            )
          ]
        ),
      ),
    );
  }
}