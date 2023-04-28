import 'package:flutter/material.dart';
import 'package:football_field_management_demo/core/constants/boder_value.dart';

class TextFieldLogin extends StatelessWidget {
  TextFieldLogin({
    super.key,
    required this.hintText,
    required this.isPassword,
    required this.controller,
    required this.isEmail,
  });
  final String hintText;
  final bool isPassword;
  TextEditingController controller;
  TextEditingController isEmail;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        controller.text = value;
      },
      validator: (value) {
        return controller == isEmail
            ? (value!.isEmpty ? 'Enter an email' : null)
            : (value!.length < 6
                ? 'Enter password with at least 6 characters'
                : null);
      },
      obscureText: isPassword,
      cursorColor: Colors.black,
      cursorHeight: 20,
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Colors.black, fontSize: 18),
        label: Text(hintText),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1),
          borderRadius: BoderValue.borderTextField,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1),
          borderRadius: BoderValue.borderTextField,
        ),
        border: const OutlineInputBorder(
          borderRadius: BoderValue.borderTextField,
        ),
      ),
    );
  }
}
