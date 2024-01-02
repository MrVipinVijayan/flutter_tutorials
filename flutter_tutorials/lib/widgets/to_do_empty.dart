import 'package:flutter/material.dart';

class ToDoEmptyUI extends StatelessWidget {
  const ToDoEmptyUI({
    super.key,
    this.message = 'To-Do List Empty\nPlease tap the + button to add one.',
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        textAlign: TextAlign.center,
      ),
    );
  }
}
