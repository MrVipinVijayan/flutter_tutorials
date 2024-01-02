import 'package:flutter/material.dart';
import 'package:flutter_tutorials/model/todo.dart';
import 'package:flutter_tutorials/widgets/todo_list_row.dart';

class ToDoListUI extends StatelessWidget {
  const ToDoListUI({
    super.key,
    required this.toDos,
    required this.onListTap,
  });

  final List<ToDo> toDos;
  final Function(ToDo) onListTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: toDos.length,
      itemBuilder: (_, index) => ToDoListRow(
        toDo: toDos[index],
        onListTap: onListTap,
      ),
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}
