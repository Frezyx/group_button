import 'package:flutter/material.dart';

class GroupButtonController extends ChangeNotifier {
  int _selectedIndex = 0;
  final _selectedIndexes = <int>{};

  int get selectedIndex => _selectedIndex;
  Set<int> get selectedIndexes => _selectedIndexes;

  void setSelectedIndex(int i) {
    _selectedIndex = i;
    notifyListeners();
  }

  void toggleIndexes(List<int> indexes) {
    for (final i in indexes) {
      if (_selectedIndexes.contains(i)) {
        _selectedIndexes.remove(i);
      } else {
        _selectedIndexes.add(i);
      }
    }
    notifyListeners();
  }

  void selectIndexes(List<int> indexes) {
    _selectedIndexes.addAll(indexes);
    notifyListeners();
  }

  void unselectIndexes(List<int> indexes) {
    _selectedIndexes.removeAll(indexes);
    notifyListeners();
  }
}
