import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorials/bloc/todo_bloc.dart';
import 'package:flutter_tutorials/bloc/todo_event.dart';
import 'package:flutter_tutorials/bloc/todo_state.dart';
import 'package:flutter_tutorials/model/todo.dart';
import 'package:flutter_tutorials/utils/nav_utils.dart';
import 'package:flutter_tutorials/widgets/to_do_error_ui.dart';
import 'package:flutter_tutorials/widgets/to_do_loading.dart';
import 'package:flutter_tutorials/widgets/todo_list_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo List'),
        actions: [
          _addToDoBtn(),
        ],
      ),
      body: BlocListener<ToDoBloc, ToDoState>(
        listener: toDoBlocListener,
        child: BlocBuilder<ToDoBloc, ToDoState>(
          buildWhen: (previous, current) => previous is! ToDoLoadedState,
          builder: (context, state) {
            if (state is Initialized) {
              return const Text('Initialized...');
            }
            if (state is ToDoLoadingState) {
              return const LoadingUI();
            }
            if (state is ToDoLoadedState) {
              return ToDoListUI(
                toDos: state.toDos,
                onListTap: (toDo) {
                  context.read<ToDoBloc>().add(SetToDoNoteEvent(toDo));
                  unawaited(openAddToDoScreen(toDo: toDo));
                },
                onToDoDelete: (toDo) {
                  context.read<ToDoBloc>().add(DeleteToDoEvent(toDo));
                },
              );
            }
            if (state is ToDoErrorState) {
              return ToDoErrorUI(message: state.error);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Future<void> toDoBlocListener(BuildContext context, ToDoState state) async {
    if (state is Initialized) {
      context.read<ToDoBloc>().add(const LoadToDoEvent());
      return;
    }
    if (state is ToDoDeleteState) {
      if (state.success) {
        context.read<ToDoBloc>().add(const LoadToDoEvent());
        return;
      }
    }
  }

  Widget _addToDoBtn() {
    return BlocBuilder<ToDoBloc, ToDoState>(
      builder: (context, state) {
        if (state is ToDoDeleteInProgressState) {
          return const CircularProgressIndicator();
        }
        return IconButton(
          onPressed: () async {
            context.read<ToDoBloc>().add(SetToDoNoteEvent(ToDo()));
            unawaited(openAddToDoScreen());
          },
          icon: const Icon(Icons.add),
        );
      },
    );
  }
}
