import 'package:flutter/material.dart';
import 'package:football_field_management_demo/core/constants/text_style.dart';
import 'package:football_field_management_demo/core/helper/assets_helper.dart';
import 'package:football_field_management_demo/representation/widgets/box_text_field.dart';
import 'package:football_field_management_demo/representation/widgets/button_login.dart';
import 'package:football_field_management_demo/representation/widgets/information/button.dart';

class CheckWidgetInformation {
  static Widget manageWidget(
    TextEditingController nameManage,
    TextEditingController nameField,
    TextEditingController address,
    TextEditingController numberYard,
    Function onPressed,
    String error,
  ) {
    return Column(
      children: [
        Image.asset(AssetHelper.iconLogin),
        const Text(
          'Information',
          style: TextStyleConstants.textLoginStyle,
        ),
        const SizedBox(height: 20),
        boxTextField('Name Manage', false, nameManage),
        const SizedBox(height: 20),
        boxTextField('Name Field', false, nameField),
        const SizedBox(height: 20),
        boxTextField('Address', false, address),
        const SizedBox(height: 20),
        boxTextField('Number Yard', false, numberYard),
        const SizedBox(height: 20),
        button(onPressed, error),
      ],
    );
  }

  static Widget userWidget(
    TextEditingController nameUser,
    TextEditingController numberPhome,
    Function onPressed,
    String error,
  ) {
    return Column(
      children: [
        Image.asset(AssetHelper.iconLogin),
        const Text(
          'Information',
          style: TextStyleConstants.textLoginStyle,
        ),
        const SizedBox(height: 20),
        boxTextField('Name User', false, nameUser),
        const SizedBox(height: 20),
        boxTextField('Number Phone', false, numberPhome),
        const SizedBox(height: 20),
        button(onPressed, error),
      ],
    );
  }
}
