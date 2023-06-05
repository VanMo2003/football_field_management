import 'package:flutter/material.dart';
import 'package:football_field_management_demo/http/network/football_field_network.dart';
import 'package:football_field_management_demo/representation/home/screens/manage_screens/manage_screen.dart';
import 'package:football_field_management_demo/representation/home/screens/manage_screens/manage_screens.dart';
import 'package:football_field_management_demo/representation/home/screens/manage_screens/sidebar_page.dart';
import 'package:football_field_management_demo/representation/home/screens/user_screens/user_screens.dart';

class HomeScreens extends StatefulWidget {
  HomeScreens({super.key, required this.username, required this.permission});

  String username;
  bool permission;

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  Widget build(BuildContext context) {
    if (widget.permission) {
      debugPrint('manage');
      return ManageScreen(
        username: widget.username,
      );
    } else {
      debugPrint('user');
      return UserHomeScreens(
        username: widget.username,
      );
    }
  }
}
