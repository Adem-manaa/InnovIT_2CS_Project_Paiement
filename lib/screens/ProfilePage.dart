import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:innovit_2cs_project_paiement/screens/SignInPage.dart';
import 'package:innovit_2cs_project_paiement/utilities/constants.dart';
import 'package:innovit_2cs_project_paiement/widgets/RoundedColoredButton.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/user_provider.dart';
import 'PaymentMethodsPage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  String? name = '';
  String? email = '';
  String? url = '';

  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? nom = prefs.getString('name');
    String? mail = prefs.getString('email');
    String? uri = prefs.getString('photoUrl');
    setState(() {
      name = nom;
      email = mail;
      url = uri;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
            Icon(
              Icons.person_outline,
              size: 80,
            ),
            //   CircleAvatar(
            //   radius: 50,
            //   backgroundImage: NetworkImage(url!),
            // ),
              Text(
                name ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
              Text(
                email ?? '',
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
                child: Row(
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
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentMethodsPage()));
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.only(left: 50)),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                ),
                child: Row(
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
                child: Row(
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
                child: Row(
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
              width: 240,
              height: 50,
              text: 'logout',
              textColor: Colors.white,
              fillColor: coffeeBrown,
              shadowBlurRadius: 1,
              onPressed: (){
                //todo :
                logout();
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

Future<void> logout() async {
  final googleSignIn = GoogleSignIn();
  await googleSignIn.disconnect();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('loggedIn', false);
}
