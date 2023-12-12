import 'package:flutter/material.dart';
import 'package:music_app/generated/l10n.dart';
import 'package:music_app/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, AppRoutes.signInScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double availableHeight = 0.6 * screenHeight - 40.0;

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20.0),
            SizedBox(
              height: availableHeight,
              child: Center(
                child: Image.asset('assets/images/splash.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                children: [
                  Text(
                    S.of(context).splashText,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.orange.shade300,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
