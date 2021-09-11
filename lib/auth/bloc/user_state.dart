import 'package:edir/auth/models/addMember.dart';
import 'package:edir/auth/models/member.dart';
import 'package:edir/auth/models/user.dart';
import 'package:equatable/equatable.dart';

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

class UserDataLoaded extends UserState {
  final User userModel;
  const UserDataLoaded(this.userModel);
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

class JoinEdirLoaded extends UserState {
  final AddMember member;
  const JoinEdirLoaded(this.member);
  @override
  List<Object> get props => [member];
}

class JoinEdirError extends UserState {
  const JoinEdirError();
}

class JoinEdirFetchLoaded extends UserState {
  final Member member;
  const JoinEdirFetchLoaded(this.member);
  @override
  List<Object> get props => [member];
}

class JoinEdirFetchError extends UserState {
  const JoinEdirFetchError();
}
