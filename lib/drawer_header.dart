import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class drawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Color(0xffEFEFEF),
      ),
      child: Text(
        'Drawer Header',
        style: TextStyle(
          color: Color(0xff073B3A),
          fontSize: 24,
        ),
      ),
    );
  }
}
