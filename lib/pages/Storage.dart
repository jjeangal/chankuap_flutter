import 'package:flutter/cupertino.dart';
import 'package:chankuap_flutter/app_bars/storage_app_bar.dart';
import 'package:flutter/material.dart';

class Storage extends StatefulWidget {
  Storage({ Key key }) : super(key: key);

  _StorageState createState() => _StorageState();
}

class _StorageState extends State<Storage> {

  String _title = "Storage";
  String materias = "Materias Primas";
  String terminados = "Productos Terminado";
  String processos = "Trabajo en Processo";

  changeTitle(String title) {
    setState(() {
      _title = title;
    });
  }

  @override
  Widget build(BuildContext context) {

    print("title in build" + _title);

    return Container(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: StorageAppBar(_title),
        ),
        drawer: new Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.amber,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: Text(materias),
                onTap: () {
                  changeTitle(materias);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text(processos),
                onTap: () {
                  changeTitle(processos);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text(terminados),
                onTap: () {
                  changeTitle(terminados);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
        body: Container(),
      ),
    );
  }
}