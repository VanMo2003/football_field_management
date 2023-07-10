// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:football_field_management_demo/core/constants/color_theme.dart';
import 'package:football_field_management_demo/representation/wrapper.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primaryColor: ColorTheme.colorPrimary,
        primarySwatch: getMaterialColor(ColorTheme.colorPrimary),
      ),
      home: WrapperScreens(),
    );
  }
}
