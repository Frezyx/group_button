import 'package:flutter/material.dart';

class GroupButtonController extends ChangeNotifier {
  int _selectedIndex = 0;
  final _selectedIndexes = <int>{};

  /// Selected button index in case when you using radio type
  int get selectedIndex => _selectedIndex;

  /// Selected buttons indexes in case when you using checkbox type
  Set<int> get selectedIndexes => _selectedIndexes;

  /// Select button by index in radio type
  void selectIndex(int i) {
    _selectedIndex = i;
    notifyListeners();
  }

  /// Unselect all buttons in checkbox type
  void unselectAll() {
    _selectedIndexes.clear();
    notifyListeners();
  }

  /// Toggle buttons by indexes in checkbox type
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

  /// Select buttons by indexes in checkbox type
  void selectIndexes(List<int> indexes) {
    _selectedIndexes.addAll(indexes);
    notifyListeners();
  }

  /// Unselect buttons by indexes in checkbox type
  void unselectIndexes(List<int> indexes) {
    _selectedIndexes.removeAll(indexes);
    notifyListeners();
  }
}
