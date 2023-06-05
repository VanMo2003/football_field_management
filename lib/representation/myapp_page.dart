// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_field_management_demo/representation/home/screens/home_screens.dart';
import 'package:football_field_management_demo/representation/enter_information/screens/enter_information.dart';
import 'package:football_field_management_demo/representation/registor/screens/registor.dart';
import 'package:football_field_management_demo/representation/login/screens/login.dart';

import '../blocs/login_bloc/export_bloc.dart';

class MyAppPage extends StatelessWidget {
  MyAppPage({super.key, required this.stateInitial});
  MyAppState stateInitial;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyAppBLoc(stateInitial),
      child: BlocBuilder<MyAppBLoc, MyAppState>(
        buildWhen: (previous, state) =>
            previous.runtimeType != state.runtimeType,
        builder: (context, state) {
          if (state is LoginState) {
            return const SignInScreens();
          }
          if (state is RegistorState) {
            return const RegistorScreens();
          }
          if (state is InformationState) {
            return EnterInformationSreens(
              username: state.username,
              permission: state.permission,
            );
          }
          if (state is HomeState) {
            return HomeScreens(
              username: state.username,
              permission: state.permission,
            );
          }

          return Container();
        },
      ),
    );
  }
}
