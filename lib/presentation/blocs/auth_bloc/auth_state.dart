part of 'auth_bloc.dart';

abstract class AuthState {}

class Initial extends AuthState {}

class Loading extends AuthState {}

class Success extends AuthState {}

class Error extends AuthState {}
