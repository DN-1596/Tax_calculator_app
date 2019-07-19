import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tax_calculator_app/ui/home.dart';

main() {

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);  // fixing orientation of phone
  runApp(new MaterialApp(
    title:"Tax Collection App",
    home: home(),
  ));
}

