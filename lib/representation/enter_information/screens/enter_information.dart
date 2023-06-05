// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_field_management_demo/http/model/footbal_field_model.dart';
import 'package:football_field_management_demo/http/model/user.dart';
import 'package:football_field_management_demo/http/network/football_field_network.dart';
import 'package:football_field_management_demo/http/network/user_network.dart';
import 'package:football_field_management_demo/representation/widgets/background_login.dart';
import 'package:football_field_management_demo/representation/enter_information/widgets/information.dart';
import 'package:football_field_management_demo/representation/widgets/loading.dart';

import '../../../blocs/login_bloc/export_bloc.dart';

class EnterInformationSreens extends StatefulWidget {
  EnterInformationSreens(
      {super.key, required this.username, required this.permission});

  bool permission;
  String username;

  @override
  State<EnterInformationSreens> createState() => _EnterInformationSreensState();
}

class _EnterInformationSreensState extends State<EnterInformationSreens> {
  final TextEditingController nameManage = TextEditingController();
  final TextEditingController nameUser = TextEditingController();
  final TextEditingController nameField = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController numberYard = TextEditingController();
  final TextEditingController numberPhome = TextEditingController();

  final _keyForm = GlobalKey<FormState>();

  String error = '';
  bool isClickText = false;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      child: Stack(
        children: [
          Scaffold(
            body: BackgroundLogin(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.permission) ...[
                      CheckWidgetInformation.manageWidget(
                        nameManage,
                        nameField,
                        address,
                        numberYard,
                        clickButtonLogin(context),
                        error,
                      ),
                    ],
                    if (!widget.permission) ...[
                      CheckWidgetInformation.userWidget(
                        nameUser,
                        numberPhome,
                        clickButtonLogin(context),
                        error,
                      ),
                    ]
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: isLoading ? loading() : null,
          )
        ],
      ),
    );
  }

  Function clickButtonLogin(BuildContext context) {
    return () {
      setState(() {
        isLoading = true;
      });
      Future.delayed(
        const Duration(seconds: 1),
        () async {
          dynamic result;
          if (widget.permission) {
            FootballField footballField = FootballField(
              username: widget.username,
              nameFootballField: nameField.text,
              nameManage: nameManage.text,
              totalYards: int.parse(numberYard.text),
            );

            result = await FootballFieldNetwork.postFootballFied(footballField);
          } else {
            User user = User(
              username: widget.username,
              nameUser: nameUser.text,
              phoneNumber: numberPhome.text,
            );

            result = await UserNetwork.postUser(user);
          }

          setState(() {
            isLoading = false;
          });
          if (result == 200) {
            context
                .read<MyAppBLoc>()
                .add(LoginEvent(widget.username, widget.permission));
          }

          if (widget.permission) {
            debugPrint(
                '${nameManage.text} - ${nameField.text} - ${address.text} - ${numberYard.text}');
          } else {
            debugPrint('${nameUser.text} - ${numberPhome.text} ');
          }
        },
      );
    };
  }
}
