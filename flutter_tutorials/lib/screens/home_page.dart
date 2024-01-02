import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorials/bloc/todo_bloc.dart';
import 'package:flutter_tutorials/bloc/todo_state.dart';
import 'package:flutter_tutorials/model/todo.dart';
import 'package:flutter_tutorials/utils/bloc_utils.dart';
import 'package:flutter_tutorials/utils/nav_utils.dart';
import 'package:flutter_tutorials/utils/utils.dart';
import 'package:flutter_tutorials/widgets/to_do_empty.dart';
import 'package:flutter_tutorials/widgets/to_do_error_ui.dart';
import 'package:flutter_tutorials/widgets/to_do_loading.dart';
import 'package:flutter_tutorials/widgets/todo_list_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
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
              if (state.toDos.isEmpty) {
                return const ToDoEmptyUI();
              }
              return ToDoListUI(
                toDos: state.toDos,
                onListTap: (toDo) async {
                  clearAllSnackbars();
                  setToDo(context, toDo);
                  unawaited(openAddToDoScreen(toDo: toDo));
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
      refreshToDo(context);
      return;
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
