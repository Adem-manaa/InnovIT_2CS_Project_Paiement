import 'package:flutter/material.dart';
import 'package:innovit_2cs_project_paiement/screens/MainPage.dart';
import 'package:innovit_2cs_project_paiement/screens/SignInPage.dart';
import 'package:innovit_2cs_project_paiement/widgets/RoundedTextFormFieldOne.dart';

import '../utilities/constants.dart';
import '../widgets/RoundedColoredButton.dart';
import '../widgets/RoundedTextFormField.dart';

class ProfileInfoPage extends StatefulWidget {
  const ProfileInfoPage({Key? key}) : super(key: key);

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}



class _ProfileInfoPageState extends State<ProfileInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding:  EdgeInsets.all(25),
        child:Form(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children:[


                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                      Icon(

                      Icons.arrow_back_rounded,
                      size: 30,
                    ),

                        Text(
                            'Personal infos ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                              color: Colors.black,


                            ),
                          ),
                          const SizedBox(width: 32.0),


                  ],
                ),
            Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Full name',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,

                      ),
                    ),
                  ],
                ),
                  RoundedTextFormFieldOne(
                    hintText: 'Taibi Kamyl ',
                    hintTextSize: 20,

                    borderColor: const Color(0xff251201).withOpacity(0.2),
                    selectedBorderColor: coffeeBeige.withOpacity(0.7),
                  ),
                  ],),
                  Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                        ],
                      ),
                      RoundedTextFormFieldOne(
                        hintText: 'jk_taibi@esi.dz',
                        hintTextSize: 20,

                        borderColor: const Color(0xff251201).withOpacity(0.2),
                        selectedBorderColor: coffeeBeige.withOpacity(0.7),
                      ),
                    ],),
                  Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Phone number',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                        ],
                      ),
                      RoundedTextFormFieldOne(
                        hintText: '0555555555 ',
                        hintTextSize: 20,

                        borderColor: const Color(0xff251201).withOpacity(0.2),
                        selectedBorderColor: coffeeBeige.withOpacity(0.7),
                      ),
                    ],),
                  Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Location',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                        ],
                      ),
                      RoundedTextFormFieldOne(
                        hintText: 'Oued Semar,Alger ',
                        hintTextSize: 20,

                        borderColor: const Color(0xff251201).withOpacity(0.2),
                        selectedBorderColor: coffeeBeige.withOpacity(0.7),
                      ),
                    ],),
                  Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Enter your password ',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                        ],
                      ),
                      RoundedTextFormFieldOne(
                        hintText: '********',
                        hintTextSize: 20,

                        borderColor: const Color(0xff251201).withOpacity(0.2),
                        selectedBorderColor: coffeeBeige.withOpacity(0.7),
                      ),
                    ],),
                  Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Change your password(optionnal)',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                        ],
                      ),
                      RoundedTextFormFieldOne(
                        hintText: '',
                        hintTextSize: 20,

                        borderColor: const Color(0xff251201).withOpacity(0.2),
                        selectedBorderColor: coffeeBeige.withOpacity(0.7),
                      ),
                    ],),
                  RoundedColoredButton(
                      width: 350,
                      height: 50,
                      text: 'Edit Personnal infos',
                      textColor: Colors.white,
                      fillColor: coffeeBrown,
                      shadowBlurRadius: 1,
                      onPressed: (){}),
                   Text(
                    'All rights reserved to © InnovIt 2023',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
          ]

        )
    )

      )
    );
  }
}
