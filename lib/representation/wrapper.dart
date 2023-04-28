import 'package:flutter/material.dart';
import 'package:football_field_management_demo/blocs/login_bloc/myapp_state.dart';
import 'package:football_field_management_demo/models/account.dart';
import 'package:football_field_management_demo/representation/screens/myapp_page.dart';
import 'package:provider/provider.dart';

class WrapperScreens extends StatelessWidget {
  const WrapperScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AccountModel?>(context);

    if (user == null) {
      return MyAppPage(stateInitial: const LoginState());
    } else {
      return MyAppPage(stateInitial: const HomeState());
    }
  }
}
