import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorials/bloc/todo_bloc.dart';
import 'package:flutter_tutorials/bloc/todo_event.dart';
import 'package:flutter_tutorials/bloc/todo_state.dart';
import 'package:flutter_tutorials/model/todo.dart';
import 'package:flutter_tutorials/utils/utils.dart';

class BtnSave extends StatelessWidget {
  const BtnSave({super.key, this.toDo});

  final ToDo? toDo;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoBloc, ToDoState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () => _addOrUpdateToDo(context, state),
          icon: Icon(null == toDo ? Icons.add : Icons.update),
        );
      },
    );
  }

  Future<void> _addOrUpdateToDo(BuildContext context, ToDoState state) async {
    if (null != toDo) {
      if (toDo?.note == null || toDo!.note!.isEmpty) {
        unawaited(showToast('Please enter a note'));
        return;
      }
      context.read<ToDoBloc>().add(UpdateToDoEvent(toDo!));
      return;
    }
    if (state is ToDoCurrentState) {
      if (state.toDo.note == null || state.toDo.note!.isEmpty) {
        unawaited(showToast('Please enter a note'));
        return;
      }
      context.read<ToDoBloc>().add(AddToDoEvent(state.toDo));
      return;
    }
  }
}
