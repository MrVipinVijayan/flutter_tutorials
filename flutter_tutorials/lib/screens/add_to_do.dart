import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorials/bloc/todo_bloc.dart';
import 'package:flutter_tutorials/bloc/todo_state.dart';
import 'package:flutter_tutorials/model/todo.dart';
import 'package:flutter_tutorials/utils/bloc_utils.dart';
import 'package:flutter_tutorials/utils/nav_utils.dart';
import 'package:flutter_tutorials/utils/utils.dart';
import 'package:flutter_tutorials/widgets/btn_delete_to_do.dart';
import 'package:flutter_tutorials/widgets/btn_save_update_to_do.dart';

class AddToDoScreen extends StatelessWidget {
  const AddToDoScreen({super.key, this.toDo});

  final ToDo? toDo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: Text(null == toDo ? 'New ToDo' : 'Edit ToDo'),
        actions: [
          BtnSave(toDo: toDo),
          if (null != toDo) BtnDeleteToDo(toDo: toDo!),
        ],
      ),
      body: _addEditUI(),
      // floatingActionButton: BtnComplete(toDo: toDo),
    );
  }

  Widget _addEditUI() {
    return BlocListener<ToDoBloc, ToDoState>(
      listener: blocListenerAction,
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
          return _formUI(context);
        },
      ),
    );
  }

  Widget _formUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Add a note',
            ),
            initialValue: toDo?.note,
            onChanged: (value) {
              if (null == toDo) {
                final newToDo = ToDo();
                newToDo.note = value;
                setToDo(context, newToDo);
                return;
              }
              toDo?.note = value;
              setToDo(context, toDo!);
            },
          ),
        ],
      ),
    );
  }

  Future<void> blocListenerAction(BuildContext context, ToDoState state) async {
    if (state is ToDoAddState) {
      if (state.success) {
        unawaited(showToast('To-Do saved successfully.'));
        closeScreen();
        refreshToDo(context);
        return;
      }
      unawaited(showToast('Error saving To-Do.'));
      return;
    }
    if (state is ToDoDeleteState) {
      if (state.success) {
        unawaited(showToast('To-Do deleted successfully.'));
        closeScreen();
        refreshToDo(context);
        return;
      }
      unawaited(showToast('Error deleting To-Do.'));
      return;
    }
    if (state is ToDoUpdateState) {
      if (state.success) {
        unawaited(showToast('To-Do updated successfully.'));
        closeScreen();
        refreshToDo(context);
        return;
      }
      unawaited(showToast('Error updating To-Do.'));
    }
  }
}
