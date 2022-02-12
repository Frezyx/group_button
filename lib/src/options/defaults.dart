import 'package:flutter/material.dart';

const defaultShadow = <BoxShadow>[
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

const defaultSelectedTextStyle = TextStyle(fontSize: 14, color: Colors.white);
const defaultUnselectedTextStyle = TextStyle(fontSize: 14, color: Colors.black);
