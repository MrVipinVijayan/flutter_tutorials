import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorials/bloc/todo_bloc.dart';
import 'package:flutter_tutorials/bloc/todo_event.dart';
import 'package:flutter_tutorials/bloc/todo_state.dart';
import 'package:flutter_tutorials/model/todo.dart';

class BtnComplete extends StatelessWidget {
  const BtnComplete({super.key, this.toDo});

  final ToDo? toDo;

  @override
  Widget build(BuildContext context) {
    if (toDo?.completed ?? false) {
      return const SizedBox.shrink();
    }
    return BlocBuilder<ToDoBloc, ToDoState>(
      builder: (context, state) => FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () async {
          if (null != toDo) {
            toDo?.completed = true;
            context.read<ToDoBloc>().add(UpdateToDoEvent(toDo!));
            return;
          }
        },
        child: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }
}
