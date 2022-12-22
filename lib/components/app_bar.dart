import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myexpenses/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

AppBar customAppBar(context) {
  void signout() {
    FirebaseAuth.instance.signOut();
  }

  void onLongPress() {
    launchUrl(Uri.parse(Constants.googleForm),
        mode: LaunchMode.externalApplication, webOnlyWindowName: "_blank");
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
          onLongPress: onLongPress,
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
