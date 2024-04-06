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
    return ElevatedButton(
      onPressed: selectHandler,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(answerText),
    );
  }
}