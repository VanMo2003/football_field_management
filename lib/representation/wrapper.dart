import 'package:flutter/material.dart';
import 'package:football_field_management_demo/blocs/login_bloc/export_bloc.dart';
import 'package:football_field_management_demo/representation/myapp_page.dart';
import 'package:football_field_management_demo/services/auth_service.dart';

class WrapperScreens extends StatefulWidget {
  WrapperScreens({super.key});

  @override
  State<WrapperScreens> createState() => _WrapperScreensState();
}

class _WrapperScreensState extends State<WrapperScreens> {
  // final AuthServices _authServices = AuthServices();
  String? emailLogin;
  bool? permission;
  @override
  void initState() {
    super.initState();
    debugPrint('login : $emailLogin, $permission');
    getLogin();
    debugPrint('login : $emailLogin, $permission');
  }

  void getLogin() async {
    emailLogin = await AuthServices().getLogin();
    permission = await AuthServices().getPermission();
  }

  @override
  Widget build(BuildContext context) {
    if (emailLogin == null) {
      return MyAppPage(
        stateInitial: const LoginState(),
      );
    } else {
      return MyAppPage(
        stateInitial: HomeState(emailLogin!, permission!),
      );
    }
  }
}
