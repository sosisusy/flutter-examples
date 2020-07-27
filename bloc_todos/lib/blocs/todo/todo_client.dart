import 'dart:convert';

import 'package:bloc_todos/blocs/todo/todo_state.dart';
import 'package:bloc_todos/models/todo/todo_item.dart';
import 'package:http/http.dart' as http;

class TodoClient {
  final String url;
  final http.Client httpClient;

  TodoClient({
    this.url = "https://jsonplaceholder.typicode.com/todos",
    http.Client httpClient,
  }) : this.httpClient = httpClient ?? http.Client();

  Future<List<TodoItem>> fetch() async {
    final response = await httpClient.get(url);
    final results = json.decode(response.body);

    if (response.statusCode == 200) {
      return List.generate(results.length, (i) => TodoItem.fromJson(results[i]))
          .toList();
    } else {
      throw TodoStateError();
    }
  }
}
