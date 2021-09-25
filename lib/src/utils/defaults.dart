import 'package:flutter/material.dart';

class Defaults {
  static const kDefaultShadow = <BoxShadow>[
    BoxShadow(
      color: Color.fromARGB(18, 18, 18, 20),
      blurRadius: 25.0,
      spreadRadius: 1.0,
      offset: Offset(
        0.0,
        2.0,
      ),
    )
  ];

  static const kDefaultSelectedTextStyle =
  TextStyle(fontSize: 14, color: Colors.white);
  static const kDefaultUnselectedTextStyle =
  TextStyle(fontSize: 14, color: Colors.black);
}