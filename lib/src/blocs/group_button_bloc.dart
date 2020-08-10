import 'package:flutter/cupertino.dart';

class GroupButtonBloc extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int val) {
    _selectedIndex = val;
    notifyListeners();
  }

  void selectButton(int index) {
    _selectedIndex = index;
  }
}
