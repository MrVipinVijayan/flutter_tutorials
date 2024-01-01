import 'package:flutter/material.dart';
import 'package:flutter_tutorials/utils/nav_utils.dart';

Future<void> showToast(String message) async {
  ScaffoldMessenger.of(navigatorKey.currentContext!).clearSnackBars();
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
