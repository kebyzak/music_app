import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/data/repositories/auth_repository.dart';
import 'package:music_app/generated/l10n.dart';
import 'package:music_app/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:music_app/presentation/widgets/app_button.dart';
// ignore: depend_on_referenced_packages
import 'package:lottie/lottie.dart';
import 'package:music_app/routes/app_routes.dart';

class SignUpScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(authRepository: AuthRepository()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Lottie.asset(
                      'assets/animations/signup.json',
                      width: 200,
                      height: 200,
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
                        borderSide: BorderSide(color: Colors.orange.shade300),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: S.of(context).name,
                      hintStyle: const TextStyle(color: Colors.black),
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.orange.shade300),
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
                        borderSide: BorderSide(color: Colors.orange.shade300),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is Loading) {
                        return Lottie.asset(
                          'assets/animations/loading.json',
                          width: 150,
                          height: 150,
                        );
                      } else if (state is Success) {
                        Future.delayed(Duration.zero, () {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.signInScreen,
                          );
                        });
                        return Container();
                      } else {
                        return AppButton(
                          text: S.of(context).signUp,
                          onPressed: () {
                            context.read<AuthBloc>().add(
                                  SignUpEvent(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    name: _nameController.text,
                                  ),
                                );
                          },
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 8.0),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.signInScreen);
                      },
                      child: Text(
                        S.of(context).alreadyAMemberSignIn,
                        style: TextStyle(
                          color: Colors.orange.shade300,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
