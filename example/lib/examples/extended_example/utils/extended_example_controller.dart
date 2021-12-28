import 'package:flutter/material.dart';

class ExtendedExampleController extends ChangeNotifier {
  var _selectedGroupingType = 0;

  int get selectedGroupingType => _selectedGroupingType;
  set selectedGroupingType(int value) {
    _selectedGroupingType = value;
    notifyListeners();
  }
}
