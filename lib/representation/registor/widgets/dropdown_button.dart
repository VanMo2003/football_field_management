import 'package:flutter/material.dart';
import 'package:football_field_management_demo/core/constants/boder_value.dart';
import 'package:football_field_management_demo/core/constants/value_theme.dart';

Widget customDropDrownButton(
  List listPermission,
  String textPermission,
  Function? Function(Object? value) onChanged,
) {
  return Container(
    height: 60,
    width: double.infinity,
    margin: ValueTheme.padingTextFieldLogin,
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 1),
      borderRadius: BoderValue.borderTextField,
    ),
    child: DropdownButton(
      isExpanded: true,
      value: textPermission == '' ? null : textPermission,
      borderRadius: BoderValue.borderTextField,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black,
      ),
      underline: const SizedBox(),
      hint: const Text('Permission'),
      items: listPermission
          .map((permission) => DropdownMenuItem(
                value: permission,
                child: Text(permission),
              ))
          .toList(),
      onChanged: (value) {
        onChanged(value);
      },
    ),
  );
}
