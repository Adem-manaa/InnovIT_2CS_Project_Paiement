import 'package:flutter/material.dart';
import 'package:innovit_2cs_project_paiement/screens/PaymentMethodsPage.dart';
import 'package:innovit_2cs_project_paiement/widgets/RoundedColoredButton.dart';
import 'package:innovit_2cs_project_paiement/widgets/SimpleAppbar.dart';

import '../utilities/constants.dart';

class CommandPage extends StatelessWidget {
  const CommandPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(title: 'Command'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
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
            Container(
              height: 500,
              decoration: BoxDecoration(
                  color: coffeeBrown.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 125,
                        height: 125,
                        child: Image.asset('assets/images/drinkCappuccino.png'),
                      ),
                      const Column(
                        children: [
                          Text(
                            'Crème coffee',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          Text(
                            'A coffee beverage that\n contains espresso and hot\n milk.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Sugar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Slider(
                    value: 0.5,
                    min: 0,
                    max: 2,
                    divisions: 6,
                    activeColor: deepGreen,
                    inactiveColor: coffeeBrown,
                    label: 'Set sugar amount',
                    onChanged: (double value) {},
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            indent: 10,
                            endIndent: 10,
                            thickness: 1,
                            color: deepGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '04 march 2023',
                          style: TextStyle(
                            color: deepGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          '03:00 PM',
                          style: TextStyle(
                            color: deepGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'ESI, Alger',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  RoundedColoredButton(
                      width: 260,
                      height: 50,
                      text: '40.00DA',
                      textColor: Colors.white,
                      fillColor: deepGreen,
                      shadowBlurRadius: 0,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentMethodsPage()));
                      }),
                ],
              ),
            ),
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
