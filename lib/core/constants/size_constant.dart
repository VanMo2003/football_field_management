import 'package:flutter/material.dart';

class SizeConstant {
  static double sizeHeightScreen(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double sizeWidthScreen(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
