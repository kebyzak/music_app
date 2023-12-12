import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/data/repositories/auth_repository.dart';
// ignore: depend_on_referenced_packages
import 'package:lottie/lottie.dart';
import 'package:music_app/generated/l10n.dart';
import 'package:music_app/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:music_app/presentation/widgets/app_button.dart';
import 'package:music_app/routes/app_routes.dart';

class ProfileScreen extends StatelessWidget {
  final AuthRepository authRepository;

  const ProfileScreen({required this.authRepository, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.storiesScreen);
                    },
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/stories.png'),
                    ),
                  ),
                  Text(S.of(context).clickToSeeStories)
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Lottie.asset(
                        'assets/animations/user.json',
                        width: 150,
                        height: 150,
                      ),
                      const SizedBox(height: 10),
                      FutureBuilder<User?>(
                        future: authRepository.getUser(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Lottie.asset(
                              'assets/animations/loading.json',
                              width: 100,
                              height: 100,
                            );
                          } else if (snapshot.hasError) {
                            return Text(S.of(context).error);
                          } else {
                            final user = snapshot.data;

                            return Column(
                              children: [
                                Text(
                                  'Имя: ${user?.displayName ?? "N/A"}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Электронная почта: ${user?.email ?? "N/A"}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      AppButton(
                        text: S.of(context).signOut,
                        onPressed: () {
                          context.read<AuthBloc>().add(SignOutEvent());
                          Navigator.pushNamed(context, AppRoutes.signInScreen);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
