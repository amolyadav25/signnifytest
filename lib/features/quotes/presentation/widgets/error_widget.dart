import 'package:flutter/material.dart';

class ErrorWidgets extends StatelessWidget {
  const ErrorWidgets({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onBackground,
      ),
    );
  }
}
