import 'package:flutter/material.dart';
import 'package:innovit_2cs_project_paiement/screens/CommandPage.dart';
import 'package:innovit_2cs_project_paiement/widgets/RoundedColoredButton.dart';

import '../utilities/constants.dart';
import 'QRScannerPage.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Image.asset('assets/images/app_logo.png'),
          ),
          const Text(
            'Scan your command from the vending machine\n screen',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          RoundedColoredButton(
              width: 240,
              height: 50,
              text: 'Scan',
              textColor: Colors.white,
              fillColor: deepGreen,
              shadowBlurRadius: 0,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>QRViewExample()));
              },
          )
        ],
      ),
    );
  }
}
