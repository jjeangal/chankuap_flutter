import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

class StepOneEntrada extends StatelessWidget {

  final TextEditingController _typeAheadController = TextEditingController();

  final LoteFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          body: SafeArea(
              child: Column(
                  children: <Widget>[
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
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'No. Lote',
                      ),
                      inputFormatters: [LengthLimitingTextInputFormatter(30)],
                      onSaved: (lote) {
                        //print("Here the name should be saved");
                      },
                      autofocus: true,
                      focusNode: LoteFocusNode,
                      textInputAction: TextInputAction.next,
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        FocusScope.of(context).requestFocus(LoteFocusNode);
                      },
                    ),
                  ]
              )
          )
      ),
    );
  }
}
