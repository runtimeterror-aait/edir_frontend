import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:edir/auth/bloc/user_event.dart';
import 'package:edir/auth/bloc/user_state.dart';
import 'package:edir/auth/models/member.dart';
import 'package:edir/auth/models/user.dart';
import 'package:edir/auth/repository/user_repository.dart';
import 'package:edir/core/models/member.dart';
import 'package:equatable/equatable.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UpdateUser) {
      try {
        yield UserLoading();
        var user = await userRepository.updateUser(event.user);
        yield UserLoaded(user);
      } catch (error) {
        yield UserError(error.toString());
      }
    }

    if (event is LoggedInUserData) {
      try {
        yield UserLoading();
        var user = await userRepository.loggedInUserData();
        yield UserDataLoaded(user);
      } catch (error) {
        yield UserError(error.toString());
      }
    }

    if (event is DeleteUser) {
      try {
        yield UserLoading();
        await userRepository.deleteUser();
        yield UserDeleted();
      } catch (error) {
        yield UserError(error.toString());
      }
    }

    if (event is JoinEdir) {
      try {
        var user = await userRepository.joinEdir(event.member);
        yield JoinEdirLoaded(user);
      } catch (error) {
        print(error);
        yield JoinEdirError();
      }
    }

    if (event is JoinedEdir) {
      try {
        var user = await userRepository.getJoinedEdir();
        yield JoinEdirFetchLoaded(user);
      } catch (error) {
        print(error);
        yield JoinEdirFetchError();
      }
    }
  }
}
