import 'package:chankuap_flutter/app_bars/transaction_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Transactions());
}

class Transactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: TransactionAppBar(),
        ),
        body: Container(),
      ),
    );
  }
}