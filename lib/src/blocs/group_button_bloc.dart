import 'package:flutter/cupertino.dart';

class GroupButtonBloc extends ChangeNotifier {
  int _selectedIndex = 0;

  final Map<int, bool> _selectedIndexes = {};

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int val) {
    _selectedIndex = val;
    notifyListeners();
  }

  Map<int, bool> get selectedIndexes => _selectedIndexes;

  // ignore: avoid_positional_boolean_parameters
  void selectButton(int index, bool isRadio) {
    if (isRadio) {
      _selectedIndex = index;
    } else {
      if (!_selectedIndexes.containsKey(index)) {
        _selectedIndexes[index] = true;
      } else {
        _selectedIndexes[index] = !_selectedIndexes[index]!;
      }
    }
    notifyListeners();
  }

  bool _initializedSelection = false;

  void initializeSelection(
      List<String> buttons, List<String>? selectedButtons) {
    if (_initializedSelection) return;
    _initializedSelection = true;
    if (selectedButtons == null) return;

    for (var i = 0; i < buttons.length; i++) {
      if (selectedButtons.contains(buttons[i])) {
        _selectedIndexes[i] = true;
        _selectedIndex = i;
      }
    }
  }
}
