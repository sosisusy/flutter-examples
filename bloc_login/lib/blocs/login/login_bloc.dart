import 'package:bloc_login/blocs/login/login_event.dart';
import 'package:bloc_login/blocs/login/login_state.dart';
import 'package:bloc_login/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginLoadedState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginSubmitEvent) yield* _loginSubmitToState(event.user);
  }

  // 로그인 시도
  Stream<LoginState> _loginSubmitToState(User user) async* {
    try {
      if (user.id == "test" && user.password == "1234") {
        yield LoginSuccessState(true);
      } else {
        yield LoginSuccessState(false);
      }
    } catch (_) {
      yield LoginFailureState();
    }
  }
}
