import 'package:bloc_login/app.dart';
import 'package:bloc_login/blocs/root_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = RootObserver();
  runApp(App());
}
