import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorials/bloc/todo_bloc.dart';
import 'package:flutter_tutorials/bloc/todo_event.dart';
import 'package:flutter_tutorials/bloc/todo_state.dart';
import 'package:flutter_tutorials/model/todo.dart';
import 'package:flutter_tutorials/utils/nav_utils.dart';
import 'package:flutter_tutorials/utils/utils.dart';

class AddToDoScreen extends StatelessWidget {
  const AddToDoScreen({super.key, this.toDo});

  final ToDo? toDo;

  @override
  Widget build(BuildContext context) {
    final toDoBloc = BlocProvider.of<ToDoBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(null == toDo ? 'New ToDo' : 'Edit ToDo'),
        actions: [
          _saveActionBtn(toDoBloc),
        ],
      ),
      body: BlocListener<ToDoBloc, ToDoState>(
        listener: (context, state) => blocListenerAction,
        child: _addEditUI(toDoBloc),
      ),
      floatingActionButton: _completeBtn(toDoBloc),
    );
  }

  Widget _addEditUI(ToDoBloc toDoBloc) {
    return BlocListener<ToDoBloc, ToDoState>(
      listener: (context, state) => blocListenerAction(context, state),
      child: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state) {
          if (state is ToDoAddInProgressState) {
            return const Center(child: Text('Saving ToDo...'));
          }
          if (state is ToDoUpdateInProgressState) {
            return const Center(child: Text('Updating ToDo...'));
          }
          if (state is ToDoDeleteInProgressState) {
            return const Center(child: Text('Deleting ToDo...'));
          }
          return _formUI(context, toDoBloc);
        },
      ),
    );
  }

  Widget _saveActionBtn(ToDoBloc toDoBloc) {
    return BlocBuilder<ToDoBloc, ToDoState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () async {
            if (null != toDo) {
              if (toDo?.note == null || toDo!.note!.isEmpty) {
                showToast('Please enter a note');
                return;
              }
              toDoBloc.add(UpdateToDoEvent(toDo!));
              return;
            }
            if (state is ToDoCurrentState) {
              if (state.toDo.note == null || state.toDo.note!.isEmpty) {
                showToast('Please enter a note');
                return;
              }
              toDoBloc.add(AddToDoEvent(state.toDo));
            }
          },
          icon: Icon(null == toDo ? Icons.add : Icons.update),
        );
      },
    );
  }

  Widget _completeBtn(ToDoBloc toDoBloc) {
    if (toDo?.completed ?? true) {
      return const SizedBox.shrink();
    }
    return BlocBuilder<ToDoBloc, ToDoState>(
      builder: (context, state) {
        return FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () async {
            if (null != toDo) {
              toDo?.completed = true;
              toDoBloc.add(UpdateToDoEvent(toDo!));
              return;
            }
          },
          child: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        );
      },
    );
  }

  Widget _formUI(BuildContext context, ToDoBloc toDoBloc) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          TextFormField(
            initialValue: toDo?.note,
            onChanged: (value) {
              print(value);

              if (null == toDo) {
                final newToDo = ToDo();
                newToDo.note = value;
                toDoBloc.add(SetToDoNoteEvent(newToDo));
                return;
              }
              toDo?.note = value;
              toDoBloc.add(SetToDoNoteEvent(toDo!));
            },
          ),
        ],
      ),
    );
  }

  Future<void> _refreshToDo(BuildContext context) async {
    context.read<ToDoBloc>().add(const LoadToDoEvent());
  }

  Future<void> blocListenerAction(BuildContext context, ToDoState state) async {
    if (state is ToDoAddState) {
      if (state.success) {
        closeScreen();
        _refreshToDo(context);
        return;
      }
    }
    if (state is ToDoDeleteState) {
      if (state.success) {
        closeScreen();
        _refreshToDo(context);
        return;
      }
    }
    if (state is ToDoUpdateState) {
      if (state.success) {
        closeScreen();
        _refreshToDo(context);
        return;
      }
    }
  }
}
