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

class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);
  @override
  List<Object> get props => [message];
}
