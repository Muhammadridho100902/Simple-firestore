// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase/Route.dart' as route;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyHome());
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Firebase",
      debugShowCheckedModeBanner: false,
      onGenerateRoute: route.controller,
      initialRoute: route.bodyPage,
    );
  }
}

class Body extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: 100, left: 20, right: 20),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              "Sign Up",
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            TextFormField(
              controller: passController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: FlatButton(
                onPressed: () {
                  final String email = emailController.text.trim();
                  final String password = passController.text.trim();

                  // users.add({
                  //   'name': emailController.text,
                  //   'password': passController.text,
                  // });

                  if (email.isEmpty || password.isEmpty) {
                    print("Make sure your email and password correct");
                  } else {
                    users.add({
                      'name': emailController.text,
                      'password': passController.text,
                    });
                  }
                  // untuk membuat textfield kembali kosong
                  emailController.text = '';
                  passController.text = '';
                },
                child: Container(
                  height: 50,
                  width: 100,
                  child: Center(
                    child: Text(
                      "Insert",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 20),
            //   child: RichText(
            //     text: TextSpan(
            //       style: TextStyle(color: Colors.black, fontSize: 16),
            //       children: <TextSpan>[
            //         TextSpan(text: "Already Have an account?"),
            //         TextSpan(
            //             text: " Login",
            //             style: TextStyle(
            //                 color: Colors.amber,
            //                 fontSize: 16,
            //                 fontWeight: FontWeight.w500))
            //       ],
            //     ),
            //   ),
            // )
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 65,
              ),
              child: Row(
                children: [
                  Text(
                    "Already Have an account?",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        'login_page',
                      );
                    },
                    child: Text(
                      " Login",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.amber,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
