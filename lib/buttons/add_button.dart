import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddButton extends StatelessWidget {

  final int page;

  AddButton({Key key, this.page}) : super(key: key);

  final GlobalKey <FormBuilderState> _fbkey = new GlobalKey<FormBuilderState>();
  final TextEditingController _typeAheadController = TextEditingController();

  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.white,
      onPressed: () => {
        if (page == 1) print("we in transactions"),
        if (page == 3) showDialog(
          context: context,
          builder: (BuildContext context) => _buildProcessForm(context),
        )
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Color(0xff073B3A))
      ),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 6,
              child: Text("Anadir", style: TextStyle(color: Color(0xff073B3A)))
          ),
          Icon(Icons.add, color: Color(0xff073B3A)),
        ],
      ),
    );
  }

  Widget _buildProcessForm(context) {
    return new Dialog(
      backgroundColor: Color(0xffEFEFEF),
      insetPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: new FormBuilder(
          key: _fbkey,
          child: Column(
            children: <Widget>[
              Container(child: Text('Agregue un Processo',
                style: TextStyle(fontSize: 16))),
              Container(height: 30),
              Row(
                children: [
                  Expanded(flex: 5, child: Text("Producto", textAlign: TextAlign.center)),
                  Expanded(flex: 5, child: Text("Fecha", textAlign: TextAlign.center))
                ],
              ),
              Row(
                children: [
                  Expanded(flex: 5,
                    child: TypeAheadField(
                      textFieldConfiguration: TextFieldConfiguration(
                          autofocus: true,
                          textAlign: TextAlign.center,
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
                    )
                  ),
                  Expanded(flex: 5, child: FormBuilderDateTimePicker(attribute: 'fecha',)),
                ],
              ),
              Container(height: 30),
              Row(
                children: [
                  Expanded(flex: 5, child: Text("No. Lote", textAlign: TextAlign.center)),
                  Expanded(flex: 5, child: Text("Quien", textAlign: TextAlign.center))
                ],
              ),
              Row(
                children: [
                  Expanded(flex: 5, child: FormBuilderTextField(maxLines: 1,
                    attribute: 'no_lote', textAlign: TextAlign.center)),
                  Expanded(
                    flex: 5,
                    child: FormBuilderDropdown(
                      hint: Text('Elige', textAlign: TextAlign.center),
                      attribute: 'unidad',
                      items: ['Isaac', 'Yollanda', 'Nube', 'Veronica', 'Anita']
                        .map((quien) =>
                          DropdownMenuItem(
                            value: quien,
                            child: Text("$quien", textAlign: TextAlign.center)
                          )
                        ).toList()
                    )
                  )
                ],
              ),
              Container(height: 30),
              Row(
                children: [
                  Expanded(flex: 4, child: Text('Cantidad', textAlign: TextAlign.center)),
                  Expanded(flex: 2, child: Text('Unidad', textAlign: TextAlign.center)),
                  Expanded(flex: 4, child: Text('Precio', textAlign: TextAlign.center))
                ],
              ),
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
                      onPressed: () => print("why"),
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
                  height: 200,
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
              color: Colors.greenAccent,
              child: Text("Canela Molida", textAlign: TextAlign.center)
            )
          ),
          Align(
            alignment: Alignment(-0.8, 0.5),
            child: Container(
              height: 20,
              width: 100,
              color: Colors.black12,
              child: Text("CAO011212", textAlign: TextAlign.center)
            )
          ),
          Align(
            alignment: Alignment(0.8, 0),
            child: Container(
              height: 20, width: 80,
              color: Colors.blue,
              child: Text("12 Kg", textAlign: TextAlign.center)
            )
          ),
        ],
      ),
    );
  }
}