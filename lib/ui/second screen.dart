import 'package:flutter/material.dart';
import 'package:tax_calculator_app/ui/theme.dart';



class scrn2 extends StatefulWidget {
  @override
  _scrn2State createState() => _scrn2State();
}

class _scrn2State extends State<scrn2> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade700,
        title: Text(
          "Tax Information",
          style: themestyle(22),
        ),

      ),
      body:  new Image.asset(
        "images/taxinfo.png",
        height: 800,
        width: 499,
        fit: BoxFit.contain,
      ),

    );
  }
}
