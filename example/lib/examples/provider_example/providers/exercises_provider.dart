import 'package:example/examples/provider_example/models/models.dart';
import 'package:example/examples/provider_example/models/question.dart';
import 'package:flutter/material.dart';

class ExercisesProvider extends ChangeNotifier {
  var _exercise = Exercise(
    questions: [
      Question(
        'Which numbers less then 3?',
        [true, true, false, false],
        [false, false, false, false],
        ['0', '1', '8', '9'],
      ),
      Question(
        'Which numbers more then 3?',
        [false, false, true, true],
        [false, false, false, false],
        ['1', '-10', '11', '9'],
      ),
    ],
  );
  var _selectedIndex = 0;

  Exercise get exercise => _exercise;
  set exercise(Exercise val) {
    _exercise = val;
    notifyListeners();
  }

  int get selectedIndex => _selectedIndex;
  set selectedIndex(int val) {
    _selectedIndex = val;
    debugPrint('$_selectedIndex');
    notifyListeners();
  }

  void updateAnswer(int index, {required bool value}) {
    _exercise.updateAnswer(_selectedIndex, index, value: value);
    notifyListeners();
  }

  bool checkResult() {
    return _exercise.questions[_selectedIndex].result;
  }
}
