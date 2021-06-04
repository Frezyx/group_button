import 'package:example/examples/provider_example/models/question.dart';

class Exercise {
  const Exercise({
    this.questions,
  });

  final List<Question> questions;

  void updateAnswer(int questionIndex, int index, bool value) =>
      questions[questionIndex].updateAnsver(index, value);

  @override
  String toString() => 'Exercise(questions: $questions)';
}
