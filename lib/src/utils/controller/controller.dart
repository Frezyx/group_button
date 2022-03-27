import 'package:flutter/material.dart';

/// GroupButton Controller
/// for working with GroupButton from the outside
class GroupButtonController extends ChangeNotifier {
  GroupButtonController({
    int? selectedIndex,
    List<int> selectedIndexes = const <int>[],
    List<int> disabledIndexes = const <int>[],
    Function(int index)? onDisablePressed,
  })  : _selectedButton = selectedIndex,
        _selectedButtons = selectedIndexes.toSet(),
        _disabledIndexes = disabledIndexes.toSet(),
        onDisablePressed = onDisablePressed;

  int? _selectedButton;
  final Set<int> _selectedButtons;
  final Set<int> _disabledIndexes;

  /// Callback [Function] works by clicking on a disabled group element
  ///
  /// Return int [index] of selected button
  Function(int idnex)? onDisablePressed;

  /// Selected button index in case when you using radio type
  int? get selectedIndex => _selectedButton;

  /// Selected buttons indexes in case when you using checkbox type
  Set<int> get selectedIndexes => _selectedButtons;

  /// Disabled buttons indexes
  Set<int> get disabledIndexes => _disabledIndexes;

  /// Select button by index in radio type
  void selectIndex(int i) {
    if (_isDisabled(i, withCallBack: true)) {
      return;
    }
    _selectedButton = i;
    _selectedButtons.add(i);
    notifyListeners();
  }

  /// Unselect button by index in checkbox and radio type
  void unselectIndex(int i) {
    if (_isDisabled(i, withCallBack: true)) {
      return;
    }
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
    final enabledIndexes = _removeDisabledIndexes(indexes);
    for (final i in enabledIndexes) {
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
    final enabledIndexes = _removeDisabledIndexes(indexes);
    _selectedButtons.addAll(enabledIndexes);
    notifyListeners();
  }

  /// Unselect buttons by indexes in checkbox type
  void unselectIndexes(List<int> indexes) {
    final enabledIndexes = _removeDisabledIndexes(indexes);
    _selectedButtons.removeAll(enabledIndexes);
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
