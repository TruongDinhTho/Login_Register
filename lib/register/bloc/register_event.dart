import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}
  
class SignUpButtonPressed extends RegisterEvent {
  String email, password;
  SignUpButtonPressed({required this.email, required this.password});
}