import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_icons.dart';
import '../add_bar.dart';
import '../data_object.dart';

import 'package:commons/commons.dart';

class Entrada extends StatelessWidget {

  static Producto uno = new Producto("Curcuma Fresca", "CUFC011220", 800, 26);
  static Producto dos = new Producto("Curcuma Fresca", "CUFC021220", 800, 20);
  static Producto tres = Producto("Canela Molida", "CAMO021220", 500, 30);
  static Producto quatro = Producto("Canela Molida", "CAMO011220", 500, 50);
  static Producto cinco = Producto("Canela Molida", "CAMO031220", 500, 15);

  static List<Producto> listJem = [dos, tres];
  static List<Producto> listKim = [uno, quatro];
  static List<Producto> listLum = [cinco];

  static List<String> lotes = ["JEM011212", "KIM021212", "LUM031212"];

  static Transac jem = new Transac("j...", "JEM", "Macas", "KLM", "12/12/20",
      "12/12/20", listJem);
  static Transac kim = new Transac("k...", "KIM", "Cuenca", "Local Airlines",
      "05/12/20", "06/12/20", listKim);
  static Transac lum = new Transac("l...", "LUM", "Quito", "AirQuito",
      "12/12/20", "13/12/20", listLum);

  static List<Transac> mercaderias = [jem, kim, lum];

  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Color(0xffEFEFEF),
        child: Column(
          children: <Widget>[
            AddBar(icon: Icon(AppIcons.entry, color: Color(0xff073B3A)),
                title: "Entrada de Mercaderia", page: 1),
            Expanded(
              child: ListView.builder(
                  itemCount: mercaderias.length,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(5.0),
                  itemBuilder: (context, index) => _buildListItem(context, index)
              ),
            ),
          ],
        )
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
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
           Align(
            alignment: Alignment(-0.8, -0.5),
            child: Text('Productor name', style:
               TextStyle(
                 color: Color(0xff073B3A),
                 fontWeight: FontWeight.bold,
                 fontSize: 16
               )
              )
            ),
            Align(
              alignment: Alignment(-0.8, 0.5),
              child: Text('Productor Code', style:
                TextStyle(
                  color: Color(0xff073B3A),
                  fontStyle: FontStyle.italic,
                  fontSize: 16
                )
              )
            ),
            Align(
              alignment: Alignment(0.7, 0),
              child: Text('10/11/2000', style:
                TextStyle(
                  color: Color(0xff073B3A),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                )
              )
            ),
           Align(
             alignment: Alignment(1.05, -1.4),
             child: IconButton(
               iconSize: 20,
               icon: Icon(Icons.do_disturb_on_outlined),
               onPressed: () => confirmationDialog(
                   context,
                   "Estas seguro ?",
                   title: "Confirmacion",
                   confirmationText: "Click here to confirmar",
                   positiveText: "Delete", positiveAction: () {/**deleteFct**/}
                  )
                )
           )
         ]),
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => _buildPopupTransaction(context, index),
          );
        }
    );
  }

  Widget _buildPopupTransaction(BuildContext context, int num_trans) {
    return new Dialog(
      backgroundColor: Color(0xffEFEFEF),
      insetPadding: EdgeInsets.fromLTRB(20, 50, 20, 100),
      child: new Stack(
        children: [
          Positioned(child: Text("Informacion de transaccion",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              top: 20, left: 65),
          Positioned(child: Text("Fecha"), top: 60, left: 70),
          Positioned(child: Text("Fecha"), top: 60, right: 70),
          Positioned(child: Container(
              height: 30,
              width: 130,
              color: Colors.white,
              child: Align(
                alignment: Alignment.center,
                child: Text("${mercaderias[num_trans].fecha_uno}"),
              )
          ),
              top: 90, left: 20),
          Positioned(child: Container(
              height: 30,
              width: 130,
              color: Colors.white,
              child: Align(
                alignment: Alignment.center,
                child: Text("${mercaderias[num_trans].fecha_dos}"),
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
                child: Text("${mercaderias[num_trans].productor_name}"),
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
                child: Text("${mercaderias[num_trans].comunidad}"),
              )
          ), top: 250, left: 20),
          Positioned(child: Container(
              height: 30,
              width: 130,
              color: Colors.white,
              child: Align(
                alignment: Alignment.center,
                child: Text("${mercaderias[num_trans].compania}"),
              )
          ), top: 250, right: 20),
          Positioned(child: Text("Codigo del Productor"), top: 300, left: 100),
          Positioned(child: Container(
              height: 30,
              width: 280,
              color: Colors.white,
              child: Align(
                alignment: Alignment.center,
                child: Text("${mercaderias[num_trans].p_code}"),
              )
          ), top: 330, left: 20),
          Positioned(child: Text("Lista de Productos"), top: 380, left: 100),
          Positioned(
            child: Container(
              height: 150,
              width: 280,
              color: Colors.white,
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: mercaderias[num_trans].getLotes().length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 60,
                    color: Color(0xffEFEFEF),
                    child: _buildProductBox(context, num_trans, index),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
              ),
            ), top: 410, left: 20,
          )
        ],
      ),
    );
  }

  Widget _buildProductBox(BuildContext context, int miel, int index) {
    return new Container(
        child: Stack(
          children: [
            Positioned(
                child: Text('${mercaderias[miel].lotes[index].name}'),
                top: 10,
                left: 10
            ),
            Positioned(
                child: Text('${mercaderias[miel].lotes[index].code}'),
                top: 30,
                left: 10
            ),
            Positioned(
              child: Container(
                color: Color(0xff073B3A),
                child: Column(
                  children: [
                    Text("${mercaderias[miel].lotes[index].unidad}",
                        style: TextStyle(color: Colors.white)),
                    Text("Unidad", style: TextStyle(color: Colors.white))
                  ],
                ),
              ), top: 15, right: 75,
            ),
            Positioned(
                child: Container(
                  color: Color(0xff073B3A),
                  child: Column(
                    children: [
                      Text("${mercaderias[miel].lotes[index].cantidad}", style: TextStyle(color: Colors.white)),
                      Text("Cantidad", style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                top: 15,
                right: 10
            )
          ],
        )
    );
  }

}



