import 'package:flutter/material.dart';
import 'package:myexpenses/constants/constants.dart';
import 'package:myexpenses/widgets/input_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.onTap});
  final Function()? onTap;

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
      } else if (e.message == 'Given String is empty or null') {
        debugPrint(e.code);
        debugPrint(e.message);
        customAlert("Email or Password can't be empty");
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

  // void googleSignIn() {
  //   AuthService().signInWithGoogle();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(Constants.loginBanner),
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
            InputTextField(
                obscureText: false,
                hintText: "Email",
                textController: emailController,
                textInputType: TextInputType.emailAddress),
            const SizedBox(
              height: 15,
            ),
            InputTextField(
                obscureText: true,
                hintText: "Password",
                textController: passController,
                textInputType: TextInputType.visiblePassword),
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

            // const SizedBox(
            //   height: 30,
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: Divider(
            //           endIndent: 5,
            //           thickness: 0.3,
            //           color: Colors.grey.shade600,
            //         ),
            //       ),
            //       const Text("Or Sign-in with"),
            //       Expanded(
            //         child: Divider(
            //           indent: 5,
            //           thickness: 0.3,
            //           color: Colors.grey.shade600,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: IconButton(
            //     iconSize: 40,
            //     color: Colors.red,
            //     padding: const EdgeInsets.all(0),
            //     onPressed: () => AuthService().signInWithGoogle(),
            //     icon: Image.asset(
            //       Constants.googleLogo,
            //     ),
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
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
                    onTap: widget.onTap,
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
            ),
          ],
        ),
      ),
    );
  }
}
