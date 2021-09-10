import 'package:edir/auth/bloc/auth_event.dart';
import 'package:edir/auth/models/login.dart';
import 'package:edir/auth/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  const AuthLoading();
  @override
  List<Object> get props => [];
}

class AuthLoaded extends AuthState {
  final User userModel;
  const AuthLoaded(this.userModel);
  @override
  List<Object> get props => [userModel];
}

class LoginLoaded extends AuthState {
  final Login login;
  const LoginLoaded(this.login);

  @override
  List<Object> get props => [login];
}

class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);
  @override
  List<Object> get props => [message];

  @override
  String toString() => "error: " + message;
}

class LoggedInUser extends AuthState {
  final Login login;
  const LoggedInUser(this.login);
  @override
  List<Object> get props => [login];
}

class NotLoggedInUser extends AuthState {
  const NotLoggedInUser();
  @override
  List<Object> get props => [];

  @override
  String toString() => "not logged in";
}

class LogoutSucess extends AuthState {
  @override
  List<Object> get props => [];

  @override
  String toString() => "logged out";
}

class LogoutError extends AuthState {
  final String msg;

  LogoutError(this.msg);
  @override
  List<Object> get props => [msg];

  @override
  String toString() => msg;
}
