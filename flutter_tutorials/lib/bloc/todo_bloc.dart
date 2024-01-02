import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorials/bloc/todo_event.dart';
import 'package:flutter_tutorials/bloc/todo_state.dart';
import 'package:flutter_tutorials/repo/todo_repo.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final ToDoRepo _toDoRepo;

  ToDoBloc(this._toDoRepo) : super(ToDoInitState()) {
    on<InitializeEvent>(init);
    on<AddToDoEvent>(addToDo);
    on<UpdateToDoEvent>(updateToDo);
    on<DeleteToDoEvent>(deleteToDo);
    on<LoadToDoEvent>(loadToDos);
    on<SetToDoNoteEvent>(setToDo);
  }

  Future<void> setToDo(SetToDoNoteEvent event, emit) async {
    emit(ToDoCurrentState(event.toDo));
  }

  Future<void> init(event, emit) async {
    await _toDoRepo.initDB();
    emit(const Initialized());
  }

  Future<void> addToDo(AddToDoEvent event, emit) async {
    emit(const ToDoAddInProgressState());
    try {
      await _toDoRepo.saveToDo(event.toDo);
      // await Future.delayed(const Duration(seconds: 3));
      emit(const ToDoAddState(true));
    } catch (e) {
      emit(const ToDoAddState(false));
    }
  }

  Future<void> updateToDo(UpdateToDoEvent event, emit) async {
    emit(const ToDoUpdateInProgressState());
    try {
      await _toDoRepo.updateToDo(event.toDo);
      emit(const ToDoUpdateState(true));
    } catch (e) {
      emit(const ToDoUpdateState(false));
    }
  }

  Future<void> deleteToDo(DeleteToDoEvent event, emit) async {
    emit(const ToDoDeleteInProgressState());
    await _toDoRepo.deleteToDo(event.toDo);
    emit(const ToDoDeleteState(true));
  }

  FutureOr<void> loadToDos(event, emit) async {
    emit(const ToDoLoadingState());
    try {
      final toDos = await _toDoRepo.getToDos();
      emit(ToDoLoadedState(toDos));
    } catch (e) {
      emit(ToDoErrorState(e.toString()));
    }
  }
}
