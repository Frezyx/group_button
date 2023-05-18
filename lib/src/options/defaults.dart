import 'package:flutter/material.dart';

@protected
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

@protected
const defaultSelectedTextStyle = TextStyle(
  fontSize: 14,
  color: Colors.white,
);

@protected
const defaultUnselectedTextStyle = TextStyle(
  fontSize: 14,
  color: Colors.black,
);
