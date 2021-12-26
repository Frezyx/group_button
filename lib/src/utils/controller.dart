import 'package:flutter/material.dart';

class GroupButtonController extends ChangeNotifier {
  int _selectedIndex = 0;
  List<int> _selectedIndexes = [0];

  int get selectedIndex => _selectedIndex;
  List<int> get selectedIndexes => _selectedIndexes;

  void setSelectedIndex(int i) {
    _selectedIndex = i;
    notifyListeners();
  }

  void setSelectedIndexes(List<int> i) {
    _selectedIndexes = i;
    notifyListeners();
  }
}
