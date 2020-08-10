import 'package:flutter/material.dart';

Row buildRadioTabIcon() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Icon(Icons.radio_button_unchecked, size: 20),
      Text("Radio"),
    ],
  );
}

Row buildCheckTabIcon() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Icon(Icons.check_box, size: 20),
      Text("Check"),
    ],
  );
}

Row buildCustomTabIcon() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Icon(Icons.palette, size: 20),
      Text("Custom"),
    ],
  );
}
