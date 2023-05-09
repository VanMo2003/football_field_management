import 'package:flutter/material.dart';
import 'package:football_field_management_demo/core/constants/color_theme.dart';
import 'package:football_field_management_demo/models/account.dart';
import 'package:football_field_management_demo/models/manage.dart';
import 'package:football_field_management_demo/services/auth_service.dart';
import 'package:football_field_management_demo/services/manage_database_services.dart';
import 'package:provider/provider.dart';

import '../../../blocs/login_bloc/export_bloc.dart';

class ManageHomeScreens extends StatelessWidget {
  ManageHomeScreens({super.key});

  final AuthServices _authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AccountModel?>(context);

    return StreamProvider<Manage?>.value(
      value: ManageDatabaseServices(uid: user?.uid).manage,
      initialData: Manage(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Manage Screens'),
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
      },
    );
  }
}
