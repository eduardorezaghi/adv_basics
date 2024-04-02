import 'package:adv_basics/questions.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final void Function() startQuiz;

  const SplashScreen( this.startQuiz, {super.key});

  @override
  State<SplashScreen> createState() => 
  // ignore: no_logic_in_create_state
  _SplashScreenState(startQuiz);
}

class _SplashScreenState extends State<SplashScreen> {
  final void Function() startQuiz;

  _SplashScreenState(this.startQuiz);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
          const Image(
            image: AssetImage('assets/images/quiz-logo.png'),
            width: 200,
            // Transparent background
            color: Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 20),
          Text(
            'Learn Flutter the easy way!',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: () {
              // Navigate to the quiz screen
              startQuiz();
            },
            style: OutlinedButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
              foregroundColor: Theme.of(context).colorScheme.onSecondary,
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Go to quiz'),
          ),
        ]));
  }
}

