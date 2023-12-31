import 'package:flutter/material.dart';
import 'package:flutter_tutorials/model/todo.dart';
import 'package:flutter_tutorials/screens/add_to_do.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> openAddToDoScreen({ToDo? toDo}) async {
  Navigator.of(navigatorKey.currentContext!).push(
    MaterialPageRoute(
      builder: (context) => AddToDoScreen(toDo: toDo),
    ),
  );
}

Future<void> closeScreen() async {
  Navigator.pop(navigatorKey.currentContext!);
}
