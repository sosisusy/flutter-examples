import 'package:bloc_login/blocs/login/login_bloc.dart';
import 'package:bloc_login/blocs/login/login_event.dart';
import 'package:bloc_login/blocs/login/login_state.dart';
import 'package:bloc_login/models/user.dart';
import 'package:bloc_login/widgets/login_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _idController, _passwordController;

  var loginProvider;

  @override
  void initState() {
    super.initState();
    _idController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _idController.dispose();
    _passwordController.dispose();
  }

  Widget _idInput() {
    return LoginTextField(
      controller: _idController,
      prefixIcon: Icons.person,
      labelText: "아이디",
    );
  }

  Widget _passwordInput() {
    return LoginTextField(
      controller: _passwordController,
      prefixIcon: Icons.security,
      labelText: "패스워드",
      obscureText: true,
    );
  }

  // 페이지 빌드
  Widget _buildScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Card(
          child: Container(
            padding: EdgeInsets.all(30),
            width: 350,
            constraints: BoxConstraints(maxHeight: 250),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _idInput(),
                SizedBox(
                  height: 12,
                ),
                _passwordInput(),
                SizedBox(
                  height: 12,
                ),
                RaisedButton(
                  onPressed: () => BlocProvider.of<LoginBloc>(context).add(
                    LoginSubmitEvent(
                      User(
                          id: _idController.text,
                          password: _passwordController.text),
                    ),
                  ),
                  child: Text("Login"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginSuccessState) {
          if (state.success)
            print("로그인 성공");
          else
            print("로그인 실패");
        }
        return _buildScaffold();
      },
    );
  }
}
