import 'package:flutter/cupertino.dart';
import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:flutter/material.dart';

import 'steps/step_one_entrada.dart';
import 'steps/step_two_entrada.dart';


class StepperPage extends StatefulWidget {
  @override
  _StepperPageState createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  int currentStep = 0;

  final LoteFocusNode = FocusNode();

  List<Step> steps = <Step>[
    Step(
      title: Text("Producto"),
      subtitle: Text('Selecionar nombre y codigo'),
      content: LimitedBox(
        maxWidth: 300,
        maxHeight: 150,
        child: new StepOneEntrada()
      )
    ),
    Step(
      title: Text("Information de Producto"),
      subtitle: Text('Selectionar cantidad unidad y precio'),
      content: LimitedBox(
        maxWidth: 300,
        maxHeight: 200,
        child: new StepTwoEntrada()
      )
    )
  ];

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('CupertinoStepper for Flutter'),
        ),
        child: SafeArea(
          child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
              switch (orientation) {
                case Orientation.portrait:
                  return _buildStepper(StepperType.vertical);
                case Orientation.landscape:
                  return _buildStepper(StepperType.horizontal);
                default:
                  throw UnimplementedError(orientation.toString());
              }
            },
          ),
        ),
      )
    );
  }

  CupertinoStepper _buildStepper(StepperType type) {
    final canCancel = currentStep > 0;
    return CupertinoStepper(
      type: type,
      steps: steps,
      currentStep: currentStep,
      onStepTapped: (step) => setState(() => currentStep = step),
      onStepCancel: canCancel ? () => setState(() => --currentStep) : null,
      onStepContinue: () {
        setState(() {
          if (currentStep < steps.length - 1) currentStep++;
          else (print("method alert + register product"));
        });
      }
    );
  }
}