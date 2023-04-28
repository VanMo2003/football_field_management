import 'package:flutter/material.dart';
import 'package:football_field_management_demo/core/constants/boder_value.dart';
import 'package:football_field_management_demo/core/constants/color_theme.dart';
import 'package:football_field_management_demo/core/constants/text_style.dart';
import 'package:football_field_management_demo/core/constants/value_theme.dart';

class ButtonLogin extends StatelessWidget {
  ButtonLogin({super.key, required this.onPressed, required this.title});

  String title;

  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ValueTheme.padingButtondLogin,
      width: double.infinity,
      height: 50,
      decoration: const BoxDecoration(
        borderRadius: BoderValue.borderTextField,
      ),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(ColorTheme.colorPrimary),
          foregroundColor: MaterialStatePropertyAll(Colors.black),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BoderValue.borderTextField,
            ),
          ),
          textStyle: MaterialStatePropertyAll(
            TextStyleConstants.buttonLoginStyle,
          ),
        ),
        child: Text(
          title,
        ),
      ),
    );
  }
}
