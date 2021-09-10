part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {
  const UserLoading();
}

class UserLoaded extends UserState {
  final User userModel;
  const UserLoaded(this.userModel);
  @override
  List<Object> get props => [userModel];
}

class UserError extends UserState {
  final String message;
  const UserError(this.message);
  @override
  List<Object> get props => [message];

  @override
  String toString() => "error: " + message;
}

class UserDeleted extends UserState {
  const UserDeleted();
}
