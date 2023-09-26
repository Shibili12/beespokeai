// import 'dart:convert';

// import 'package:beespokeai/views/login_page.dart';
// import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;

// class Registrationpage extends StatefulWidget {
//   const Registrationpage({super.key});

//   @override
//   State<Registrationpage> createState() => _RegistrationpageState();
// }

// class _RegistrationpageState extends State<Registrationpage> {
//   bool ispasswordvisible1 = false;
//   bool ispasswordvisible2 = false;
//   final usercontroller = TextEditingController();
//   final passcontroller = TextEditingController();
//   final pass2controller = TextEditingController();

//   // void register(String username, String password) async {
//   //   try {
//   //     var response =
//   //         await http.post(Uri.parse("https://reqres.in/api/register"), body: {
//   //       'email': username,
//   //       'password': password,
//   //     });
//   //     if (response.statusCode == 200) {
//   //       var data = jsonDecode(response.body.toString());
//   //       print(data);
//   //       print("Account created");
//   //     } else {
//   //       print("failed");
//   //     }
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 150,
//             ),
//             Image.asset(
//               "assets/images/beespoke.png",
//               width: 250,
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const Text(
//               "  Register Here",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: TextFormField(
//                 controller: usercontroller,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide.none,
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   hintText: "Enter Username",
//                   filled: true,
//                   fillColor: Colors.purple[50],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
//               child: TextFormField(
//                 controller: passcontroller,
//                 obscureText: ispasswordvisible1,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide.none,
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   filled: true,
//                   fillColor: Colors.purple[50],
//                   hintText: "Enter password",
//                   suffixIcon: IconButton(
//                     onPressed: () {
//                       setState(() {
//                         if (ispasswordvisible1 == false) {
//                           ispasswordvisible1 = true;
//                         } else {
//                           ispasswordvisible1 = false;
//                         }
//                       });
//                     },
//                     icon: ispasswordvisible1 == false
//                         ? Icon(Icons.visibility)
//                         : Icon(Icons.visibility_off),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                   left: 20, right: 20, bottom: 10, top: 10),
//               child: TextFormField(
//                 controller: pass2controller,
//                 obscureText: ispasswordvisible2,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide.none,
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   filled: true,
//                   fillColor: Colors.purple[50],
//                   hintText: "Confirm password",
//                   suffixIcon: IconButton(
//                     onPressed: () {
//                       setState(() {
//                         if (ispasswordvisible2 == false) {
//                           ispasswordvisible2 = true;
//                         } else {
//                           ispasswordvisible2 = false;
//                         }
//                       });
//                     },
//                     icon: ispasswordvisible2 == false
//                         ? Icon(Icons.visibility)
//                         : Icon(Icons.visibility_off),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.deepPurple,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   minimumSize: Size(344, 50)),
//               onPressed: () async {
//                 if (usercontroller.text != "" &&
//                     passcontroller.text != "" &&
//                     passcontroller.text == pass2controller.text) {
//                   // register(usercontroller.text, passcontroller.text);
//                 }
//               },
//               child: Text(
//                 "Sign Up",
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("Already have an account?"),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).push(
//                         MaterialPageRoute(builder: ((context) => Loginpage())));
//                   },
//                   child: Text(
//                     "Login",
//                     style: TextStyle(color: Colors.deepPurple),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
