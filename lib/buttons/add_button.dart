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
      insetPadding: EdgeInsets.fromLTRB(20, 0, 20, 150),
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
                  Expanded(flex: 5, child: FormBuilderDateTimePicker(attribute: 'date')),
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

            ],
          ),
        ),
      ),
    );
  }
}
