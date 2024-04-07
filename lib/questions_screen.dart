import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/models/questions_blueprint.dart';
import 'package:adv_basics/styled_scaffold.dart';
import 'package:flutter/material.dart';

import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  final Function onSelectAnswer;

  const QuestionScreen({
    super.key,
    required this.onSelectAnswer,
  });

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

  void answerQuestion(
    String selectedAnswer,
  ) {
    setState(() {
      widget.onSelectAnswer(selectedAnswer);
      if (questionIndex >= finalQuestions.length - 1) {
        // Stay on the last question
        questionIndex = finalQuestions.length - 1;
        return;
      } else {
        questionIndex = questionIndex + 1;
      }
    });
  }

  void previousQuestion() {
    setState(() {
      if (questionIndex <= 0) {
        // Stay on the first question
        questionIndex = 0;
        return;
      } else {
        questionIndex = questionIndex - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = finalQuestions[questionIndex];

    return StyledScaffold(
      child: SizedBox(
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
    
    
          ...(questionIndex >= finalQuestions.length - 1
          ? currentQuestion.answers
          : currentQuestion.getShuffledAnswers()).map((answer) {
          return AnswerButton(
          answerText: answer,
          selectHandler: () => answerQuestion(answer),
          );
          }),
    
          ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/result-screen', arguments: questionIndex);
          },
          child: const Text('Submit'),
          ),
          ElevatedButton(
          onPressed: () {
            previousQuestion();
          },
          child: const Text('Previous'),
          ),
        ],
        ),
      ),
      ),
    );
  }
}


