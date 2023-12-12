// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:music_app/data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(Initial()) {
    on<SignInEvent>((event, state) async {
      emit(Loading());
      try {
        await authRepository.signIn(
          password: event.password,
          email: event.email,
        );
        emit(Success());
      } catch (e) {
        emit(Error());
      }
    });

    on<SignUpEvent>((event, state) async {
      emit(Loading());
      try {
        await authRepository.signUp(
          password: event.password,
          email: event.email,
          name: event.name,
        );
        emit(Success());
      } catch (e) {
        emit(Error());
      }
    });

    on<SignOutEvent>((event, emit) async {
      await authRepository.logout();
      emit(Initial());
    });
  }
}
