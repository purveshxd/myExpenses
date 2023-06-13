import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myexpenses/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

AppBar customAppBar(context, void Function() deleteDatabase) {
  void signout() async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Sign Out?",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(
            "Do you want to sign out? All your transactions will be erased!"),
        actions: [
          MaterialButton(
            height: 50,
            elevation: 0,
            color: Colors.red.shade200,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Cancel",
              style: TextStyle(fontSize: 18),
            ),
          ),
          MaterialButton(
            height: 50,
            elevation: 0,
            color: Colors.amber,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              deleteDatabase();
              Navigator.pop(context);
            },
            child: const Text(
              "Sign Out",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
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
