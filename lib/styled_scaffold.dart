import 'package:flutter/material.dart';

class StyledScaffold extends StatelessWidget {
  final Widget child;

  const StyledScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.primary,
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}