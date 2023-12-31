import 'package:flutter/material.dart';
import 'package:flutter_tutorials/model/todo.dart';

class ToDoListRow extends StatelessWidget {
  const ToDoListRow({
    super.key,
    required this.toDo,
    required this.onListTap,
  });
  final ToDo toDo;
  final Function(ToDo) onListTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.alarm),
      onTap: () => onListTap(toDo),
      title: Text(
        toDo.note ?? '',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: toDo.completed ? Colors.green : Colors.black,
            ),
      ),
    );
  }
}
