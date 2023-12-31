import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorials/model/todo.dart';

@immutable
abstract class ToDoEvent extends Equatable {
  const ToDoEvent();
}

class InitializeEvent extends ToDoEvent {
  @override
  List<Object?> get props => [];
}

class SetToDoNoteEvent extends ToDoEvent {
  const SetToDoNoteEvent(this.toDo);
  final ToDo toDo;
  @override
  List<Object?> get props => [toDo];
}

class LoadToDoEvent extends ToDoEvent {
  const LoadToDoEvent();
  @override
  List<Object?> get props => [];
}

class AddToDoEvent extends ToDoEvent {
  final ToDo toDo;
  const AddToDoEvent(this.toDo);
  @override
  List<Object?> get props => [];
}

class UpdateToDoEvent extends ToDoEvent {
  final ToDo toDo;
  const UpdateToDoEvent(this.toDo);
  @override
  List<Object?> get props => [];
}

class DeleteToDoEvent extends ToDoEvent {
  final ToDo toDo;
  const DeleteToDoEvent(this.toDo);
  @override
  List<Object?> get props => [];
}

class DeleteToDoInProgressEvent extends ToDoEvent {
  const DeleteToDoInProgressEvent();
  @override
  List<Object?> get props => [];
}
