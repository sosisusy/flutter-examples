import 'package:bloc_todos/blocs/todo/todo_bloc.dart';
import 'package:bloc_todos/blocs/todo/todo_event.dart';
import 'package:bloc_todos/models/todo/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoTile extends StatelessWidget {
  final TodoItem item;

  TodoTile({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoProvider = BlocProvider.of<TodoBloc>(context);

    return ListTile(
      key: ValueKey(item),
      title: Text(
        item.title,
        style: TextStyle(
          decoration: item.completed ? TextDecoration.lineThrough : null,
        ),
      ),
      onTap: () {
        todoProvider.add(
          TodoUpdated(item.copuWith(completed: !item.completed)),
        );
      },
    );
  }
}
