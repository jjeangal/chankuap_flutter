import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import '../app_bars/form_app_bar.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class EntradaForm extends StatelessWidget {

  final GlobalKey <FormBuilderState> _fbkey = new GlobalKey<FormBuilderState>();
  final TextEditingController _typeAheadController = TextEditingController();
  final clienteFocusNode = FocusNode();
  final IdFocusNode = FocusNode();
  final DondeFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
        appBar: FormAppBar(),
        body: SafeArea(
            top: false,
            bottom: false,
            child: new Form(
                key: _fbkey,
                child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    children: <Widget>[
                      SizedBox(height: 10),
                      Container(
                        child: Text("Entrada De Mercaderia",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 10),
                      FormBuilderDateTimePicker(
                        decoration: const InputDecoration(
                          labelText: 'Date',
                        ),
                        attribute: 'date',
                      ),
                      SizedBox(height: 10),
                      FormBuilderDropdown(
                          decoration: const InputDecoration(
                              labelText: 'Quien'
                          ),
                          initialValue: 'Isaac',
                          attribute: 'quien',
                          items: ['Isaac', 'Yollanda', 'Nube', 'Veronica', 'Anita']
                              .map((quien) =>
                              DropdownMenuItem(
                                  value: quien,
                                  child: Text("$quien", textAlign: TextAlign.center)
                              )
                          ).toList()
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Cliente',
                        ),
                        inputFormatters: [LengthLimitingTextInputFormatter(30)],
                        onSaved: (name) {
                          //print("Here the name should be saved");
                        },
                        autofocus: true,
                        focusNode: clienteFocusNode,
                        textInputAction: TextInputAction.next,
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          FocusScope.of(context).requestFocus(clienteFocusNode);
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'ID',
                        ),
                        inputFormatters: [LengthLimitingTextInputFormatter(30)],
                        onSaved: (id) {
                          //print("Here the name should be saved");
                        },
                        autofocus: true,
                        focusNode: IdFocusNode,
                        textInputAction: TextInputAction.next,
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          FocusScope.of(context).requestFocus(DondeFocusNode);
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Ciudad / Comunidad',
                        ),
                        inputFormatters: [LengthLimitingTextInputFormatter(30)],
                        onSaved: (comunidad) {
                          //print("Here the name should be saved");
                        },
                        autofocus: true,
                        focusNode: DondeFocusNode,
                        textInputAction: TextInputAction.next,
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          FocusScope.of(context).requestFocus(DondeFocusNode);
                        },
                      ),
                      SizedBox(height: 10),
                      FormBuilderDropdown(
                          attribute: 'medio',
                          decoration: const InputDecoration(
                            labelText: 'Medio de Transporte',
                          ),
                          items: ['Caro', 'Avion']
                              .map((medio) =>
                              DropdownMenuItem(
                                  value: medio,
                                  child: Text("$medio", textAlign: TextAlign.center)
                              )
                          ).toList()
                      ),
                    ]
                )
            )
        )
    );
  }
/**
  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: FormAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Color(0xffEFEFEF)),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: new FormBuilder(
            key: _fbkey,
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(flex: 4, child: FormBuilderTextField(maxLines: 1,
                        attribute: 'cantidad', textAlign: TextAlign.center)),
                    Expanded(flex: 2, child: FormBuilderDropdown(
                        hint: Text('Elige', textAlign: TextAlign.center),
                        attribute: 'unidad',
                        items: ['kg', 'lb']
                            .map((unidad) =>
                            DropdownMenuItem(
                                value: unidad,
                                child: Text("$unidad")
                            )
                        ).toList()
                      )
                    ),
                    Expanded(flex: 4, child: FormBuilderTextField(maxLines: 1,
                        attribute: 'precio', textAlign: TextAlign.center))
                  ],
                ),
                Container(height: 30),
                Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Text("Hecho con", textAlign: TextAlign.center),
                    ),
                    Expanded(
                      flex: 3,
                      child: IconButton(icon: Icon(Icons.add),
                        onPressed: () => StepperPage(),
                      ),
                    )
                  ],
                ),
                Align(
                  child: Container(
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.all(Radius.circular(10))
                    ),
                    height: 250,
                    child: ListView.separated(
                        itemCount: 3,
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.all(5.0),
                        itemBuilder: (context, index) => _buildMaterialItem(context, index),
                        separatorBuilder: (BuildContext context, int index) => const Divider()
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMaterialItem(BuildContext context, int index) {
    return new Container (
      decoration: new BoxDecoration(
          color: Color(0xffEFEFEF),
          borderRadius: new BorderRadius.all(Radius.circular(10))
      ),
      height: 60,
      child: Stack(
        children: [
          Align(
              alignment: Alignment(-0.8, -0.5),
              child: Container(
                  height: 20,
                  width: 100,
                  child: Text("Descripcion", textAlign: TextAlign.center)
              )
          ),
          Align(
              alignment: Alignment(-0.8, 0.5),
              child: Container(
                  height: 20,
                  width: 100,
                  child: Text("No. Lote", textAlign: TextAlign.center)
              )
          ),
          Align(
              alignment: Alignment(0.7, 0),
              child: Container(
                  height: 20, width: 80,
                  child: Text("12 Kg", textAlign: TextAlign.center)
              )
          ),
          Align(
              alignment: Alignment(1.25, -1.25),
              child: Container(
                  height: 20, width: 80,
                  child: IconButton(icon: Icon(Icons.close), onPressed: () => print("mab"))
              )
          ),
        ],
      ),
    );
  }
 **/
}