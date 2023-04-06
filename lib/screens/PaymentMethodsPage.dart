import 'package:flutter/material.dart';
import 'package:innovit_2cs_project_paiement/utilities/constants.dart';
import 'package:innovit_2cs_project_paiement/widgets/RoundedColoredButton.dart';

import '../models/PaymentMethod.dart';
import '../widgets/RoundedTextFormField.dart';
import '../widgets/SimpleAppbar.dart';

class PaymentMethodsPage extends StatefulWidget {
  const PaymentMethodsPage({Key? key}) : super(key: key);

  @override
  State<PaymentMethodsPage> createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  late String owner, number, date;
  final formKey = GlobalKey<FormState>();
  List<PaymentMethod> methods = [];
  List<PaymentMethod> loadData() {
    return [
      PaymentMethod(
          cardLogo: Icons.payments_outlined,
          cardNumber: "****     ****     ****     1234",
          owner: "Ens batata sofiane",
          expiryDate: "03/23"),
      PaymentMethod(
          cardLogo: Icons.payment,
          cardNumber: "****     ****     ****     5678",
          owner: "Ens harket adel",
          expiryDate: "03/26"),
      PaymentMethod(
          cardLogo: Icons.paypal,
          cardNumber: "****     ****     ****     2317",
          owner: "Ens chbeieb salim",
          expiryDate: "02/19"),
    ];
  }

  @override
  void initState() {
    super.initState();
    methods = loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 242, 235, 227),
      appBar: const SimpleAppBar(title: 'Payment methods'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'select your payment method',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Container(
              height: MediaQuery.of(context).size.height*0.55,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 5,),
                      Row(
                        children: [
                          const SizedBox(width: 5,),
                          Container(
                            height: 180,
                            width: 344,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(blurRadius: 3, color: Colors.grey),
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  methods[index].cardLogo,
                                  color: Colors.blue.shade900,
                                  size: 45,
                                ),
                                Text(
                                  methods[index].cardNumber,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Card Owner : ${methods[index].owner}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'expires : ${methods[index].expiryDate}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 5,),
                        ],
                      ),
                      const SizedBox(height: 5,),
                    ],
                  );
                },
                itemCount: methods.length,
              ),
            ),
          ),
          IconButton(
              iconSize: 53,
              onPressed: () {
                openDialog();
              },
              icon: const Icon(
                Icons.add_circle_outline_outlined,
                color: coffeeBrown,
              )),
          RoundedColoredButton(
            width: 260,
            height: 50,
            text: "Confirm",
            textColor: Colors.white,
            fillColor: deepGreen,
            onPressed: () {},
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

  void openDialog() => showDialog(
        context: context,
        builder: (context) => Dialog(
          insetPadding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: Container(
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Add payment information',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/barid.png'),
                        Image.asset('assets/images/visa.png'),
                        Image.asset('assets/images/mastercard.png'),
                        Image.asset('assets/images/pypl.png'),
                      ],
                    ),
                    SizedBox(
                        width: 307,
                        child: RoundedTextFormField(
                          hideText: false,
                          hintText: 'Card number',
                          hintTextSize: 14,
                          borderColor: Colors.grey.shade500,
                          selectedBorderColor: coffeeBeige,
                          prefixIcon: const Icon(Icons.credit_card),
                          borderRadius: 17,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onSaved: (String? value){
                            number= value!;
                          },
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            width: 163,
                            child: RoundedTextFormField(
                              hideText: false,
                              hintText: 'Expiration date',
                              hintTextSize: 14,
                              borderColor: Colors.grey.shade500,
                              selectedBorderColor: coffeeBeige,
                              prefixIcon: const Icon(Icons.calendar_month),
                              borderRadius: 17,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              onSaved: (String? value){
                                date=value!;
                              },
                            )
                        ),
                        SizedBox(
                            width: 139,
                            child: RoundedTextFormField(
                              hideText: false,
                              hintText: 'CVV code',
                              hintTextSize: 14,
                              borderColor: Colors.grey.shade500,
                              selectedBorderColor: coffeeBeige,
                              prefixIcon: const Icon(Icons.add_card),
                              borderRadius: 17,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            )),
                      ],
                    ),
                    SizedBox(
                        width: 307,
                        child: RoundedTextFormField(
                          hideText: false,
                          hintText: 'Owner’s name',
                          hintTextSize: 14,
                          borderColor: Colors.grey.shade500,
                          selectedBorderColor: coffeeBeige,
                          prefixIcon: const Icon(Icons.person_pin_outlined),
                          borderRadius: 17,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onSaved: (String? value){
                            owner = value!;
                          },
                        )),
                    RoundedColoredButton(
                        width: 260,
                        height: 50,
                        text: "Add card",
                        textColor: Colors.white,
                        fillColor: deepGreen,
                        shadowBlurRadius: 0,
                        onPressed: (){
                          if (formKey.currentState!.validate()){
                            formKey.currentState!.save();
                            addCard();
                            Navigator.of(context).pop();
                            const snackBar = SnackBar(
                                content: Text(
                                  'Card added successfully',
                                ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        }
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  void addCard(){
    setState(() {
      methods.add(PaymentMethod(cardLogo: Icons.payments_rounded, cardNumber: number, owner: owner, expiryDate: date));
    });
  }
}
