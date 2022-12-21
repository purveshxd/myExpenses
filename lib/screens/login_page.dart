import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myexpenses/constants/constants.dart';
import 'package:myexpenses/screens/registration_page.dart';
import 'package:myexpenses/widgets/input_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passController = TextEditingController();

  void login() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passController.text);
      debugPrint(emailController.text);
      debugPrint(passController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        customAlert('Incorrect Email');
      } else if (e.code == 'wrong-password') {
        customAlert('Incorrect Password');
      }
    }
  }

  void customAlert(String textError) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(textError),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(Constants().loginBanner),
                ),
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              "Welcome back, we missed you",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey.shade600),
            ),
            Text(
              textAlign: TextAlign.center,
              "Get back to tracking your expanses",
              style: TextStyle(
                  height: 2,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade600),
            ),
            const SizedBox(
              height: 15,
            ),
            InputTextField(hintText: "Email", textController: emailController),
            const SizedBox(
              height: 15,
            ),
            InputTextField(
                hintText: "Password", textController: passController),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Forgot Password?",
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            MaterialButton(
              minWidth: MediaQuery.of(context).size.shortestSide,
              height: 55,
              elevation: 0,
              color: Colors.amber,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              onPressed: login,
              child: const Text(
                "Login",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    endIndent: 5,
                    thickness: 0.3,
                    color: Colors.grey.shade600,
                  ),
                ),
                const Text("Or Sign-in with"),
                Expanded(
                  child: Divider(
                    indent: 5,
                    thickness: 0.3,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            IconButton(
              iconSize: 40,
              color: Colors.red,
              padding: const EdgeInsets.all(0),
              onPressed: () {},
              icon: Image.asset(
                Constants().googleLogo,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member? ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.normal),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => RegistrationPage(),
                    ));
                  },
                  child: Text(
                    "Register Now",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.blue.shade600,
                        fontWeight: FontWeight.bold),
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
