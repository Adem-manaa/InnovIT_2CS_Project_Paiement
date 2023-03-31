import 'package:flutter/material.dart';
import 'package:innovit_2cs_project_paiement/screens/SignInPage.dart';


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
      home:  SignInPage(),
      //todo: make home different if user is already signed in
    );
  }
}
