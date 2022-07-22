import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticatonStarted extends AuthenticationEvent {}

class AuthenticatonLoggedIn extends AuthenticationEvent {}

class AuthenticatonLoggedOut extends AuthenticationEvent {}
