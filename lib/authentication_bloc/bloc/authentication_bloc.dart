import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_register/authentication_bloc/bloc/authentication_event.dart';
import 'package:login_register/authentication_bloc/bloc/authentication_state.dart';
import 'package:login_register/repository/user_repositories.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserRepository? userRepository;
  AuthBloc({this.userRepository}) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppLoaded) {
      try {
        var isSignedIn = await userRepository?.isSignedIn();

        if (isSignedIn!) {
          var user = await userRepository?.getCurrentUser();

          yield AuthenticateState(user: user!);
        } else {
          yield UnAuthenticateState();
        }
      } catch (e) {
        yield UnAuthenticateState();
      }
    }
  }
}