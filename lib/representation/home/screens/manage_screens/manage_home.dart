import 'dart:math';

import 'package:flutter/material.dart';
import 'package:football_field_management_demo/core/constants/color_theme.dart';
import 'package:football_field_management_demo/representation/home/screens/manage_screens/manage_body.dart';

class ManageHomeScreens extends StatefulWidget {
  ManageHomeScreens(
      {super.key, required this.nameField, required this.totalYards});
  String nameField;
  int totalYards;
  @override
  State<ManageHomeScreens> createState() => _ManageHomeScreensState();
}

class _ManageHomeScreensState extends State<ManageHomeScreens> {
  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(isDrawerOpen ? 0.9 : 1.0)
        ..rotateZ(isDrawerOpen ? pi / 20 : 0),
      child: Container(
        decoration: BoxDecoration(
            color: ColorTheme.colorPrimary,
            borderRadius: BorderRadius.circular(40)),
        child: SafeArea(
          top: true,
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: ColorTheme.colorPrimary,
                title: Text(
                  widget.nameField,
                  style: const TextStyle(
                    fontSize: 32,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                centerTitle: true,
                toolbarHeight: 100,
                leading: GestureDetector(
                  onTap: () {
                    if (isDrawerOpen) {
                      setState(() {
                        xOffset = 0;
                        yOffset = 0;
                        isDrawerOpen = false;
                      });
                    } else {
                      setState(() {
                        xOffset = size.width - 140;
                        yOffset = size.height / 5;
                        isDrawerOpen = true;
                      });
                    }
                  },
                  child: const Icon(
                    Icons.menu,
                  ),
                ),
              ),
              body: ManageBody(
                totalYards: widget.totalYards,
                nameField: widget.nameField,
              )),
        ),
      ),
    );
  }
}
