import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/result_screen.dart';
import 'package:adv_basics/splash_screen.dart';
import 'package:flutter/material.dart';

/// The Quiz widget is the root widget of the app.
class Quiz extends StatefulWidget {
  const Quiz({ super.key });

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    setState(() {
      if (selectedAnswers.length == questions.length) {
        selectedAnswers = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
            ),
          ),
          child: const Center(child: SplashScreen()),
        ),
      ),
      routes: {
        '/start-screen': (BuildContext context) => const SplashScreen(),
        '/quiz-screen': (BuildContext context) =>   QuestionScreen(onSelectAnswer: chooseAnswer),
        '/result-screen': (BuildContext context) => ResultScreen(chosenAnswers: selectedAnswers),
      },
    );
  }
}
