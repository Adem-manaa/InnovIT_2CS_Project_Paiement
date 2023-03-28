import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:innovit_2cs_project_paiement/screens/CommandPage.dart';
import 'package:innovit_2cs_project_paiement/screens/HistoryPage.dart';
import 'package:innovit_2cs_project_paiement/screens/PaymentMethodsPage.dart';
import 'package:innovit_2cs_project_paiement/screens/SignInPage.dart';
import 'package:innovit_2cs_project_paiement/screens/SignUpPage.dart';
import 'package:innovit_2cs_project_paiement/widgets/appBar.dart';

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
      home: const PaymentMethodsPage(),
    );
  }
}
