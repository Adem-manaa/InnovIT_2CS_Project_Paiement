import 'package:flutter/material.dart';
import 'package:innovit_2cs_project_paiement/utilities/constants.dart';
import 'package:innovit_2cs_project_paiement/widgets/RoundedColoredButton.dart';
import 'package:innovit_2cs_project_paiement/widgets/RoundedTextField.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
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
            RoundedTextField(
              hintText: 'Enter your email',
              hintTextSize: 17,
              borderColor: const Color(0xff251201).withOpacity(0.2),
              selectedBorderColor: coffeeBeige.withOpacity(0.7),
            ),
            RoundedTextField(
              hintText: 'Enter your password',
              hintTextSize: 17,
              borderColor: const Color(0xff251201).withOpacity(0.2),
              selectedBorderColor: coffeeBeige.withOpacity(0.7),
              trailingIcon: const Icon(Icons.remove_red_eye_outlined),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.black,
                      value: false,
                      onChanged: (value) {},
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
                const Text(
                  'Forgot password ?',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xff9BAEBC),
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
                onPressed: () {}),
            const Row(
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
            Container(
              width: 350,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xffD9D9D9))),
              child: const Row(
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account ?  ',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 17,
                    color: coffeeBrown,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
