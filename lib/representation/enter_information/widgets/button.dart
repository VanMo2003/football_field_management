import 'package:flutter/material.dart';
import 'package:football_field_management_demo/representation/widgets/button_login.dart';

Widget button(Function onPressed, String error) {
  return Column(
    children: [
      ButtonLogin(
        onPressed: () {
          onPressed();
        },
        title: 'Successfully',
      ),
      const SizedBox(height: 10),
      Text(
        error,
        style: TextStyle(
          color: Colors.red.shade700,
          fontStyle: FontStyle.italic,
          fontSize: 16,
        ),
      ),
    ],
  );
}
