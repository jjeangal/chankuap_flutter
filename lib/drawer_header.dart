import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class drawerHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.amber,
      ),
      child: Text(
        'Drawer Header',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    );
  }
}
