import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  InputTextField({
    Key? key,
    required this.hintText,
    required this.textController,
    this.textInputType,
    required this.obscureText,
  }) : super(key: key);
  final String hintText;
  final TextEditingController textController;
  final TextInputType? textInputType;
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      textInputAction: TextInputAction.next,
      controller: textController,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100,
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
    );
  }
}
