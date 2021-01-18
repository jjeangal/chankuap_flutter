import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../app_bars/form_app_bar.dart';
import '../forms/product_list_form.dart';
import '../selectMaterial.dart';

class SalidaForm extends StatelessWidget {
  final GlobalKey<FormBuilderState> _fbkey = new GlobalKey<FormBuilderState>();
  final nameFocusNode = FocusNode();
  final stepperPage = new StepperPage();

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
                  "Salida De Mercaderia",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 10),
              FormBuilderDateTimePicker(
                decoration: const InputDecoration(
                  labelText: 'Date',
                ),
                attribute: 'date1',
              ),
              SizedBox(height: 10),
              FormBuilderDateTimePicker(
                decoration: const InputDecoration(
                  labelText: 'Date',
                ),
                attribute: 'date2',
              ),
              SizedBox(height: 10),
              FormBuilderDropdown(
                  decoration: const InputDecoration(labelText: 'Quien'),
                  initialValue: 'Isaac',
                  attribute: 'quien',
                  items: ['Isaac', 'Yollanda', 'Nube', 'Veronica', 'Anita']
                      .map((quien) => DropdownMenuItem(
                          value: quien,
                          child: Text("$quien", textAlign: TextAlign.center)))
                      .toList()),
              SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Cliente',
                ),
                inputFormatters: [LengthLimitingTextInputFormatter(30)],
                validator: (userName) {
                  if (userName.isEmpty) {
                    return 'Name is required';
                  }
                  if (userName.length < 3) {
                    return 'Name is too short';
                  }
                  return null;
                },
                onSaved: (userName) {
                  //print("Here the name should be saved");
                },
                autofocus: true,
                focusNode: nameFocusNode,
                textInputAction: TextInputAction.next,
                onTap: () {
                  FocusScope.of(context).unfocus();
                  FocusScope.of(context).requestFocus(nameFocusNode);
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
                          child: Text("$medio", textAlign: TextAlign.center)))
                      .toList()),
              SizedBox(height: 10),
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
            ],
          ),
        ),
      ),
    );
  }
}

/**
    TypeAheadField(
    textFieldConfiguration: TextFieldConfiguration(
    autofocus: true,
    decoration: const InputDecoration(
    labelText: 'Product name',
    hintText: 'Enter product name',
    ),
    ),
    // ignore: missing_return
    suggestionsCallback: (pattern) async {
    //return await BackendService.getSuggestions(pattern);
    },
    itemBuilder: (context, suggestion) {
    return ListTile(
    title: Text(suggestion),
    );
    },
    onSuggestionSelected: (suggestion) {
    this._typeAheadController.text = suggestion;
    },
    ),**/

/**
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
    ],
    ),**/
