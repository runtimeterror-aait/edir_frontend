import 'package:edir/auth/models/addMember.dart';
import 'package:edir/auth/models/member.dart';
import 'package:edir/auth/models/user.dart';
import 'package:equatable/equatable.dart';

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

class LoggedInUserData extends UserEvent {
  final User user;
  LoggedInUserData(this.user);
  @override
  List<Object> get props => [];
}

class JoinEdir extends UserEvent {
  final AddMember member;
  JoinEdir(this.member);

  @override
  List<Object> get props => [member];
}

class JoinedEdir extends UserEvent {
  @override
  List<Object> get props => [];
}

class DeleteUser extends UserEvent {
  @override
  List<Object> get props => [];
}
