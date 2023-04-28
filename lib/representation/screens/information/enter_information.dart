// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_field_management_demo/core/constants/check_permistion.dart';
import 'package:football_field_management_demo/representation/widgets/background_login.dart';
import 'package:football_field_management_demo/representation/widgets/information/information.dart';
import 'package:football_field_management_demo/representation/widgets/loading.dart';
import 'package:football_field_management_demo/services/manage_database_services.dart';
import 'package:football_field_management_demo/services/user_database_services.dart';
import 'package:provider/provider.dart';

import '../../../blocs/login_bloc/export_bloc.dart';

class EnterInformationSreens extends StatefulWidget {
  EnterInformationSreens(
      {super.key, required this.uid, required this.permission});

  String uid;
  String permission;

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
                    if (CheckPermission.checkPermission(widget.permission)) ...[
                      CheckWidgetInformation.manageWidget(
                        nameManage,
                        nameField,
                        address,
                        numberYard,
                        clickButtonLogin(context),
                        error,
                      ),
                    ],
                    if (!CheckPermission.checkPermission(
                        widget.permission)) ...[
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
          setState(() {
            isLoading = false;
          });
          context.read<MyAppBLoc>().add(const LoginEvent());

          if (CheckPermission.checkPermission(widget.permission)) {
            debugPrint(
                '${nameManage.text} - ${nameField.text} - ${address.text} - ${numberYard.text}');
            await ManageDatabaseServices(uid: widget.uid).updateManage(
              nameManage.text,
              nameField.text,
              address.text,
              int.parse(numberYard.text),
            );
          } else {
            debugPrint('${nameUser.text} - ${numberPhome.text} ');
            await UserDatabaseServices(uid: widget.uid).updateManage(
              nameUser.text,
              numberPhome.text,
            );
          }
        },
      );
    };
  }
}
