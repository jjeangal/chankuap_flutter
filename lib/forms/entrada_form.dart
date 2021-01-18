import 'package:commons/commons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../app_bars/form_app_bar.dart';
import '../forms/product_list_form.dart';
import '../selectMaterial.dart';

class EntradaForm extends StatelessWidget {
  final GlobalKey<FormBuilderState> _fbkey = new GlobalKey<FormBuilderState>();

  final clienteFocusNode = FocusNode();
  final IdFocusNode = FocusNode();
  final DondeFocusNode = FocusNode();
  final stepperPage = StepperPage();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                      child: Text(
                        "Entrada De Mercaderia",
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
                    FormBuilderDateTimePicker(
                      decoration: const InputDecoration(
                        labelText: 'Date',
                      ),
                      attribute: 'date',
                    ),
                    SizedBox(height: 10),
                    FormBuilderDropdown(
                        decoration: const InputDecoration(labelText: 'Quien'),
                        initialValue: 'Isaac',
                        attribute: 'quien',
                        items: [
                          'Isaac',
                          'Yollanda',
                          'Nube',
                          'Veronica',
                          'Anita'
                        ]
                            .map((quien) => DropdownMenuItem(
                                value: quien,
                                child: Text("$quien",
                                    textAlign: TextAlign.center)))
                            .toList()),
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
                            .map((medio) => DropdownMenuItem(
                                value: medio,
                                child: Text("$medio",
                                    textAlign: TextAlign.center)))
                            .toList()),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          flex: 8,
                          child: Text("Materias Primas",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18)),
                        ),
                        Expanded(
                          flex: 2,
                          child: IconButton(
                              iconSize: 20,
                              icon: Icon(Icons.add),
                              onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => stepperPage),
                                  )),
                        )
                      ],
                    ),
                    Container(
                        height: 400,
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
                            child: ProductListForm())),
                  ]))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          confirmationDialog(context, "Estas seguro ?",
              title: "Confirmacion",
              confirmationText: "Click here to confirmar",
              positiveText: "Delete", positiveAction: () {
            /**deleteFct**/
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
