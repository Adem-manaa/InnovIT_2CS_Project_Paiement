import 'package:flutter/material.dart';
import 'package:innovit_2cs_project_paiement/screens/MainPage.dart';
import 'package:innovit_2cs_project_paiement/screens/SignInPage.dart';

import '../utilities/constants.dart';
import '../widgets/RoundedColoredButton.dart';
import '../widgets/RoundedTextFormField.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  late String firstName, lastName, email, phoneNumber, password;
  bool accept = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Sign up now',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              RoundedTextFormField(
                hintText: 'First name',
                hintTextSize: 17,
                borderColor: const Color(0xff251201).withOpacity(0.2),
                selectedBorderColor: coffeeBeige.withOpacity(0.7),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'First name cannot be empty';
                  }
                  return null;
                },
                onSaved: (String? value){
                  firstName=value!;
                },
              ),
              RoundedTextFormField(
                hintText: 'Last name',
                hintTextSize: 17,
                borderColor: const Color(0xff251201).withOpacity(0.2),
                selectedBorderColor: coffeeBeige.withOpacity(0.7),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Last name cannot be empty';
                  }
                  return null;
                },
                onSaved: (String? value){
                  lastName=value!;
                },
              ),
              RoundedTextFormField(
                hintText: 'Email',
                hintTextSize: 17,
                borderColor: const Color(0xff251201).withOpacity(0.2),
                selectedBorderColor: coffeeBeige.withOpacity(0.7),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email cannot be empty';
                  }
                  return null;
                },
                onSaved: (String? value){
                  email=value!;
                },
              ),
              RoundedTextFormField(
                hintText: 'Phone number',
                hintTextSize: 17,
                borderColor: const Color(0xff251201).withOpacity(0.2),
                selectedBorderColor: coffeeBeige.withOpacity(0.7),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone number cannot be empty';
                  }
                  return null;
                },
                onSaved: (String? value){
                  phoneNumber=value!;
                },
              ),
              RoundedTextFormField(
                hintText: 'Password',
                hintTextSize: 17,
                borderColor: const Color(0xff251201).withOpacity(0.2),
                selectedBorderColor: coffeeBeige.withOpacity(0.7),
                trailingIcon: const Icon(Icons.remove_red_eye_outlined),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password cannot be empty';
                  }
                  return null;
                },
                onSaved: (String? value){
                  password=value!;
                },
              ),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: coffeeBrown,
                    value: accept,
                    onChanged: (value) {
                      setState(() {
                        accept=value!;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith(
                      (states) =>
                          const BorderSide(width: 1.0, color: Color(0xff9BAEBC)),
                    ),
                  ),
                  const Text(
                    'I accept ',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      // todo : load web page that contains terms and conditions
                    },
                    child: const Text(
                      'terms ',
                      style: TextStyle(
                        fontSize: 17,
                        color: coffeeBrown,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const Text(
                    'and ',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      //todo : load web page that contains terms and conditions
                    },
                    child: const Text(
                      'conditions ',
                      style: TextStyle(
                        fontSize: 17,
                        color: coffeeBrown,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              RoundedColoredButton(
                  width: 350,
                  height: 50,
                  text: 'Sign Up',
                  textColor: Colors.white,
                  fillColor: coffeeBrown.withOpacity(0.7),
                  shadowBlurRadius: 7,
                  onPressed: () {
                    if (formKey.currentState!.validate()){
                      formKey.currentState!.save();
                      if (accept){
                        signUp(firstName,lastName,email,phoneNumber,password);
                        const snackBar = SnackBar(
                          content: Text(
                            'Signed up successfully!',
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context)=>MainPage()));
                      }else{
                        const snackBar = SnackBar(
                          content: Text(
                            'Terms and conditions must be accepted',
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
                  }),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      indent: 10,
                      endIndent: 10,
                      thickness: 1,
                      color: deepGreen,
                    ),
                  ),
                  Text(
                    'or',
                    style: TextStyle(
                      fontSize: 16,
                      color: deepGreen,
                    ),
                  ),
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
              GestureDetector(
                onTap: (){
                  //todo : implement sign up with google
                },
                child: Container(
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xffD9D9D9))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.g_mobiledata_rounded,
                        size: 40,
                      ),
                      Text(
                        'Sign up with google',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account ?  ',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignInPage()));
                    },
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 17,
                        color: coffeeBrown,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  void signUp(String firstName, String lastName,String phoneNumber, String email, String password){
    // todo : implement sign up with db
  }
}
