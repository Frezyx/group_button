import 'package:flutter/material.dart';

class CustomizableExampleController extends ChangeNotifier {
  var _buttonsCount = 25;

  int get buttonsCount => _buttonsCount;
  set buttonsCount(int count) {
    _buttonsCount = count;
    notifyListeners();
  }

  List<int> get buttons => List.generate(_buttonsCount, (index) => index);
}
