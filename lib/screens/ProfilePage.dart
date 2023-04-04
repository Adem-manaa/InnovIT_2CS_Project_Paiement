import 'package:flutter/material.dart';
import 'package:innovit_2cs_project_paiement/screens/SignInPage.dart';
import 'package:innovit_2cs_project_paiement/utilities/constants.dart';
import 'package:innovit_2cs_project_paiement/widgets/RoundedColoredButton.dart';

class ProfilePage extends StatelessWidget {
  //todo : make page dynamic
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Column(
            children: [
              Icon(
                Icons.person_outline,
                size: 80,
              ),
              Text(
                'Kamyl Taibi',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
              Text(
                'jk_taibi@esi.dz',
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xff9BAEBC),
                ),
              ),
            ],
          ),
          Column(
            children: [
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.only(left: 50)),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.person_outline),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Edit profile',
                      style: TextStyle(fontSize: 19),
                    )
                  ],
                ),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
                thickness: 1,
                color: const Color(0xff9BAEBC).withOpacity(0.5),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.only(left: 50)),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.credit_card_rounded),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Payment methods',
                      style: TextStyle(fontSize: 19),
                    )
                  ],
                ),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
                thickness: 1,
                color: const Color(0xff9BAEBC).withOpacity(0.5),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.only(left: 50)),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.list_alt_sharp),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Privacy Policy',
                      style: TextStyle(fontSize: 19),
                    )
                  ],
                ),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
                thickness: 1,
                color: const Color(0xff9BAEBC).withOpacity(0.5),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.only(left: 50)),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.help),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Help',
                      style: TextStyle(fontSize: 19),
                    )
                  ],
                ),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
                thickness: 1,
                color: const Color(0xff9BAEBC).withOpacity(0.5),
              ),
            ],
          ),
          RoundedColoredButton(
              width: 350,
              height: 50,
              text: 'logout',
              textColor: Colors.white,
              fillColor: coffeeBrown,
              shadowBlurRadius: 1,
              onPressed: (){
                //todo :
                NavigatorState navigatorState = Navigator.of(context);
                while (navigatorState.canPop()) {
                  navigatorState.pop();
                }

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const SignInPage();
                  }),
                );
              })
        ],
      ),
    );
  }
}
