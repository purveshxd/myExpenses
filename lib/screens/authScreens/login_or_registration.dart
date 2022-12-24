import 'package:flutter/material.dart';
import 'package:myexpenses/screens/authScreens/login_page.dart';
import 'package:myexpenses/screens/authScreens/registration_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
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
    if (showLoginPage) {
      return LoginPage(
        onTap: togglePages,
      );
    } else {
      return RegistrationPage(
        onTap: togglePages,
      );
    }
  }
}
