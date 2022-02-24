// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyHome());
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Firebase", debugShowCheckedModeBanner: false, home: Body());
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
      padding: EdgeInsets.all(25),
      child: Column(
        children: <Widget>[
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
                users.add({
                  'name' : emailController.text,
                  'password' : passController.text,
                });
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
                  borderRadius: BorderRadius.circular(15)
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
