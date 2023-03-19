// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myexpenses/constants/constants.dart';
import 'package:myexpenses/firebaseDatabase/firebaseDatabase.dart';
import 'package:myexpenses/widgets/input_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key, this.onTap});
  final Function()? onTap;

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final emailController = TextEditingController();
  final confirmpassController = TextEditingController();
  final passController = TextEditingController();
  final userNameController = TextEditingController();

  void register() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    try {
      if (passController.text == confirmpassController.text) {
        if (userNameController.text.isNotEmpty) {
          var resp = await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailController.text, password: passController.text);
          await resp.user!
              .updateDisplayName(userNameController.text)
              .whenComplete(() {
            Navigator.pop(context);
          }).whenComplete(() => FirebaseDatabse().setDefaultTransaction());
        } else {
          Navigator.pop(context);
          customAlert('Enter username');
        }
      } else {
        Navigator.pop(context);
        customAlert("Password does not match");
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      debugPrint(e.message);
      if (e.message == 'Given String is empty or null') {
        customAlert("Fields can't be empty");
      }
    }
  }

  void customAlert(String? textError) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(textError!),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 6,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(Constants.loginBanner),
                    ),
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Welcome to myExpenses",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600),
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Start tracking your expenses",
                  style: TextStyle(
                      height: 2,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade600),
                ),
                const SizedBox(
                  height: 10,
                ),
                InputTextField(
                    obscureText: false,
                    hintText: "Username",
                    textController: userNameController,
                    textInputType: TextInputType.name),
                const SizedBox(
                  height: 10,
                ),
                InputTextField(
                    obscureText: false,
                    hintText: "Email",
                    textController: emailController,
                    textInputType: TextInputType.emailAddress),
                const SizedBox(
                  height: 10,
                ),
                InputTextField(
                    obscureText: true,
                    hintText: "Password",
                    textController: passController,
                    textInputType: TextInputType.visiblePassword),
                const SizedBox(
                  height: 10,
                ),
                InputTextField(
                  obscureText: true,
                  hintText: "Confirm Password",
                  textController: confirmpassController,
                  textInputType: TextInputType.visiblePassword,
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
                  onPressed: register,
                  child: const Text(
                    "SignUp",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                // Row(
                //   children: [
                //     Expanded(
                //       child: Divider(
                //         endIndent: 5,
                //         thickness: 0.5,
                //         color: Colors.grey.shade600,
                //       ),
                //     ),
                //     const Text("or continue with"),
                //     Expanded(
                //       child: Divider(
                //         indent: 5,
                //         thickness: 0.5,
                //         color: Colors.grey.shade600,
                //       ),
                //     ),
                //   ],
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // IconButton(
                //   // iconSize: ,
                //   color: Colors.red,
                //   padding: const EdgeInsets.all(0),
                //   onPressed: () {},
                //   icon: Image.asset(
                //     Constants.googleLogo,
                //   ),
                // ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member? ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Sign-up",
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
        ),
      ),
    );
  }
}
