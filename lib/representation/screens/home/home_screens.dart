import 'package:flutter/material.dart';
import 'package:football_field_management_demo/models/account.dart';
import 'package:football_field_management_demo/representation/screens/home/manage_screens.dart';
import 'package:football_field_management_demo/representation/screens/home/user_screens.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool permission = false;

  void getPermission(String? uid) async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      permission = prefs.getBool(uid ?? '') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AccountModel?>(context);
    getPermission(user?.uid);
    if (permission) {
      return ManageHomeScreens();
    } else {
      return UserHomeScreens();
    }
  }
}
