import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 60,
          color: Color(0xffEFEFEF),
          child: _buildProductBox(context),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  Widget _buildProductBox (BuildContext context) {
    return new Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xff073B3A))
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment(-0.8, -0.5),
            child: Container(
              child: Text('Product Name', textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              )
            )
          ),
          Align(
            alignment: Alignment(-0.8, 0.5),
            child: Container(
              child: Text('No. Lote',
                textAlign: TextAlign.center,
                style: TextStyle(fontStyle: FontStyle.italic),
              )
            )
          ),
          Align(
              alignment: Alignment(0.4, 0),
              child: Container(
                  child: Text('12L',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )
              )
          ),
          Align(
              alignment: Alignment(0.8, 0),
              child: Container(
                  child: Text('0.25\$',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  )
              )
          ),
        ],
      )
    );
  }
}