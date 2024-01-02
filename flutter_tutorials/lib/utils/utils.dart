import 'package:flutter/material.dart';
import 'package:flutter_tutorials/utils/nav_utils.dart';

Future<void> showToast(String message) async {
  clearAllSnackbars();
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

void clearAllSnackbars() {
  ScaffoldMessenger.of(navigatorKey.currentContext!).clearSnackBars();
}
