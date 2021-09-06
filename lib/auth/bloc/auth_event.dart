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
