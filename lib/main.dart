import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:innovit_2cs_project_paiement/provider/user_provider.dart';
import 'package:innovit_2cs_project_paiement/screens/MainPage.dart';
import 'package:innovit_2cs_project_paiement/screens/PaymentMethodsPage.dart';
import 'package:innovit_2cs_project_paiement/screens/QRScannerPage.dart';
import 'package:innovit_2cs_project_paiement/screens/SignInPage.dart';
import 'package:innovit_2cs_project_paiement/utilities/constants.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLoggedIn();
  }

  void checkLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loggedIn = prefs.getBool('loggedIn') ?? false;
    setState(() {
      isLoggedIn = loggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        // add more providers here if needed
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Outfit'
        ),
        home: isLoggedIn ? Home() : SignInPage()
      ),
    );
  }
}

Widget Home() {
  return AnimatedSplashScreen(
        splash: SizedBox(
          child: Image.asset('assets/images/Logo_title (1) (1).png'),
        ),
        nextScreen: const MainPage(),
        backgroundColor: const Color.fromARGB(255, 242, 235, 227),
        splashTransition: SplashTransition.fadeTransition,
        duration: 3000,
      );
}