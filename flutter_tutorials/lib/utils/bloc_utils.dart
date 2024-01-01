import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorials/bloc/todo_bloc.dart';
import 'package:flutter_tutorials/bloc/todo_event.dart';

Future<void> refreshToDo(BuildContext context) async {
  BlocProvider.of<ToDoBloc>(context).add(const LoadToDoEvent());
}
