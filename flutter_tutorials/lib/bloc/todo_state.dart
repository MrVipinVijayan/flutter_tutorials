import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorials/model/todo.dart';

@immutable
abstract class ToDoState extends Equatable {
  const ToDoState();
}

class ToDoInitState extends ToDoState {
  @override
  List<Object?> get props => [];
}

class Initialized extends ToDoState {
  const Initialized();
  @override
  List<Object?> get props => [];
}

class ToDoCurrentState extends ToDoState {
  const ToDoCurrentState(this.toDo);
  final ToDo toDo;
  @override
  List<Object?> get props => [toDo];
}

class ToDoLoadingState extends ToDoState {
  const ToDoLoadingState();
  @override
  List<Object?> get props => [];
}

class ToDoLoadedState extends ToDoState {
  final List<ToDo> toDos;
  const ToDoLoadedState(this.toDos);
  @override
  List<Object?> get props => [toDos];
}

class ToDoErrorState extends ToDoState {
  final String error;
  const ToDoErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

class ToDoAddInProgressState extends ToDoState {
  const ToDoAddInProgressState();
  @override
  List<Object?> get props => [];
}

class ToDoAddState extends ToDoState {
  final bool success;
  const ToDoAddState(this.success);
  @override
  List<Object?> get props => [success];
}

class ToDoUpdateInProgressState extends ToDoState {
  const ToDoUpdateInProgressState();
  @override
  List<Object?> get props => [];
}

class ToDoUpdateState extends ToDoState {
  final bool success;
  const ToDoUpdateState(this.success);
  @override
  List<Object?> get props => [];
}

class ToDoDeleteInProgressState extends ToDoState {
  const ToDoDeleteInProgressState();
  @override
  List<Object?> get props => [];
}

class ToDoDeleteState extends ToDoState {
  final bool success;
  const ToDoDeleteState(this.success);
  @override
  List<Object?> get props => [success];
}
