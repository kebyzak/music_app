import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:music_app/data/repositories/auth_repository.dart';
import 'package:music_app/data/repositories/song_repository.dart';
import 'package:music_app/firebase_options.dart';
import 'package:music_app/generated/l10n.dart';
import 'package:music_app/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:music_app/presentation/blocs/song_bloc/song_bloc.dart';

import 'package:music_app/routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(authRepository: AuthRepository()),
        ),
        BlocProvider<SongBloc>(
          create: (context) => SongBloc(songRepository: SongRepository(Dio())),
        ),
      ],
      child: MaterialApp(
        title: 'music_app',
        theme: ThemeData(fontFamily: 'PoppinsRegular'),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        initialRoute: AppRoutes.splashScreen,
        routes: AppRoutes.routes,
      ),
    );
  }
}
