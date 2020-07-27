import 'package:bloc_todos/app.dart';
import 'package:bloc_todos/blocs/root_bloc_observer.dart';
import 'package:bloc_todos/blocs/todo/todo_bloc.dart';
import 'package:bloc_todos/blocs/todo/todo_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = RootBlocObserver();
  runApp(
    BlocProvider(
      create: (context) => TodoBloc()..add(TodoLoadSuccess()),
      child: App(),
    ),
  );
}
