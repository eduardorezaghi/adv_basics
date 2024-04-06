import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/models/questions_blueprint.dart';
import 'package:flutter/material.dart';

import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var questionIndex = 0;

  final List<Question> finalQuestions = questions;

  @override
  void initState() {
    super.initState();
  }

  void answerQuestion() {
    setState(() {
      questionIndex < finalQuestions.length - 1
          ? questionIndex++
          : questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = finalQuestions[questionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),


            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                selectHandler: answerQuestion,
                answerText: answer,
              );
            }),
          ],
        ),
      ),
    );
  }
}