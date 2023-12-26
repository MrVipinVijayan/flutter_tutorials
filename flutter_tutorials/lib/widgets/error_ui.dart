import 'package:flutter/material.dart';

class UserErrorUI extends StatelessWidget {
  const UserErrorUI({super.key, this.message = ''});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
