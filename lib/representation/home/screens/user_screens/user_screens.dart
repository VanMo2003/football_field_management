import 'package:flutter/material.dart';
import 'package:football_field_management_demo/representation/home/screens/user_screens/user_home.dart';
import 'package:football_field_management_demo/representation/home/screens/user_screens/user_settings.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class UserScreens extends StatefulWidget {
  UserScreens({super.key, required this.username});
  String username;

  @override
  State<UserScreens> createState() => _UserScreensState();
}

class _UserScreensState extends State<UserScreens> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: current,
        children: [
          UserHome(username: widget.username),
          const UserSettings(),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: current,
        onTap: (p0) {
          setState(() {
            current = p0;
          });
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.blue.withOpacity(0.2),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.house,
              size: 20,
            ),
            title: const Text('Home'),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.settings,
              size: 20,
            ),
            title: const Text('Settings'),
          ),
        ],
      ),
    );
  }
}
