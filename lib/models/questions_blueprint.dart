/// Question Data Model
class Question {
  final String question;
  final List<String> answers;
  final int correct;

  Question({
    required this.question,
    required this.answers,
    required this.correct,
  });

  /// Shuffles the answers list
  List<String> getShuffledAnswers() {
    return List<String>.from(answers)..shuffle();
  }

}
