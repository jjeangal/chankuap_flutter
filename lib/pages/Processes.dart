import 'package:chankuap_flutter/app_bars/processes_app_bar.dart';
import 'package:flutter/material.dart';

import '../app_icons.dart';
import '../add_bar.dart';

void main() {
  runApp(Processes());
}

class Processes extends StatefulWidget {
  Processes({ Key key }) : super(key: key);

  _ProcessesState createState() => _ProcessesState();
}

class _ProcessesState extends State<Processes>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: ProcessesAppBar(),
        ),
        body: Container(
          color: Color(0xffEFEFEF),
          child: Column(
            children: <Widget>[
              AddBar(icon: Icon(AppIcons.entry, color: Color(0xff073B3A)),
                  title: "Historial de Processos", page: 3),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(5.0),
                  itemBuilder: (context, index) => _buildListItem(context, index)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return InkWell(
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xff0F956A)),
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Stack(
          children: [
            Align(
              alignment: Alignment(-0.75, -0.3),
              child: Container(
                color: Colors.greenAccent,
                width: 120,
                child: Text('Yollanda', style:
                  TextStyle(
                    color: Color(0xff073B3A),
                    fontSize: 18
                  ), textAlign: TextAlign.left,
                )
              )
            ),
            Align(
              alignment: Alignment(-0.75, 0.6),
              child: Container(
                color: Colors.blueGrey,
                width: 120,
                child: Text('10/11/2000', style: TextStyle(
                    color: Color(0xff073B3A),
                    fontSize: 16
                  ), textAlign: TextAlign.left,
                )
              )
            ),
            Align(
              alignment: Alignment(0.7, -0.3),
              child: Container(
                color: Colors.blueGrey,
                width: 120,
                child: Text('Descripcion', style:
                  TextStyle(
                    color: Color(0xff073B3A),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ), textAlign: TextAlign.center
                )
              )
            ),
            Align(
              alignment: Alignment(0.7, 0.5),
              child: Container(
                color: Colors.greenAccent,
                width: 120,
                child: Text('Terminado', style:
                  TextStyle(
                    color: Color(0xff073B3A),
                    fontSize: 13,
                  ), textAlign: TextAlign.center,
                  )
              )
            )
          ],
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => _buildPopupProcess(context, index),
        );
      }
    );
  }

  Widget _buildPopupProcess(context, index) {
    return new Dialog(
      backgroundColor: Color(0xffEFEFEF),
      insetPadding: EdgeInsets.fromLTRB(20, 50, 20, 150),
      child: new Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(0, -0.9),
            child: Container(
              color: Colors.white,
              height: 40,
              width: 220,
              child: Text('Informacion de Processo', textAlign: TextAlign.center)
            )
          ),
          Align(
            alignment: Alignment(-0.8, -0.7),
            child: Container(
              color: Colors.white,
              height: 20,
              width: 130,
                child: Text('Description', textAlign: TextAlign.center)
            )
          ),
          Align(
            alignment: Alignment(0.8, -0.7),
            child: Container(
              color: Colors.white,
              height: 20,
              width: 130,
              child: Text('Fecha', textAlign: TextAlign.center)
            )
          ),
          Align(
            alignment: Alignment(-0.8, -0.6),
            child: Container(
              color: Colors.white,
              height: 20,
              width: 130,
              child: Text('Canela Molida', textAlign: TextAlign.center)
            )
          ),
          Align(
            alignment: Alignment(0.8, -0.6),
            child: Container(
              color: Colors.white,
              height: 20,
              width: 130,
              child: Text('10/11/2000', textAlign: TextAlign.center)
            )
          ),
          Align(
            alignment: Alignment(-0.8, -0.4),
            child: Container(
              color: Colors.white,
              height: 20,
              width: 130,
              child: Text('No Lote', textAlign: TextAlign.center)
            )
          ),
          Align(
            alignment: Alignment(0.8, -0.4),
            child: Container(
              color: Colors.white,
              height: 20,
              width: 130,
              child: Text('Quien', textAlign: TextAlign.center)
            )
          ),
          Align(
            alignment: Alignment(-0.8, -0.3),
            child: Container(
              color: Colors.white,
              height: 20,
              width: 130,
              child: Text('CAOM01212', textAlign: TextAlign.center)
            )
          ),
          Align(
            alignment: Alignment(0.8, -0.3),
            child: Container(
              color: Colors.white,
              height: 20,
              width: 130,
              child: Text('Yollanda', textAlign: TextAlign.center)
            )
          ),
          Align(
            alignment: Alignment(-0.84, -0.1),
            child: Container(
              color: Colors.white,
              height: 20,
              width: 85,
              child: Text('Cantidad', textAlign: TextAlign.center)
            )
          ),
          Align(
            alignment: Alignment(0, -0.1),
            child: Container(
              color: Colors.white,
              height: 20,
              width: 85,
              child: Text('Unidad', textAlign: TextAlign.center)
            )
          ),
          Align(
              alignment: Alignment(0.84, -0.1),
              child: Container(
                color: Colors.white,
                height: 20,
                width: 85,
                child: Text('Precio', textAlign: TextAlign.center)
              )
          ),
          Align(
              alignment: Alignment(-0.84, 0),
              child: Container(
                  color: Colors.white,
                  height: 20,
                  width: 85,
                  child: Text('10', textAlign: TextAlign.center)
              )
          ),
          Align(
              alignment: Alignment(0, 0),
              child: Container(
                  color: Colors.white,
                  height: 20,
                  width: 85,
                  child: Text('Kg', textAlign: TextAlign.center)
              )
          ),
          Align(
              alignment: Alignment(0.84, 0),
              child: Container(
                color: Colors.white,
                height: 20,
                width: 85,
                child: Text("0.25", textAlign: TextAlign.center)
              )
          ),
          Align(
            alignment: Alignment(0, 0.2),
            child: Container(
              color: Colors.white,
              height: 20,
              width: 85,
              child: Text('Hecho con', textAlign: TextAlign.center),
            )
          ),
          Align(
            alignment: Alignment(0, 0.9),
            child: Container(
              color: Colors.white,
              height: 180,
              width: 285,
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 60,
                    color: Color(0xffEFEFEF),
                    child: _buildProductBox(context, index),
                    );
                  },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
                itemCount: 3
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildProductBox(BuildContext context, int index) {
  return new Container(
    child: Stack(
      children: [
        Align(
          alignment: Alignment(-0.8, -0.4),
          child: Container(
            width: 110,
            color: Colors.white,
            child: Text("Descripcion", textAlign: TextAlign.left),
          ),
        ),
        Align(
          alignment: Alignment(-0.8, 0.7),
          child: Container(
            width: 110,
            height: 20,
            color: Colors.white,
            child: Text("No Lote", textAlign: TextAlign.left),
          ),
        ),
        Align(
          alignment: Alignment(0.8, -0.4),
          child: Container(
            width: 110,
            height: 20,
            color: Colors.white,
            child: Text("3kg", textAlign: TextAlign.center),
          ),
        )
      ],
    ),
  );
}
