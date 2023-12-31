import 'package:flutter/material.dart';

class ToDoErrorUI extends StatelessWidget {
  const ToDoErrorUI({super.key, this.message = ''});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
