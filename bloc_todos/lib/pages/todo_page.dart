import 'package:bloc_todos/blocs/todo/todo_bloc.dart';
import 'package:bloc_todos/blocs/todo/todo_state.dart';
import 'package:bloc_todos/models/todo/todo_item.dart';
import 'package:bloc_todos/widgets/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatefulWidget {
  TodoPage({Key key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  // 리스트 빌드
  Widget _buildList(List<TodoItem> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => TodoTile(
        item: items[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoStateSuccess) {
            return _buildList(state.items);
          } else if (state is TodoStateLoading) {
            return CircularProgressIndicator();
          } else {
            return Container(
              child: Text("Error"),
            );
          }
        },
      ),
    );
  }
}
