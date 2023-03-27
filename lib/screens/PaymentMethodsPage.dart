import 'package:flutter/material.dart';
import 'package:innovit_2cs_project_paiement/utilities/constants.dart';
import 'package:innovit_2cs_project_paiement/widgets/RoundedColoredButton.dart';

import '../widgets/SimpleAppbar.dart';

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 235, 227),
      appBar: const SimpleAppBar(title: 'Payment methods'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'select your payment method',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              height: 400,
              child: ListView.separated(
                  itemBuilder: (context,index){
                    return Container(
                      height: 180,
                      width: 365,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.grey
                          ),
                        ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.payments_outlined,
                            color: Colors.blue.shade900,
                            size: 45,
                          ),
                          Text(
                            '****     ****     ****     1234',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Card Owner : Taibi Kamyl',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                  'expires : 05/25',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context,index){
                    return SizedBox(height: 15,);
                  },
                  itemCount: 3,
              ),
            ),
          ),
          IconButton(
            iconSize: 53,
              onPressed: () {},
              icon: Icon(
                Icons.add_circle_outline_outlined,
                color: coffeeBrown,
              )
          ),
          RoundedColoredButton(
            width: 260,
            height: 50,
            text: "Confirm",
            textColor: Colors.white,
            fillColor: deepGreen,
            onPressed: (){},
            shadowBlurRadius: 0,
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
    );
  }
}
