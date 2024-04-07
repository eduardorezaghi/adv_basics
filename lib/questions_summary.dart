import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionSummary({super.key, required this.summaryData});

  Color _getBackgroundColor(String chosenAnswer, String correctAnswer) {
    if (chosenAnswer == correctAnswer) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  Color _getAnswerTextColor(String chosenAnswer, String correctAnswer) {
    if (chosenAnswer == correctAnswer) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  Color _getCorrectAnswerTextColor(String chosenAnswer, String correctAnswer) {
    if (chosenAnswer == correctAnswer) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: summaryData
          .map(
            (data) => Card(
              color: _getBackgroundColor(
                data['chosen_answer'] as String,
                data['correct_answer'] as String,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('${(data['question_index'] as int) + 1}'),
                ),
                title: Text(
                  data['answer'] as String,
                  style: TextStyle(
                    color: _getAnswerTextColor(
                      data['chosen_answer'] as String,
                      data['correct_answer'] as String,
                    ),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'You chose: ${data['chosen_answer']}',
                      // italic
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                    Text(
                      'Correct Answer: ${data['correct_answer']}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _getCorrectAnswerTextColor(
                          data['chosen_answer'] as String,
                          data['correct_answer'] as String,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
