import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(context) {
  void signout() {
    FirebaseAuth.instance.signOut();
  }

  return AppBar(
    elevation: 0,
    backgroundColor: Colors.amberAccent,
    title: const Text(
      "myExpenses",
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: signout,
          child: const CircleAvatar(
            // backgroundColor: Colors.amber.shade50,
            child: Icon(
              Icons.logout_rounded,
              color: Colors.black,
            ),
          ),
        ),
      ),
    ],
  );
}
