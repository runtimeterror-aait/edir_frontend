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

    if (event is LogIn) {
      try {
        var login = await authRepository.logIn(event.email, event.password);
        yield LoginLoaded(login);
      } catch (error) {
        yield AuthError("Invalid credentials");
      }
    }

    if (event is GetLoggedInUser) {
      try {
        var loggedInUser = await authRepository.loggedInUser();
        yield LoggedInUser(loggedInUser);
      } catch (error) {
        print(error);
        yield NotLoggedInUser();
      }
    }

    if (event is LogOut) {
      try {
        await authRepository.logOut();
        yield LogoutSucess();
      } catch (error) {
        yield LogoutError(error.toString());
      }
    }
  }
}
