import 'package:bloc/bloc.dart';
import 'package:login_register/register/bloc/register_event.dart';
import 'package:login_register/register/bloc/register_state.dart';
import 'package:login_register/repository/user_repositories.dart';
import 'package:login_register/utils/validator.dart';



class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  
  RegisterBloc() : super(RegisterState.initial());

  UserRepository userRepository = UserRepository();

   @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterEmailChanged) {
      yield* _mapRegisterEmailChangeToState(event.email);
    } else if (event is RegisterPasswordChanged) {
      yield* _mapRegisterPasswordChangeToState(event.password);
    } else if (event is RegisterSubmitted) {
      yield* _mapRegisterSubmittedToState(event.email, event.password);
    }
  }

  Stream<RegisterState> _mapRegisterEmailChangeToState(String email) async*{
    yield state.update(isEmailValid: Validators.isValidEmail(email));
  }

  Stream<RegisterState> _mapRegisterPasswordChangeToState(String password) async*{
    yield state.update(isPasswordValid: Validators.isValidPassword(password));
  }

  Stream<RegisterState> _mapRegisterSubmittedToState(String email, String password) async*{
    yield RegisterState.loading();
    try {
      await userRepository.signUp(email, password);
      yield RegisterState.success();
    } catch (error) {
      print(error);
      yield RegisterState.failure();
    }
  }
}
