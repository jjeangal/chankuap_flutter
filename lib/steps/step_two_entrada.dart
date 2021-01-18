import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

class StepTwoEntrada extends StatelessWidget {

  final LoteFocusNode = FocusNode();
  final CantidadFocusNode = FocusNode();
  final PrecioFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Cantidad',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [LengthLimitingTextInputFormatter(15)],
              onSaved: (cantidad) {
                //print("Here the name should be saved");
              },
              autofocus: true,
              focusNode: CantidadFocusNode,
              textInputAction: TextInputAction.next,
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusScope.of(context).requestFocus(CantidadFocusNode);
              },
            ),
            FormBuilderDropdown(
              decoration: const InputDecoration(
                  labelText: 'Unidad'
              ),
              initialValue: 'g',
              attribute: 'unidad',
              items: ['g', 'kg', 'lb', 'ml', 'L']
                .map((unidad) =>
                  DropdownMenuItem(
                    value: unidad,
                    child: Text("$unidad", textAlign: TextAlign.center)
                  )
                ).toList()
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Precio',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [LengthLimitingTextInputFormatter(15)],
              onSaved: (precio) {
                //print("Here the name should be saved");
              },
              autofocus: true,
              focusNode: PrecioFocusNode,
              textInputAction: TextInputAction.next,
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusScope.of(context).requestFocus(PrecioFocusNode);
              },
            ),
          ]
        )
      )
    );
  }
}
