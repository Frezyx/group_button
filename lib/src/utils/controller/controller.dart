import 'package:flutter/material.dart';

/// GroupButton Controller
/// for working with GroupButton from the outside
class GroupButtonController extends ChangeNotifier {
  GroupButtonController({
    int? selectedIndex,
    List<int> selectedIndexes = const [],
    List<int> disabledIndexes = const [],
    this.onDisablePressed,
  })  : _selectedIndex = selectedIndex,
        _selectedIndexes = selectedIndexes.toSet(),
        _disabledIndexes = disabledIndexes.toSet();

  int? _selectedIndex;
  final Set<int> _selectedIndexes, _disabledIndexes;

  /// Callback [Function] works by clicking on a disabled group element
  ///
  /// Returns int [index] of selected button
  Function(int index)? onDisablePressed;

  /// Selected button index in case when you using radio type
  int? get selectedIndex => _selectedIndex;

  /// Selected buttons indexes in case when you using checkbox type
  Set<int> get selectedIndexes => _selectedIndexes;

  /// Disabled buttons indexes
  Set<int> get disabledIndexes => _disabledIndexes;

  /// Select button by index in radio type
  void selectIndex(int i) {
    if (_isDisabled(i, withCallBack: true)) {
      return;
    }
    _selectedIndex = i;
    _selectedIndexes.add(i);
    notifyListeners();
  }

  /// Unselect button by index in checkbox and radio type
  void unselectIndex(int i) {
    if (_isDisabled(i, withCallBack: true)) {
      return;
    }
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
    final enabledIndexes = _removeDisabledIndexes(indexes);
    for (final i in enabledIndexes) {
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
    final enabledIndexes = _removeDisabledIndexes(indexes);
    _selectedIndexes.addAll(enabledIndexes);
    notifyListeners();
  }

  /// Unselect buttons by indexes in checkbox type
  void unselectIndexes(List<int> indexes) {
    final enabledIndexes = _removeDisabledIndexes(indexes);
    _selectedIndexes.removeAll(enabledIndexes);
    notifyListeners();
  }

  List<int> _removeDisabledIndexes(List<int> indexes) {
    return indexes.where((e) => !disabledIndexes.contains(e)).toList();
  }

  bool _isDisabled(int i, {bool withCallBack = false}) {
    final isDisabled = _disabledIndexes.contains(i);
    if (isDisabled && withCallBack) {
      onDisablePressed?.call(i);
    }
    return isDisabled;
  }

  /// Enable buttons by indexes in checkbox and radio type
  void enableIndexes(List<int> indexes) {
    for (final i in indexes) {
      _disabledIndexes.remove(i);
    }
    notifyListeners();
  }

  /// Disable buttons by indexes in checkbox and radio type
  void disableIndexes(List<int> indexes) {
    for (final i in indexes) {
      _disabledIndexes.add(i);
    }
    notifyListeners();
  }
}
