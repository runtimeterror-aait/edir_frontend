part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UpdateUser extends UserEvent {
  final User user;
  UpdateUser(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'User Updated Succesfully';
}

class LoggedInUserData extends UserState {
  @override
  List<Object> get props => [];
}

class DeleteUser extends UserState {
  @override
  List<Object> get props => [];
}
