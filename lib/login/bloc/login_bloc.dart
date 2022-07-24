import 'package:bloc/bloc.dart';
import 'package:login_register/login/bloc/login_event.dart';
import 'package:login_register/login/bloc/login_state.dart';
import 'package:login_register/repository/user_repositories.dart';
import 'package:login_register/utils/validator.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository userRepository = UserRepository();
  LoginBloc() :super(LoginState.initial());

   @override
  Stream<LoginState> mapEventToState (LoginEvent event) async* {
    if(event is LoginEmailChange) {
      yield* _mapLoginEmailChangeToState(event.email);
    } else if (event is LoginPasswordChanged) {
      yield* _mapLoginPasswordChangetoState(event.password);
    } else if (event is LoginWithCredentialsPressed) {
      yield* _mapLoginWithCredentialsPressedToState(event.email,event.password);
    }
  }

  Stream<LoginState> _mapLoginEmailChangeToState(String email) async*{
    yield state.update(Validators.isValidEmail(email), false);
  }

   Stream<LoginState> _mapLoginPasswordChangetoState(String password) async*{
    yield state.update(Validators.isValidEmail(password), false);
  }

   Stream<LoginState> _mapLoginWithCredentialsPressedToState(String email, String password) async*{
    yield LoginState.loading();
    try {
      await userRepository.signIn(email, password);
      LoginState.success();
    } catch (error) {
      print(error);
      yield LoginState.failure();
    }
   }
}
