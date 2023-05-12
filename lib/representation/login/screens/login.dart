// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_field_management_demo/blocs/login_bloc/myapp_bloc.dart';
import 'package:football_field_management_demo/blocs/login_bloc/myapp_event.dart';
import 'package:football_field_management_demo/core/constants/text_style.dart';
import 'package:football_field_management_demo/core/constants/value_theme.dart';
import 'package:football_field_management_demo/core/helper/assets_helper.dart';
import 'package:football_field_management_demo/representation/widgets/background_login.dart';
import 'package:football_field_management_demo/representation/widgets/button_login.dart';
import 'package:football_field_management_demo/representation/widgets/loading.dart';
import 'package:football_field_management_demo/representation/widgets/text_field_login.dart';
import 'package:football_field_management_demo/services/auth_service.dart';

class SignInScreens extends StatefulWidget {
  const SignInScreens({super.key});

  @override
  State<SignInScreens> createState() => _SignInScreensState();
}

class _SignInScreensState extends State<SignInScreens> {
  final AuthServices authServices = AuthServices();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

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
                    Image.asset(AssetHelper.iconLogin),
                    const Text('Login',
                        style: TextStyleConstants.textLoginStyle),
                    const SizedBox(height: 20),
                    boxTextField('Email', false, _email),
                    const SizedBox(height: 20),
                    boxTextField('Password', true, _password),
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
                        'Create new account',
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
                        clickButtonLogin(context);
                      },
                      title: 'Login',
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Center(
                        child: Text(
                          error,
                          style: TextStyle(
                            color: Colors.red.shade700,
                            fontStyle: FontStyle.italic,
                            fontSize: 16,
                          ),
                        ),
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

  void clickButtonLogin(BuildContext context) {
    setState(() {
      isLoading = true;
    });

    Future.delayed(
      const Duration(seconds: 1),
      () async {
        if (_keyForm.currentState!.validate()) {
          debugPrint('email: ${_email.text}');
          debugPrint('password: ${_password.text}');

          dynamic result = await authServices.signWithEmailAndPassword(
            _email.text,
            _password.text,
          );
          setState(() {
            isLoading = false;
          });

          if (result != null) {
            context.read<MyAppBLoc>().add(LoginEvent(result.uid));
            debugPrint('Login Successfully');
          } else {
            Future.delayed(
              const Duration(seconds: 1),
              () {
                setState(() {
                  error = result;
                  debugPrint('Login Faild');
                });
              },
            );
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
