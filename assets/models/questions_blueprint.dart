class Question {
  final String question;
  final List<String> answers;
  final int correct;

  Question({
    required this.question,
    required this.answers,
    required this.correct,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'],
      answers: json['answers'].cast<String>(),
      correct: json['correct'],
    );
  }
}