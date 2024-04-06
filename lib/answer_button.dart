import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final void Function() selectHandler;
  final String answerText;

  const AnswerButton({
      super.key,
      required this.selectHandler,
      required this.answerText,
    });

  @override
  // Like React components,
  //Flutter widgets have a build method that returns the UI elements to be rendered.
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
      onPressed: selectHandler,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        fixedSize: const Size(300, 60),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(answerText),
      ),
    );
  }
}