import 'package:flutter/material.dart';

class GroupButtonController extends ChangeNotifier {
  int selectedIndex = 0;
  List<int> selectedIndexes = [0];

  void setSelectedIndex(int i) {
    selectedIndex = i;
    notifyListeners();
  }

  void setSelectedIndexes(List<int> i) {
    selectedIndexes = i;
    notifyListeners();
  }
}
