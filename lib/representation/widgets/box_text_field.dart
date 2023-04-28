

import 'package:flutter/material.dart';
import 'package:football_field_management_demo/core/constants/value_theme.dart';
import 'package:football_field_management_demo/representation/widgets/text_field_login.dart';

Widget boxTextField(
  String hintText,
  bool isPassword,
  TextEditingController controller,
) {
  return Padding(
    padding: ValueTheme.padingTextFieldLogin,
    child: TextFieldLogin(
      hintText: hintText,
      isPassword: isPassword,
      controller: controller,
      isEmail: controller,
    ),
  );
}
