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
          Text('The quiz screen will be implemented here!'),
          SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, child: Text('Next question')),
          Text('The quiz screen will be implemented here!'),
          SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, child: Text('Next question')),
          Text('The quiz screen will be implemented here!'),
          SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, child: Text('Next question')),
        ],
      ),
    );
  }
}