import 'package:chankuap_flutter/app_bars/transaction_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_icons.dart';
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
                      child: Icon(AppIcons.entry, color: Color(0xff073B3A)),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text("Entrada de Mercaderia", style: TextStyle(color: Color(0xff073B3A), fontSize: 16)),
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
                            side: BorderSide(color: Color(0xff073B3A))
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 6,
                              child: Text("Anadir", style: TextStyle(color: Color(0xff073B3A)))
                            ),
                            Icon(Icons.add, color: Color(0xff073B3A)),
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
    return new Dialog(
      backgroundColor: Color(0xffEFEFEF),
      insetPadding: EdgeInsets.fromLTRB(20, 100, 20, 100),
      child: new Stack(
        children: [
          Positioned(child: Text("Description de transaccion"), top: 20, left: 80),
          Positioned(child: Text("Fecha"), top: 60, left: 70),
          Positioned(child: Text("Fecha"), top: 60, right: 70),
          Positioned(child: Container(
            height: 30,
            width: 130,
            color: Colors.white,
            child: Align(
              alignment: Alignment.center,
              child: Text("12/10/20"),
            )
          ),
          top: 90, left: 20),
          Positioned(child: Container(
            height: 30,
            width: 130,
            color: Colors.white,
            child: Align(
              alignment: Alignment.center,
              child: Text("13/10/20"),
            )
          ),
          top: 90, right: 20),
          Positioned(child: Text("Cliente"), top: 140, left: 140),
          Positioned(child: Container(
              height: 30,
              width: 280,
              color: Colors.white,
              child: Align(
                alignment: Alignment.center,
                child: Text("Pooti Somik Chios"),
              )
          ), top: 170, left: 20),
          Positioned(child: Text("Ciudad / Communidad"), top: 220, left: 20),
          Positioned(child: Text("Compania Aéra"), top: 220, right: 40),
          Positioned(child: Container(
              height: 30,
              width: 130,
              color: Colors.white,
              child: Align(
                alignment: Alignment.center,
                child: Text("Macas"),
              )
          ), top: 250, left: 20),
          Positioned(child: Container(
              height: 30,
              width: 130,
              color: Colors.white,
              child: Align(
                alignment: Alignment.center,
                child: Text("KLM"),
              )
          ), top: 250, right: 20),
          Positioned(child: Text("Codigo del Productor"), top: 300, left: 100),
          Positioned(child: Container(
              height: 30,
              width: 280,
              color: Colors.white,
              child: Align(
                alignment: Alignment.center,
                child: Text("JEM018"),
              )
          ), top: 330, left: 20),
          Positioned(child: Text("Lista de Productos"), top: 370)
        ],
      ),
    );
  }
}

