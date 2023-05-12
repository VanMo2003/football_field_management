import 'package:flutter/material.dart';
import 'package:football_field_management_demo/core/constants/color_theme.dart';
import 'package:football_field_management_demo/models/user.dart';
import 'package:football_field_management_demo/services/auth_service.dart';
import 'package:provider/provider.dart';

import '../../../../blocs/login_bloc/export_bloc.dart';

class UserHomeScreens extends StatelessWidget {
  UserHomeScreens({super.key});

  final AuthServices _authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    debugPrint('${user.nameUser}');
    debugPrint('${user.numberPhone}');
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
              await _authServices.signOut();
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
  }
}
