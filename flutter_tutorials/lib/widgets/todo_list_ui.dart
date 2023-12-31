import 'package:flutter/material.dart';
import 'package:flutter_tutorials/model/todo.dart';
import 'package:flutter_tutorials/widgets/todo_list_row.dart';

class ToDoListUI extends StatelessWidget {
  const ToDoListUI({
    super.key,
    required this.toDos,
    required this.onListTap,
    required this.onToDoDelete,
  });

  final List<ToDo> toDos;
  final Function(ToDo) onListTap;
  final Function(ToDo) onToDoDelete;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: toDos.length,
      itemBuilder: (_, index) {
        final toDo = toDos[index];
        return Dismissible(
          key: Key(toDo.id.toString()),
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          onDismissed: (direction) {
            onToDoDelete(toDo);
          },
          child: ToDoListRow(toDo: toDo, onListTap: onListTap),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
