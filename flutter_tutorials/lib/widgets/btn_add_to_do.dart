import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorials/bloc/todo_bloc.dart';
import 'package:flutter_tutorials/bloc/todo_state.dart';
import 'package:flutter_tutorials/model/todo.dart';
import 'package:flutter_tutorials/utils/bloc_utils.dart';
import 'package:flutter_tutorials/utils/nav_utils.dart';
import 'package:flutter_tutorials/utils/utils.dart';

class BtnAddToDo extends StatelessWidget {
  const BtnAddToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoBloc, ToDoState>(
      builder: (context, state) {
        if (state is ToDoDeleteInProgressState) {
          return const CircularProgressIndicator();
        }
        return IconButton(
          onPressed: () async {
            clearAllSnackbars();
            setToDo(context, ToDo());
            unawaited(openAddToDoScreen());
          },
          icon: const Icon(Icons.add),
        );
      },
    );
  }
}
