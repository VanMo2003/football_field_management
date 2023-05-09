import 'package:flutter/material.dart';
import 'package:football_field_management_demo/blocs/login_bloc/export_bloc.dart';
import 'package:football_field_management_demo/models/account.dart';
import 'package:football_field_management_demo/representation/screens/myapp_page.dart';
import 'package:football_field_management_demo/services/auth_service.dart';
import 'package:provider/provider.dart';

class WrapperScreens extends StatelessWidget {
  WrapperScreens({super.key});
  final AuthServices _authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AccountModel?>(context);
    if (!_authServices.isLogin()) {
      return MyAppPage(stateInitial: const LoginState());
    } else {
      return MyAppPage(stateInitial: const HomeState());
    }
  }
}
