import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

// 로딩
class LoginLoadedState extends LoginState {}

// 성공
class LoginSuccessState extends LoginState {
  final bool success;
  LoginSuccessState(this.success);

  @override
  List<Object> get props => [success];

  @override
  String toString() => "LoginSuccessState {success: $success}";
}

// 실패
class LoginFailureState extends LoginState {}
