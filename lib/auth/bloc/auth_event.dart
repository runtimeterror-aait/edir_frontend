import 'package:edir/auth/models/login.dart';
import 'package:edir/auth/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class SignUp extends AuthEvent {
  final User user;

  const SignUp(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'User Created {course: $user}';
}

class LogIn extends AuthEvent {
  final String email;
  final String password;
  LogIn(this.email, this.password);

  @override
  List<Object> get props => [email, password];

  @override
  String toString() => 'Logged in successfully';
}

class GetLoggedInUser extends AuthEvent {
  @override
  List<Object> get props => [];
}
