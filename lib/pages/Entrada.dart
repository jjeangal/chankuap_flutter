import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../add_bar.dart';
import '../app_icons.dart';
import '../buttons/transac_delete_button.dart';
import '../data_object.dart';
import '../forms/entrada_form.dart';

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

  static Transac jem = new Transac(
      "j...", "JEM", "Macas", "KLM", "12/12/20", "12/12/20", listJem);
  static Transac kim = new Transac("k...", "KIM", "Cuenca", "Local Airlines",
      "05/12/20", "06/12/20", listKim);
  static Transac lum = new Transac(
      "l...", "LUM", "Quito", "AirQuito", "12/12/20", "13/12/20", listLum);

  static List<Transac> mercaderias = [jem, kim, lum];

  final EntradaForm entrada_form = EntradaForm();

  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Color(0xffEFEFEF),
        child: Column(
          children: <Widget>[
            AddBar(
                icon: Icon(AppIcons.entry, color: Color(0xff073B3A)),
                title: "Entrada de Mercaderia",
                page: 1),
            Expanded(
              child: ListView.builder(
                  itemCount: mercaderias.length,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(5.0),
                  itemBuilder: (context, index) =>
                      _buildListItem(context, index)),
            ),
          ],
        ));
  }

  Widget _buildListItem(BuildContext context, int index) {
    return InkWell(
        child: Container(
            height: 70,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Stack(children: [
              Align(
                  alignment: Alignment(-0.8, -0.5),
                  child: Text('Productor name',
                      style: TextStyle(
                          color: Color(0xff073B3A),
                          fontWeight: FontWeight.bold,
                          fontSize: 16))),
              Align(
                  alignment: Alignment(-0.8, 0.5),
                  child: Text('Productor Code',
                      style: TextStyle(
                          color: Color(0xff073B3A),
                          fontStyle: FontStyle.italic,
                          fontSize: 16))),
              Align(
                  alignment: Alignment(0.65, 0),
                  child: Text('10/11/2000',
                      style: TextStyle(
                        color: Color(0xff073B3A),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ))),
              Align(
                  alignment: Alignment(1.05, -1.4),
                  child: TransactionDeleteButton())
            ])),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => entrada_form.build(context)),
          );
        });
  }
}
