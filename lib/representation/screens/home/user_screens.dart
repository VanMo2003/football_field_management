import 'package:flutter/material.dart';

class UserHomeScreens extends StatefulWidget {
  const UserHomeScreens({super.key});

  @override
  State<UserHomeScreens> createState() => _UserHomeScreensState();
}

class _UserHomeScreensState extends State<UserHomeScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Home'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('User Screens'),
      ),
    );
  }
}
