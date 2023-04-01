import 'package:flutter/material.dart';
import 'package:innovit_2cs_project_paiement/screens/MainPage.dart';
import 'package:innovit_2cs_project_paiement/screens/SignUpPage.dart';
import 'package:innovit_2cs_project_paiement/utilities/constants.dart';
import 'package:innovit_2cs_project_paiement/widgets/RoundedColoredButton.dart';
import '../widgets/RoundedTextFormField.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();

  late String email, password;

   bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Sign in now',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Image.asset('assets/images/app_logo.png'),
                  ),
                  const Text(
                    'SmartBev',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: coffeeBrown,
                    ),
                  ),
                ],
              ),
              RoundedTextFormField(
                hideText: false,
                hintText: 'Enter your email',
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
                hideText: true,
                hintText: 'Enter your password',
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: coffeeBrown,
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe=value!;
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                          (states) => const BorderSide(
                              width: 1.0, color: Color(0xff9BAEBC)),
                        ),
                      ),
                      const Text(
                        'Remember me',
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff9BAEBC),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
                      //todo : implement forgot password
                    },
                    child: const Text(
                      'Forgot password ?',
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xff9BAEBC),
                      ),
                    ),
                  ),
                ],
              ),
              RoundedColoredButton(
                  width: 350,
                  height: 50,
                  text: 'Sign In',
                  textColor: Colors.white,
                  fillColor: coffeeBrown.withOpacity(0.7),
                  shadowBlurRadius: 7,
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (formKey.currentState!.validate()){
                      formKey.currentState!.save();
                      if (signIn(email,password,rememberMe)){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MainPage()));
                      }else{
                        const snackBar = SnackBar(
                          content: Text(
                            'Invalid credentials',
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
                  //todo : implement sign in with google
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
                        'Login with google',
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
                  const Text(
                    'Don’t have an account ?  ',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignUpPage()));
                    },
                    child: const Text(
                      'Sign up',
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

  bool signIn(String email, String password, bool rememberMe){
    //todo : implement sign in from db
    if (email == "islam" && password == "105") {
      return true;
    }
    return false;
  }
}
