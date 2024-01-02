import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorials/bloc/todo_bloc.dart';
import 'package:flutter_tutorials/bloc/todo_event.dart';
import 'package:flutter_tutorials/model/todo.dart';

Future<void> refreshToDo(BuildContext context) async {
  BlocProvider.of<ToDoBloc>(context).add(const LoadToDoEvent());
}

Future<void> deleteToDo(BuildContext context, ToDo toDo) async {
  context.read<ToDoBloc>().add(DeleteToDoEvent(toDo));
}

Future<void> updateToDo(BuildContext context, ToDo toDo) async {
  context.read<ToDoBloc>().add(UpdateToDoEvent(toDo));
}

Future<void> addToDo(BuildContext context, ToDo toDo) async {
  context.read<ToDoBloc>().add(AddToDoEvent(toDo));
}

Future<void> setToDo(BuildContext context, ToDo toDo) async {
  context.read<ToDoBloc>().add(SetToDoNoteEvent(toDo));
}
