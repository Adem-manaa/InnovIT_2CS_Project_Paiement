import 'package:flutter/material.dart';
import 'package:innovit_2cs_project_paiement/widgets/SimpleAppbar.dart';

import '../models/HistoryItem.dart';
import '../utilities/constants.dart';
class HistoryDetailsPage extends StatelessWidget {
  final HistoryItem? historyItem;
  const HistoryDetailsPage({this.historyItem, Key? key}) : super(key: key);

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
            Text(
              'command number: ' + historyItem!.id.toString(),
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
                       ClipRRect(
                         borderRadius: BorderRadius.circular(10.0),
                         child: Image.network(
                          historyItem!.image ?? "assets/images/drinkCreme.png",
                          width: 125,
                          height: 125,
                                             ),
                       ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              historyItem!.name!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            Text(
                              historyItem!.recette!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 15),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
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
                  Padding(
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${historyItem!.date}',
                          style: TextStyle(
                            color: deepGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '',
                          style: TextStyle(
                            color: deepGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    historyItem!.localisation!,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
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
                          Row(
                            children: [
                              Text(
                                'Card number: ',
                                style:  TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                historyItem!.cardNumber!,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6,),
                          Row(
                            children: [
                              Text(
                                'Card owner: ',
                                style:  TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                historyItem!.userMail!,
                                style: TextStyle(
                                    fontSize: 18,
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
                  Text(
                    historyItem!.price!+'0 DA',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
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
