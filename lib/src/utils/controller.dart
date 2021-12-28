import 'package:flutter/material.dart';

/// GroupButton Controller
/// for working with GroupButton from the outside
class GroupButtonController extends ChangeNotifier {
  int? _selectedIndex;
  final _selectedIndexes = <int>{};

  /// Selected button index in case when you using radio type
  int? get selectedIndex => _selectedIndex;

  /// Selected buttons indexes in case when you using checkbox type
  Set<int> get selectedIndexes => _selectedIndexes;

  /// Select button by index in radio type
  void selectIndex(int i) {
    _selectedIndex = i;
    _selectedIndexes.add(i);
    notifyListeners();
  }

  /// Unselect button by index in checkbox and radio type
  void unselectIndex(int i) {
    _selectedIndex = null;
    _selectedIndexes.remove(i);
    notifyListeners();
  }

  /// Unselect all buttons in checkbox type
  /// and only one selected button in radio type
  void unselectAll() {
    _selectedIndex = null;
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
