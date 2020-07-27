import 'package:bloc_todos/blocs/todo/todo_client.dart';
import 'package:bloc_todos/blocs/todo/todo_state.dart';

class TodoRepository {
  const TodoRepository();

  Future<TodoState> fetch() async {
    try {
      final results = await TodoClient().fetch();

      return TodoStateSuccess(results);
    } catch (_) {
      return TodoStateError();
    }
  }
}
