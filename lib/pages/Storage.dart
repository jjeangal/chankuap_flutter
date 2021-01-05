import 'package:flutter/cupertino.dart';
import 'package:chankuap_flutter/app_bars/storage_app_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Storage());
}

class Storage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: StorageAppBar(),
        ),
        drawer: new Drawer(
          child: ListView(
            children: const <Widget>[
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
                title: Text("Materias Primas"),
              ),
              ListTile(
                title: Text("Trabajo en Processo"),
              ),
              ListTile(
                title: Text("Producto Terminado"),
              ),
            ],
          ),
        ),
        body: Container(),
      ),
    );
  }
}