import 'package:isar/isar.dart';

part 'todo.g.dart';

@collection
class ToDo {
  Id id = Isar.autoIncrement;
  String? note;
  bool completed = false;
}
