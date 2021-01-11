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
        body: Container(
          color: Color(0xffEFEFEF),
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                child:
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Icon(Icons.add),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text("Entrada de Mercaderia", style: TextStyle(color: Colors.teal[900], fontSize: 16)),
                    ),
                    Expanded(
                      flex: 3,
                      child: FlatButton(
                        color: Colors.white,
                        onPressed: () => {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                              _buildPopupDialog(context),
                          ),
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.teal[900])
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 6,
                              child: Text("Anadir", style: TextStyle(color: Colors.teal[900]))
                            ),
                            Icon(Icons.add, color: Colors.teal[900]),
                          ],
                        ),
                      ),
                    )
                  ]
                )
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(5.0),
                  itemBuilder: (context, index) => _buildListItem(index)
                ),
              ),
            ],
          )
        )
      ),
    );
  }

  Widget _buildListItem(int index) {
    return InkWell(
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10)
          )
        ),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Stack(children: [
            Stack(
              children: [
                Positioned(
                  child: Text("Cliente", style:
                    TextStyle(
                      color: Color(0xff073B3A),
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    )),
                  top: 14, left: 30),
                Positioned(child: Text("12/12/20", style:
                  TextStyle(
                    color: Color(0xff073B3A),
                    fontSize: 16
                  )
                ),
                    bottom: 14, left: 30)
              ],
            ),
            Positioned(
              top: 25,
              right: 45,
              child: Text("CAOM0112", style:
                TextStyle(
                  color: Color(0xff073B3A),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )
              )
            )
          ],
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => _buildPopupDialog(context),
        );
      }
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Popup example'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Hello"),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }
}

