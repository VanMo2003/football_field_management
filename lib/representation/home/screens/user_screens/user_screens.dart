import 'package:flutter/material.dart';
import 'package:football_field_management_demo/core/constants/color_theme.dart';
import 'package:football_field_management_demo/http/network/user_network.dart';
import 'package:provider/provider.dart';

import '../../../../blocs/login_bloc/export_bloc.dart';

class UserHomeScreens extends StatelessWidget {
  UserHomeScreens({super.key, required this.username});
  String username;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserNetwork.getUser(username),
      builder: (context, snapshot) {
        var data = snapshot.data;
        if (data == null) {
          return CircularProgressIndicator();
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('User Screens'),
            actions: [
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.logout,
                  size: 14,
                ),
                label: const Text('Log out'),
                onPressed: () async {
                  context.read<MyAppBLoc>().add(const LogoutEnvent());

                  debugPrint('sign out');
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                      MaterialStateProperty.all(ColorTheme.colorPrimary),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
