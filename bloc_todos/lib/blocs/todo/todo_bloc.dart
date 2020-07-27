import 'package:bloc_todos/blocs/todo/todo_event.dart';
import 'package:bloc_todos/blocs/todo/todo_repository.dart';
import 'package:bloc_todos/blocs/todo/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoStateLoading());

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is TodoLoadSuccess) {
      final result = await TodoRepository().fetch();
      yield result;
    } else if (event is TodoAdded) {
      final updatedTodos = List.from((state as TodoStateSuccess).items)
        ..add(event.item);
      yield TodoStateSuccess(updatedTodos);
    } else if (event is TodoDeleted) {
      final updatedTodos = (state as TodoStateSuccess).items
        ..removeWhere((e) => e.id == event.item.id)
        ..toList();

      yield TodoStateSuccess(updatedTodos);
    } else if (event is TodoUpdated) {
      final updatedTodos = (state as TodoStateSuccess)
          .items
          .map((e) => e.id == event.item.id ? event.item : e)
          .toList();

      yield TodoStateSuccess(updatedTodos);
    }
  }
}
