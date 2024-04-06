
import 'package:adv_basics/questions_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => 
  _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _SplashScreenState();

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
              Navigator.pushNamed(context, '/quiz-screen');
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

