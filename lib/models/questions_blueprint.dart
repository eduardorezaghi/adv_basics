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
}
