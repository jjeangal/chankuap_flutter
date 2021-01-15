import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_icons.dart';
import '../add_bar.dart';
import '../data_object.dart';

class Salida extends StatelessWidget {

  static Producto uno = new Producto("Curcuma Fresca", "CUFC011220", 800, 26);
  static Producto dos = new Producto("Curcuma Fresca", "CUFC021220", 800, 20);
  static Producto tres = Producto("Canela Molida", "CAMO021220", 500, 30);
  static Producto quatro = Producto("Canela Molida", "CAMO011220", 500, 50);
  static Producto cinco = Producto("Canela Molida", "CAMO031220", 500, 15);

  static List<Producto> listJem = [dos, tres];
  static List<Producto> listKim = [uno, quatro];
  static List<Producto> listLum = [cinco];

  static List<String> lotes = ["JEM011212", "KIM021212", "LUM031212"];

  static Transac jem = new Transac("Tienda", "JEM", "Macas", "Coche", "12/12/20",
      "12/12/20", listJem);
  static Transac kim = new Transac("Kim", "KIM", "Cuenca", "Local Airlines",
      "05/12/20", "06/12/20", listKim);
  static Transac lum = new Transac("Luna", "LUM", "Quito", "Coche",
      "12/12/20", "13/12/20", listLum);

  static List<Transac> mercaderias = [jem, kim, lum];

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Color(0xffEFEFEF),
      child: Column(
        children: <Widget>[
          AddBar(icon: Icon(AppIcons.entry, color: Color(0xff073B3A)),
              title: "Salida de Mercaderia", page: 2),
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
              alignment: Alignment(-0.75, -0.6),
              child: Container(
                width: 120,
                child: Text('${mercaderias[index].productor_name}', style:
                  TextStyle(
                    color: Color(0xff073B3A),
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  )
                )
              ),
            ),
            Align(
              alignment: Alignment(-0.75, 0.4),
              child: Container(
                width: 120,
                child:
                  Text('${mercaderias[index].fecha_uno}', style:
                    TextStyle(
                      color: Color(0xff073B3A),
                      fontSize: 16
                    )
                  )
              ),
            ),
            Align(
              alignment: Alignment(0.9, -0.5),
              child: Container(
                width: 130,
                child: Text('Canela Molida', style:
                  TextStyle(
                    color: Color(0xff073B3A),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ), textAlign: TextAlign.left
                )
              )
            ),
            Align(
                alignment: Alignment(0.9, 0.4),
                child: Container(
                  width: 130,
                  child: Text('CAO02/12/12', style:
                    TextStyle(
                      color: Color(0xff073B3A),
                      fontSize: 16,
                    ), textAlign: TextAlign.left
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
      insetPadding: EdgeInsets.fromLTRB(20, 50, 20, 130),
      child: new Stack(
        children: [
          Align(
            alignment: Alignment(0, -0.95),
            child: Text("Informacion de transaccion",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
            ),
          ),
          Align(
            alignment: Alignment(-0.8, -0.75),
            child: Container(
              width: 130,
              child: Text("Fecha", textAlign: TextAlign.center)
            ),
          ),
          Align(
            alignment: Alignment(0.8, -0.75),
            child: Container(
              width: 130,
              child: Text("Fecha", textAlign: TextAlign.center),
            ),
          ),
          Align(
            alignment: Alignment(-0.8, -0.65),
            child: Container(
              height: 30,
              width: 130,
              color: Colors.white,
              child: Align(
                alignment: Alignment.center,
                child: Text("${mercaderias[num_trans].fecha_uno}"),
              )
            ),
          ),
          Align(
            alignment: Alignment(0.8, -0.65),
            child: Container(
                height: 30,
                width: 130,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: Text("${mercaderias[num_trans].fecha_dos}"),
                )
            ),
          ),
          Align(
            alignment: Alignment(-0.8, -0.45),
            child: Container(
              width: 130,
              child: Text("Cliente", textAlign: TextAlign.center),
            ),
          ),
          Align(
            alignment: Alignment(0.8, -0.45),
            child: Container(
              width: 130,
              child: Text("Identification", textAlign: TextAlign.center),
            ),
          ),
          Align(
            alignment: Alignment(-0.8, -0.35),
            child: Container(
              height: 30,
              width: 130,
              color: Colors.white,
              child: Align(
                alignment: Alignment.center,
                child: Text("${mercaderias[num_trans].productor_name}"),
              )
            )
          ),
          Align(
              alignment: Alignment(0.8, -0.35),
              child: Container(
                  height: 30,
                  width: 130,
                  color: Colors.white,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("EF48K66A"),
                  )
              )
          ),
          Align(
            alignment: Alignment(-0.8, -0.15),
            child: Container(
              width: 130,
              child: Text("Locación", textAlign: TextAlign.center),
            )
          ),
          Align(
            alignment: Alignment(0.8, -0.15),
            child: Container(
              width: 130,
              child: Text("Transporte", textAlign: TextAlign.center),
            )
          ),
          Align(
            alignment: Alignment(-0.8, -0.05),
            child: Container(
              height: 30,
              width: 130,
              color: Colors.white,
              child: Align(
                alignment: Alignment.center,
                child: Text("${mercaderias[num_trans].comunidad}"),
              )
            ),
          ),
          Align(
            alignment: Alignment(0.8, -0.05),
            child: Container(
              height: 30,
              width: 130,
              color: Colors.white,
              child: Align(
                alignment: Alignment.center,
                child: Text("${mercaderias[num_trans].compania}"),
              )
            ),
          ),
          Align(
            alignment: Alignment(0, 0.2),
            child: Container(
              width: 200,
              child: Text("Codigo del Producto", textAlign: TextAlign.center),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.35),
            child: Container(
              height: 30,
              width: 280,
              color: Colors.white,
              child: Align(
                alignment: Alignment.center,
                child: Text("${mercaderias[num_trans].p_code}"),
              )
            ),
          ),
          Align(
            alignment: Alignment(-0.84, 0.55),
            child: Container(
              width: 85,
              child: Text("Cantidad", textAlign: TextAlign.center),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.55),
            child: Container(
              width: 85,
              child: Text("Unidad", textAlign: TextAlign.center),
            ),
          ),
          Align(
            alignment: Alignment(0.84, 0.55),
            child: Container(
              width: 85,
              child: Text("Precio", textAlign: TextAlign.center),
            ),
          ),
          Align(
            alignment: Alignment(-0.84, 0.7),
            child: Container(
              height: 30,
              width: 85,
              color: Colors.white,
              child: Align(
                alignment: Alignment.center,
                child: Text("20"),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.7),
            child: Container(
              height: 30,
              width: 85,
              color: Colors.white,
              child: Align(
                alignment: Alignment.center,
                child: Text("kg"),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.84, 0.7),
            child: Container(
              height: 30,
              width: 85,
              color: Colors.white,
              child: Align(
                alignment: Alignment.center,
                child: Text("0.25"),
              ),
            ),
          )
        ],
      ),
    );
  }

}