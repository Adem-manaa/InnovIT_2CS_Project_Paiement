import 'package:flutter/material.dart';
import 'package:innovit_2cs_project_paiement/widgets/RoundedTextField.dart';

import '../utilities/constants.dart';
import '../widgets/RoundedColoredButton.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Row(
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
            RoundedTextField(
              hintText: 'First name',
              hintTextSize: 17,
              borderColor: const Color(0xff251201).withOpacity(0.2),
              selectedBorderColor: coffeeBeige.withOpacity(0.7),
            ),
            RoundedTextField(
              hintText: 'Last name',
              hintTextSize: 17,
              borderColor: const Color(0xff251201).withOpacity(0.2),
              selectedBorderColor: coffeeBeige.withOpacity(0.7),
            ),
            RoundedTextField(
              hintText: 'Email',
              hintTextSize: 17,
              borderColor: const Color(0xff251201).withOpacity(0.2),
              selectedBorderColor: coffeeBeige.withOpacity(0.7),
            ),
            RoundedTextField(
              hintText: 'Phone number',
              hintTextSize: 17,
              borderColor: const Color(0xff251201).withOpacity(0.2),
              selectedBorderColor: coffeeBeige.withOpacity(0.7),
            ),
            RoundedTextField(
              hintText: 'Password',
              hintTextSize: 17,
              borderColor: const Color(0xff251201).withOpacity(0.2),
              selectedBorderColor: coffeeBeige.withOpacity(0.7),
              trailingIcon: const Icon(Icons.remove_red_eye_outlined),
            ),
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
                const Text(
                  'terms ',
                  style: TextStyle(
                    fontSize: 17,
                    color: coffeeBrown,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const Text(
                  'and ',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  'conditions ',
                  style: TextStyle(
                    fontSize: 17,
                    color: coffeeBrown,
                    decoration: TextDecoration.underline,
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
                    'Sign up with google',
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
                  'Already have an account ?  ',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Sign in',
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
