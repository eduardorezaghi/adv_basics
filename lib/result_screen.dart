import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final List<String> chosenAnswers;

  const ResultScreen({super.key, required this.chosenAnswers});

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
    final answeredQuestions = ModalRoute.of(context)!.settings.arguments as int;
 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $answeredQuestions questions.'),
            Expanded(
              child: QuestionSummary(
                summaryData: getSummaryData(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionSummary({super.key, required this.summaryData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: summaryData.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(summaryData[index]['answer'] as String),
          subtitle: Text('Correct Answer: ${summaryData[index]['correct_answer']}'),
          trailing: Text('Your Answer: ${summaryData[index]['chosen_answer']}'),
        );
      },
    );
  }
}