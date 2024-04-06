import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/models/questions_blueprint.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<Question> questions = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('The quiz screen will be implemented here!'),
          const SizedBox(height: 20),
          // ElevatedButton(onPressed: () {}, child: Text('Next question')),
          AnswerButton(
            selectHandler: () {},
            answerText: 'Next question',
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}