import 'package:flutter/material.dart';

class ErrorWidgets extends StatelessWidget {
  final String errorMessage;

  const ErrorWidgets({Key? key, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
