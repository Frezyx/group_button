import 'package:flutter/material.dart';

/// GroupButton Controller
/// for working with GroupButton from the outside
class GroupButtonController extends ChangeNotifier {
  GroupButtonController({
    int? selectedIndex,
    List<int> selectedIndexes = const <int>[],
    List<int> disabledIndexes = const <int>[],
  })  : _selectedButton = selectedIndex,
        _selectedButtons = selectedIndexes.toSet(),
        _disabledIndexes = disabledIndexes.toSet();

  int? _selectedButton;
  final Set<int> _selectedButtons;
  final Set<int> _disabledIndexes;

  /// Selected button index in case when you using radio type
  int? get selectedIndex => _selectedButton;

  /// Selected buttons indexes in case when you using checkbox type
  Set<int> get selectedIndexes => _selectedButtons;

  /// Disabled buttons indexes
  Set<int> get disabledIndexes => _disabledIndexes;

  /// Select button by index in radio type
  void selectIndex(int i) {
    _selectedButton = i;
    _selectedButtons.add(i);
    notifyListeners();
  }

  /// Unselect button by index in checkbox and radio type
  void unselectIndex(int i) {
    _selectedButton = null;
    _selectedButtons.remove(i);
    notifyListeners();
  }

  /// Unselect all buttons in checkbox type
  /// and only one selected button in radio type
  void unselectAll() {
    _selectedButton = null;
    _selectedButtons.clear();
    notifyListeners();
  }

  /// Toggle buttons by indexes in checkbox type
  void toggleIndexes(List<int> indexes) {
    for (final i in indexes) {
      if (_selectedButtons.contains(i)) {
        _selectedButtons.remove(i);
      } else {
        _selectedButtons.add(i);
      }
    }
    notifyListeners();
  }

  /// Select buttons by indexes in checkbox type
  void selectIndexes(List<int> indexes) {
    _selectedButtons.addAll(indexes);
    notifyListeners();
  }

  /// Unselect buttons by indexes in checkbox type
  void unselectIndexes(List<int> indexes) {
    _selectedButtons.removeAll(indexes);
    notifyListeners();
  }
}
