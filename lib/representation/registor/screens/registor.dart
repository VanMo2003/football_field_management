// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:football_field_management_demo/core/constants/check_permistion.dart';
import 'package:football_field_management_demo/core/constants/text_style.dart';
import 'package:football_field_management_demo/core/constants/value_theme.dart';
import 'package:football_field_management_demo/core/helper/assets_helper.dart';
import 'package:football_field_management_demo/http/model/account.dart';
import 'package:football_field_management_demo/http/network/account_network.dart';
import 'package:football_field_management_demo/representation/widgets/background_login.dart';
import 'package:football_field_management_demo/representation/widgets/button_login.dart';
import 'package:football_field_management_demo/representation/registor/widgets/dropdown_button.dart';
import 'package:football_field_management_demo/representation/widgets/loading.dart';
import 'package:football_field_management_demo/representation/widgets/text_field_login.dart';
import 'package:provider/provider.dart';

import '../../../blocs/login_bloc/export_bloc.dart';

class RegistorScreens extends StatefulWidget {
  const RegistorScreens({super.key});

  @override
  State<RegistorScreens> createState() => _RegistorScreensState();
}

class _RegistorScreensState extends State<RegistorScreens> {
  // final AuthServices authServices = AuthServices();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  final _keyForm = GlobalKey<FormState>();
  bool isLoading = false;

  String error = '';
  bool isClickText = false;

  List permission = ['Manage', 'User'];
  String textPermission = '';

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
                    Image.asset(AssetHelper.iconLogin),
                    const Text(
                      'Registor',
                      style: TextStyleConstants.textLoginStyle,
                    ),
                    const SizedBox(height: 20),
                    boxTextField('Email', false, _email),
                    const SizedBox(height: 20),
                    boxTextField('Password', true, _password),
                    const SizedBox(height: 20),
                    customDropDrownButton(
                      permission,
                      textPermission,
                      (value) {
                        setState(() {
                          textPermission = value.toString();
                        });
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isClickText = true;
                          isLoading = true;
                        });
                        Future.delayed(
                          const Duration(milliseconds: 200),
                          () {
                            setState(() {
                              isClickText = false;
                              isLoading = false;
                            });
                            context
                                .read<MyAppBLoc>()
                                .add(const LoginAndRegistorEvent());
                          },
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          decoration: !isClickText
                              ? TextDecoration.none
                              : TextDecoration.underline,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ButtonLogin(
                      onPressed: () {
                        clickButtonRegistor(context);
                      },
                      title: 'Registor',
                    ),
                    const SizedBox(height: 10),
                    Text(
                      error,
                      style: TextStyle(
                        color: Colors.red.shade700,
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                      ),
                    ),
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

  Widget boxTextField(
    String hintText,
    bool isPassword,
    TextEditingController controller,
  ) {
    return Padding(
      padding: ValueTheme.padingTextFieldLogin,
      child: TextFieldLogin(
        hintText: hintText,
        isPassword: isPassword,
        controller: controller,
        isEmail: _email,
      ),
    );
  }

  void clickButtonRegistor(BuildContext context) {
    debugPrint(textPermission);
    setState(() {
      isLoading = true;
    });
    Future.delayed(
      const Duration(milliseconds: 900),
      () async {
        if (_keyForm.currentState!.validate()) {
          debugPrint('email: ${_email.text}');
          debugPrint('password: ${_password.text}');
          dynamic result;

          if (textPermission == '') {
            setState(() {
              isLoading = false;
              error = 'You must choose the access right';
            });
          } else {
            Account account = Account(
              userName: _email.text,
              password: _password.text,
              permission: CheckPermission.checkPermission(textPermission),
            );

            dynamic result = await AccountNetwork.postAccount(account);
            debugPrint('result: $result');
            setState(() {
              isLoading = false;
            });

            if (result == 200) {
              context.read<MyAppBLoc>().add(
                  RegistorEvent(account.getPermission ?? false, _email.text));
              debugPrint('Registor Successfully');
            } else {
              setState(() {
                error = result;
                debugPrint('Registor Faild');
              });
            }
          }
        } else {
          setState(() {
            isLoading = false;
            error = '';
          });
        }
      },
    );
  }
}
