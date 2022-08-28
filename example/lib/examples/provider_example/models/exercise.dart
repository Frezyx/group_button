import 'package:example/examples/provider_example/models/question.dart';

class Exercise {
  const Exercise({required this.questions});

  final List<Question> questions;

  void updateAnswer(int questionIndex, int index, {required bool value}) =>
      questions[questionIndex].updateAnswer(index, value: value);

  @override
  String toString() => 'Exercise(questions: $questions)';
}
