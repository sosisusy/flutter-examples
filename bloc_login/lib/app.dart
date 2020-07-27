import 'package:bloc_login/blocs/login/login_bloc.dart';
import 'package:bloc_login/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
        child: LoginPage(),
      ),
    );
  }
}
