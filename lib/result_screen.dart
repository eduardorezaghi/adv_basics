import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:adv_basics/styled_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  final List<String> chosenAnswers;
  final Function onRestartQuiz;

  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestartQuiz,
  });

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summaryData.add({
        'question_index': i,
        'answer': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'chosen_answer': chosenAnswers[i],
      });
    }

    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final correctAnswers = summaryData.where(
      (data) => data['chosen_answer'] == data['correct_answer'])
      .length;

    return StyledScaffold(
      child: SizedBox(
          width: double.infinity,
          child: Container(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
              Text(
                'You correctly answered $correctAnswers out of $totalQuestions questions.',
                style: GoogleFonts.lato(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 20,
                  // italic
                  textStyle: const TextStyle(fontStyle: FontStyle.italic),
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 20),
              // separator, using a line
              Divider(
                color: Theme.of(context).colorScheme.onPrimary,
                thickness: 1,
              ),

              Expanded(
                child: QuestionSummary(
                  summaryData: summaryData,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    onRestartQuiz();
                    Navigator.pushNamed(context, '/quiz-screen');
                  },
                  child: const Text('Restart Quiz'),
                ),
              ),
            ],
          ),
        ),
    ),
    );
  }
}
