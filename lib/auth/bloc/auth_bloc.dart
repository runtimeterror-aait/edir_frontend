import 'package:edir/auth/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthLoading());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is SignUp) {
      try {
        await authRepository.signUp(event.user);
        yield AuthLoaded(event.user);
      } catch (_) {
        yield AuthError("Error creating user");
      }
    }
  }
}
