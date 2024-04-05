import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// The Quiz widget is the root widget of the app.
class Quiz extends StatefulWidget {
  const Quiz({ super.key });

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = activeScreen == 'start-screen' ? 'quiz-screen' : 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple
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
          child: activeScreen == 'start-screen'
              ? SplashScreen(switchScreen)
              : const QuestionScreen(),
          )
      ),
    );
  }
}