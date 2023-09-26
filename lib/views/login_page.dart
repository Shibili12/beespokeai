import 'package:beespokeai/services/http_service.dart';
import 'package:beespokeai/views/product_page.dart';

import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool ispasswordvissible = false;
  final usernamecontroller = TextEditingController(text: 'mor_2314');
  final passwordcontroller = TextEditingController(text: '83r5^_');

  // late bool newuser;
  // @override
  // void initState() {
  //   check_user_already_login();
  //   super.initState();
  // }

  // void check_user_already_login() async {
  //   preferences = await SharedPreferences.getInstance();
  //   newuser = preferences.getBool('newuser') ?? true;
  //   if (newuser == false) {
  //     Navigator.of(context)
  //         .push(MaterialPageRoute(builder: ((context) => Producthome())));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Image.asset(
              "assets/images/beespoke.png",
              width: 250,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "  Welcome Again...",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: usernamecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  hintText: "Enter Username",
                  filled: true,
                  fillColor: Colors.purple[50],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: TextFormField(
                controller: passwordcontroller,
                obscureText: ispasswordvissible,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  filled: true,
                  fillColor: Colors.purple[50],
                  hintText: "Enter password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        if (ispasswordvissible == false) {
                          ispasswordvissible = true;
                        } else {
                          ispasswordvissible = false;
                        }
                      });
                    },
                    icon: ispasswordvissible == false
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  minimumSize: Size(344, 50)),
              onPressed: () async {
                final gettoken = await HttpService.login(
                    usernamecontroller.text, passwordcontroller.text);
                if (gettoken != null && gettoken['token'] != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Login successfull")));

                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Producthome()));
                }
              },
              child: Text(
                "Login",
                style: TextStyle(fontSize: 18),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text("Don't have an account?"),
            //     TextButton(
            //       onPressed: () {
            //         Navigator.of(context).push(MaterialPageRoute(
            //             builder: ((context) => Registrationpage())));
            //       },
            //       child: Text(
            //         "Register here",
            //         style: TextStyle(color: Colors.deepPurple),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
