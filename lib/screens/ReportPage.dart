import 'package:flutter/material.dart';
import 'package:innovit_2cs_project_paiement/widgets/RoundedColoredButton.dart';
import 'package:innovit_2cs_project_paiement/widgets/RoundedTextField.dart';
import 'package:innovit_2cs_project_paiement/widgets/SimpleAppbar.dart';

import '../utilities/constants.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: SimpleAppBar(
        title: 'Report a problem',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'command number: ESI-08745',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Column(
              children: [
                const Text(
                  'What seems to be the problem ?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 25,),
                RoundedTextField(
                    maxLines: null,
                    minLines: 15,
                    hintText: 'Describe your problem',
                    hintTextSize: 20,
                    borderColor: Color(0xff251201).withOpacity(0.2),
                    selectedBorderColor: coffeeBeige),
              ],
            ),
            RoundedColoredButton(
                width: 260,
                height: 50,
                text: 'Send Report',
                textColor: Colors.white,
                fillColor: Color(0xffEB001B),
                shadowBlurRadius: 1,
                onPressed: (){
                  //todo : implement reporting
                }),
            const Text(
              'All rights reserved © InnovIt 2023',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
