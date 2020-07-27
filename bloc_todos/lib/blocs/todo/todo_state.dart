import 'package:bloc_todos/models/todo/todo_item.dart';
import 'package:equatable/equatable.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoStateLoading extends TodoState {}

class TodoStateSuccess extends TodoState {
  final List<TodoItem> items;

  TodoStateSuccess(this.items);

  @override
  List<Object> get props => [items];

  @override
  String toString() => "TodoStateSuccess {items: ${items.length}}";
}

class TodoStateError extends TodoState {}
