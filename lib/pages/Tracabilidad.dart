import 'package:flutter/cupertino.dart';
import 'package:chankuap_flutter/app_bars/tracabilidad_app_bar.dart';
import 'package:flutter/material.dart';

class Tracabilidad extends StatefulWidget {
  Tracabilidad({ Key key }) : super(key: key);

  _TracabilidadState createState() => _TracabilidadState();
}

class _TracabilidadState extends State<Tracabilidad> {

  String _title = "Tracabilidad";
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
    return Container(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: TracabilidadAppBar(_title),
        ),
        body: Container(),
      ),
    );
  }
}