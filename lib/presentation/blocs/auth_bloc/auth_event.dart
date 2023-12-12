part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent({required this.email, required this.password});
}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;

  SignUpEvent({
    required this.email,
    required this.password,
    required this.name,
  });
}

class SignOutEvent extends AuthEvent {
  SignOutEvent();
}
