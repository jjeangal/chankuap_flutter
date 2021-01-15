import 'package:chankuap_flutter/app_bars/transaction_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Salida.dart';
import '../drawer_header.dart';

class Transactions extends StatefulWidget {
  Transactions({ Key key }) : super(key: key);

  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transactions> {

  //La question c'est, dans l'historique des transactions, voulez vous voir seulement le code du prodycteur ? parce
  //qu'une transaction contient plusieurs produits

  String _title = "Transacciones";
  String entrada = "Entrada de Mercaderia";
  String salida = "Salida de Mercaderia";

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
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text(salida),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
        body: Salida()
      )
    );
  }
}



