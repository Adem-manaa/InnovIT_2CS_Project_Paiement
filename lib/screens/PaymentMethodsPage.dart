import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:innovit_2cs_project_paiement/utilities/constants.dart';
import 'package:innovit_2cs_project_paiement/widgets/RoundedColoredButton.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/PaymentMethod.dart';
import '../provider/user_provider.dart';
import '../controllers/paymentMethod.dart';
import '../widgets/RoundedTextFormField.dart';
import '../widgets/SimpleAppbar.dart';
import 'package:http/http.dart' as http;

import 'MainPage.dart';

class PaymentMethodsPage extends StatefulWidget {
  final String? variable;
  const PaymentMethodsPage({Key? key, this.variable}) : super(key: key);

  @override
  State<PaymentMethodsPage> createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  late PaymentMethod paymentData = new PaymentMethod();
  bool _isTapped = false;
  late String owner, cardNumber, date;
  String ccv = '';
  final formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  final paymentMethoodController PaymentMethoodController = paymentMethoodController();
 
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 242, 235, 227),
      appBar: const SimpleAppBar(title: 'Payment methods'),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
              child: FutureBuilder(
                future: PaymentMethoodController.getPayments(),
                builder: (context,AsyncSnapshot<List<PaymentMethod>> snapshot){
                  if( snapshot.hasData){
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        PaymentMethod paymentMethod = snapshot.data![index];
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 5,),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {        
                                      paymentData = paymentMethod;
                                      enterCCV();
                                      setState(() {
                                        _isTapped = !_isTapped;
                                      });
                                    },
                                    child: Container(
                                      height: MediaQuery.of(context).size.height*0.23,
                                      width: MediaQuery.of(context).size.width*0.91,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                        color: _isTapped ? deepGreen : Colors.white,
                                        width: _isTapped ? 2.0 : 0.0,
                                      ),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(20),
                                          boxShadow: const [
                                            BoxShadow(blurRadius: 3, color: Colors.grey),
                                          ]),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.payments_outlined,
                                            color: Colors.blue.shade900,
                                            size: 40,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'card number : ${paymentMethod.cartePaiment}',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold, fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                'Card Owner : ${paymentMethod.mail ?? ''}',
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                'expires : ${paymentMethod.expiryDate ?? ''}',
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
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5,),
                            ],
                          ),
                        );
                      },
                    );
                  }else if(snapshot.hasError){
                    return Text('Error: ${snapshot.error}');
                  }else{
                    return Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.16,
                        ),
                        CircularProgressIndicator(
                          color: deepGreen,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.16,
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
            IconButton(
                iconSize: 45,
                onPressed: () {
                  openDialog();
                },
                icon: const Icon(
                  Icons.add_circle_outline_outlined,
                  color: coffeeBrown,
                )),
            RoundedColoredButton(
              width: MediaQuery.of(context).size.width*0.6,
              height: 50,
              text: "Confirm",
              textColor: Colors.white,
              fillColor: deepGreen,
              onPressed: () { 
                final String? code = widget.variable;

                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.loading,
                  title: 'Loading',
                  text: 'proccessing payment',
                );
                paymentData.ccv = ccv;
                PaymentMethod pay = PaymentMethod(cartePaiment: paymentData.cartePaiment, ccv: paymentData.ccv, expiryDate: paymentData.expiryDate); 
                PaymentMethoodController.pay(pay,code!,context); 
              },
              shadowBlurRadius: 0,
            ),
            const Text(
              'All rights reserved © InnovIt 2023',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
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
                            cardNumber = value!;
                          },
                        )),
                    SizedBox(
                        width: 307,
                        child: RoundedTextFormField(
                          hideText: false,
                          hintText: 'Expiration date mm/yy',
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
                            date = value!;
                          },
                        )
                    ),
                    SizedBox(
                        width: 307,
                        child: RoundedTextFormField(
                          hideText: false,
                          hintText: 'Owner’s email',
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
                        onPressed: () async{
                          if (formKey.currentState!.validate()){
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            String? email = prefs.getString('email');
                            formKey.currentState!.save();
                            PaymentMethod newMethod = PaymentMethod(mail:email, cartePaiment: cardNumber, ccv: ccv, expiryDate: date);
                            PaymentMethoodController.addMethod(newMethod, context);      
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
  void enterCCV() => showDialog(
    context: context, 
    builder: (context) => Dialog(
          insetPadding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: Container(
            height: MediaQuery.of(context).size.height*0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Enter your cvc code',
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
                      child: TextField(
                      controller: myController,
                    ),
                      // RoundedTextFormField(
                      //   hideText: false,
                      //   hintText: 'CCV code',
                      //   hintTextSize: 14,
                      //   borderColor: Colors.grey.shade500,
                      //   selectedBorderColor: coffeeBeige,
                      //    prefixIcon: const Icon(Icons.add_card),
                      //   borderRadius: 17,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please enter some text';
                      //     }
                      //     return null;
                      //   },
                      //   onSaved: (String? value){
                      //     ccv = value!;
                      //   },
                      // )
                  ),
                  RoundedColoredButton(
                      width: 260,
                      height: 50,
                      text: "Enter",
                      textColor: Colors.white,
                      fillColor: deepGreen,
                      shadowBlurRadius: 0,
                      onPressed: () {
                          ccv = myController.text;
                          print('ccv code : ${ccv}');
                          Navigator.of(context, rootNavigator: true).pop(ccv);  
                        
                      }
                  ),
                ],
              ),
            ),
          )
      ),
    );


  void addCard() async{
    var uri = Uri.parse('https://innovit-payment.onrender.com/paiement/paiement/add');
    final response = await http.post(uri,body: { "mail": "ja_manaa@esi.dz", "cartePaiment": cardNumber, "ccv": ccv, "expiryDate": date } );
    // setState(() {
    // });
  }
}
