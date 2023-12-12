import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/data/repositories/auth_repository.dart';
import 'package:music_app/generated/l10n.dart';
import 'package:music_app/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:music_app/presentation/widgets/app_button.dart';
// ignore: depend_on_referenced_packages
import 'package:lottie/lottie.dart';
import 'package:music_app/routes/app_routes.dart';

class SignInScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(authRepository: AuthRepository()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is Success) {
                Navigator.pushNamed(context, AppRoutes.homeScreen);
              } else if (state is Error) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(S.of(context).loginOrPasswordIsIncorrect),
                  duration: const Duration(seconds: 2),
                ));
              }
            },
            builder: (context, state) {
              if (state is Loading) {
                return Lottie.asset('assets/animations/loading.json');
              } else {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Lottie.asset(
                            'assets/animations/signin.json',
                            width: 300,
                            height: 300,
                          ),
                        ),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: S.of(context).email,
                            hintStyle: const TextStyle(color: Colors.black),
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.orange.shade300),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: S.of(context).password,
                            hintStyle: const TextStyle(color: Colors.black),
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.orange.shade300),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        AppButton(
                          text: S.of(context).signIn,
                          onPressed: () {
                            context.read<AuthBloc>().add(
                                  SignInEvent(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                          },
                        ),
                        const SizedBox(height: 8.0),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.signUpScreen);
                            },
                            child: Text(
                              S.of(context).dontHaveAccountCreateOne,
                              style: TextStyle(
                                color: Colors.orange.shade300,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
