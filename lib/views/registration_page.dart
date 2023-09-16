import 'package:beespokeai/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Registrationpage extends StatefulWidget {
  const Registrationpage({super.key});

  @override
  State<Registrationpage> createState() => _RegistrationpageState();
}

class _RegistrationpageState extends State<Registrationpage> {
  bool ispasswordvisible1 = false;
  bool ispasswordvisible2 = false;
  final usercontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final pass2controller = TextEditingController();
  late SharedPreferences preferences;
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
              "  Register Here",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: usercontroller,
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
                controller: passcontroller,
                obscureText: ispasswordvisible1,
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
                        if (ispasswordvisible1 == false) {
                          ispasswordvisible1 = true;
                        } else {
                          ispasswordvisible1 = false;
                        }
                      });
                    },
                    icon: ispasswordvisible1 == false
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 10, top: 10),
              child: TextFormField(
                controller: pass2controller,
                obscureText: ispasswordvisible2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  filled: true,
                  fillColor: Colors.purple[50],
                  hintText: "Confirm password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        if (ispasswordvisible2 == false) {
                          ispasswordvisible2 = true;
                        } else {
                          ispasswordvisible2 = false;
                        }
                      });
                    },
                    icon: ispasswordvisible2 == false
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
                preferences = await SharedPreferences.getInstance();
                String username = usercontroller.text;
                String password = passcontroller.text;
                String confirmpass = pass2controller.text;
                if (username != "" &&
                    password != "" &&
                    password == confirmpass) {
                  preferences.setString('uname', username);
                  preferences.setString('password', password);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => Loginpage()),
                      ));
                }
              },
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: ((context) => Loginpage())));
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.deepPurple),
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
