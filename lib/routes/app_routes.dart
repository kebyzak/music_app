import 'package:flutter/material.dart';
import 'package:music_app/data/repositories/auth_repository.dart';
import 'package:music_app/presentation/screens/home_screen.dart';
import 'package:music_app/presentation/screens/profile_screen.dart';
import 'package:music_app/presentation/screens/qr_screen.dart';
import 'package:music_app/presentation/screens/sign_in_screen.dart';
import 'package:music_app/presentation/screens/sign_up_screen.dart';
import 'package:music_app/presentation/screens/songs_screen.dart';
import 'package:music_app/presentation/screens/splash_screen.dart';
import 'package:music_app/presentation/screens/stories_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String profileScreen = '/profile_screen';
  static const String storiesScreen = '/stories_screen';
  static const String signInScreen = '/sign_in_screen';
  static const String signUpScreen = '/sign_up_screen';
  static const String qrScreen = '/qr_screen';
  static const String homeScreen = '/home_screen';
  static const String songsScreen = '/songs_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    profileScreen: (context) => ProfileScreen(authRepository: AuthRepository()),
    storiesScreen: (context) => const StoriesScreen(),
    signInScreen: (context) => SignInScreen(),
    signUpScreen: (context) => SignUpScreen(),
    qrScreen: (context) => const QrScreen(),
    homeScreen: (context) => const HomeScreen(),
    songsScreen: (context) => const SongsScreen()
  };
}
