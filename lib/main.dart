// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:football_field_management_demo/core/constants/color_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:football_field_management_demo/models/account.dart';
import 'package:football_field_management_demo/representation/wrapper.dart';
import 'package:football_field_management_demo/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<AccountModel?>.value(
      value: AuthServices().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        theme: ThemeData(
          primaryColor: ColorTheme.colorPrimary,
          primarySwatch: getMaterialColor(ColorTheme.colorPrimary),
        ),
        home: const WrapperScreens(),
      ),
    );
  }
}
