import 'package:bloc_login/models/user.dart';
import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginSubmitEvent extends LoginEvent {
  final User user;

  const LoginSubmitEvent(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => "LoginSubmitEvent { user: $user}";
}
