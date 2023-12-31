import 'package:flutter_tutorials/model/todo.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class ToDoRepo {
  //
  late final Isar _isar;

  Future<void> initDB() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [ToDoSchema],
      directory: dir.path,
    );
  }

  Future<void> saveToDo(ToDo toDo) async {
    await _isar.writeTxn(() async {
      await _isar.toDos.put(toDo);
    });
  }

  Future<void> updateToDo(ToDo toDo) async {
    await _isar.writeTxn(() async {
      await _isar.toDos.put(toDo);
    });
  }

  Future<ToDo?> getToDo(ToDo toDo) async {
    return await _isar.toDos.get(toDo.id);
  }

  Future<List<ToDo>> getToDos() async {
    final isarCollection = _isar.toDos;
    final toDos = await isarCollection.where().sortByCompleted().findAll();
    return toDos;
  }

  Future<void> deleteToDo(ToDo toDo) async {
    await _isar.writeTxn(() async {
      await _isar.toDos.delete(toDo.id);
    });
  }
}
