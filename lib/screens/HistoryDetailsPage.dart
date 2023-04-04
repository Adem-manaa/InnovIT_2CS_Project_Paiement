import 'package:flutter/material.dart';
import 'package:innovit_2cs_project_paiement/widgets/SimpleAppbar.dart';

import '../utilities/constants.dart';
class HistoryDetailsPage extends StatelessWidget {
  const HistoryDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sugarAmount = 2;
    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'Details',
      ),
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
                  Row(
                    children: [
                      Expanded(
                        child: Slider(
                          value: sugarAmount,
                          min: 0,
                          max: 5,
                          divisions: 6,
                          activeColor: deepGreen,
                          inactiveColor: coffeeBrown,
                          label: 'Sugar amount',
                          onChanged: (double value) {},
                        ),
                      ),
                      Text(
                        "${sugarAmount.truncate()}    ",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24
                        ),
                      )
                    ],
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Payment Method: ',
                                style:  TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Image.asset('assets/images/pypl.png'),
                            ],
                          ),
                          const Row(
                            children: [
                              Text(
                                'Card number: ',
                                style:  TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                '****   ****  ****  1234',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6,),
                          const Row(
                            children: [
                              Text(
                                'Card owner: ',
                                style:  TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'Me myself and i',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    '40.00 DA',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
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
