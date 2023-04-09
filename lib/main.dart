import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:innovit_2cs_project_paiement/screens/MainPage.dart';
import 'package:innovit_2cs_project_paiement/screens/SignInPage.dart';
import 'package:innovit_2cs_project_paiement/utilities/constants.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Outfit'
      ),
      home:  AnimatedSplashScreen(
        splash: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: Image.asset('assets/images/app_logo.png'),
            ),
            const Text(
              'SmartBev',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: coffeeBrown,
              ),
            ),
          ],
        ),
        nextScreen: const MainPage(),
        backgroundColor: const Color.fromARGB(255, 242, 235, 227),
        splashTransition: SplashTransition.fadeTransition,
        duration: 3000,
      ),
      //todo: make home different if user is already signed in
    );
  }
}
