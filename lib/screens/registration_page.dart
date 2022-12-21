import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myexpenses/constants/constants.dart';
import 'package:myexpenses/screens/login_page.dart';
import 'package:myexpenses/widgets/input_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passController = TextEditingController();

  void register() async {
    var resp = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, password: passController.text);
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
              height: 15,
            ),
            InputTextField(hintText: "Name", textController: nameController),
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
                const Text("Or Sign-up with"),
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
              height: 30,
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
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
                  },
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
    );
  }
}
