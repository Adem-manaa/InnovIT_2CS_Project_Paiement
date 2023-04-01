import 'package:flutter/material.dart';
import 'package:innovit_2cs_project_paiement/widgets/CustomBottomNavBar.dart';

import '../utilities/constants.dart';
import 'HistoryPage.dart';
import 'ProfilePage.dart';
import 'ScanPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 1;
  final screens = [
    const HistoryPage(),
    const ScanPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        icon1: const Icon(Icons.history),
        icon2: const Icon(Icons.qr_code_scanner_outlined),
        icon3: const Icon(Icons.person),
        label1: 'History',
        label2: 'Scan',
        label3: 'Profile',
        selectedItemColor: coffeeBrown,
        unselectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
