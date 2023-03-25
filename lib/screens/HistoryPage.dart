import 'package:flutter/material.dart';
import 'package:innovit_2cs_project_paiement/utilities/constants.dart';
import 'package:innovit_2cs_project_paiement/widgets/CustomBottomNavBar.dart';
import 'package:innovit_2cs_project_paiement/widgets/RoundedColoredButton.dart';
import 'package:innovit_2cs_project_paiement/widgets/RoundedTextField.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List historyItems = [];
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(40),
            child: SizedBox(
              width: 50,
              height: 50,
              child: Image.asset('assets/images/app_logo.png'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 213,
                height: 40,
                child: RoundedTextField(
                    hintText: 'Search here',
                    hintTextSize: 14,
                    borderColor: const Color(0xff9BAEBC).withOpacity(0.8),
                    selectedBorderColor: coffeeBrown),
              ),
              Container(
                width: 140,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: const Color(0xff9BAEBC).withOpacity(0.8))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.filter_list_sharp,
                        color: const Color(0xff9BAEBC).withOpacity(0.8),
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      'Date',
                      style: TextStyle(
                        fontSize: 17,
                        color: const Color(0xff9BAEBC).withOpacity(0.8),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.expand_more,
                        color: const Color(0xff9BAEBC).withOpacity(0.8),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    width: 374,
                    height: 200,
                    decoration: BoxDecoration(
                      color: coffeeBeige.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/images/drinkExample.png',
                              width: 140,
                              height: 140,
                            ),
                            const SizedBox(
                              height: 110,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '04 march 2023  ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: deepGreen),
                                      ),
                                      Text(
                                        '08:00 AM',
                                        style: TextStyle(
                                            fontSize: 15, color: deepGreen),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Creme coffee  ',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        '50.00 DA',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'UCSF, California',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundedColoredButton(
                                width: 160,
                                height: 34,
                                text: 'Details',
                                textSize: 15,
                                textColor: Colors.black,
                                fillColor: Color(0xffFBFBFB),
                                shadowBlurRadius: 0,
                                onPressed: () {}),
                            RoundedColoredButton(
                                width: 160,
                                height: 34,
                                text: 'Report',
                                textSize: 15,
                                textColor: Colors.white,
                                fillColor: Color(0xffEB001B),
                                shadowBlurRadius: 0,
                                onPressed: () {})
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 5,
                  );
                },
                itemCount: 10),
          )
        ],
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
      ),
    );
  }
}
