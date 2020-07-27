import 'package:bloc_todos/models/todo/todo_item.dart';
import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

// 로드
class TodoLoadSuccess extends TodoEvent {}

// 추가
class TodoAdded extends TodoEvent {
  final TodoItem item;
  TodoAdded(this.item);

  @override
  List<Object> get props => [item];

  @override
  String toString() =>
      "TodoAdded { id: ${item.id}, title: ${item.title}, completed: ${item.completed}}";
}

// 삭제
class TodoDeleted extends TodoEvent {
  final TodoItem item;
  TodoDeleted(this.item);

  @override
  List<Object> get props => [item];

  @override
  String toString() =>
      "TodoDeleted { id: ${item.id}, title: ${item.title}, completed: ${item.completed}}";
}

// 업데이트
class TodoUpdated extends TodoEvent {
  final TodoItem item;
  TodoUpdated(this.item);

  @override
  List<Object> get props => [item];

  @override
  String toString() =>
      "TodoUpdated { id: ${item.id}, title: ${item.title}, completed: ${item.completed}}";
}
