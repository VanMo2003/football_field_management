// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_field_management_demo/blocs/login_bloc/export_bloc.dart';
import 'package:football_field_management_demo/representation/home/widgets/manage_widget/message.dart';
import 'package:football_field_management_demo/representation/home/widgets/manage_widget/new_row.dart';
import 'package:provider/provider.dart';

class SideBarPage extends StatefulWidget {
  SideBarPage({super.key, required this.username, required this.nameManage});

  String nameManage;
  String username;

  @override
  State<SideBarPage> createState() => _SideBarPageState();
}

class _SideBarPageState extends State<SideBarPage> {
  // final AuthServices auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.greenAccent,
        body: Padding(
          padding: const EdgeInsets.only(top: 60, left: 20, bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 38,
                    child: Icon(Icons.person, color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.nameManage,
                    style: const TextStyle(fontSize: 32, color: Colors.white),
                  ),
                  Text(
                    widget.username,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  NewRow(
                    icon: Icons.message,
                    title: 'Message',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TweenAnimationBuilder<double>(
                            tween: Tween<double>(begin: 0.5, end: 1),
                            duration: const Duration(milliseconds: 300),
                            builder: (context, value, child) {
                              return Transform.scale(
                                scale: value,
                                child: const MessagePage(),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  NewRow(
                    icon: Icons.group,
                    title: 'Group',
                    onTap: () {},
                  ),
                  NewRow(
                    icon: Icons.favorite,
                    title: 'Favorite',
                    onTap: () {},
                  ),
                  NewRow(
                    icon: Icons.bookmark_border,
                    title: 'Save',
                    onTap: () {},
                  ),
                  NewRow(
                    icon: Icons.person_outline,
                    title: 'Profile',
                    onTap: () {},
                  ),
                  NewRow(
                    icon: Icons.settings,
                    title: 'Settings',
                    onTap: () {},
                  ),
                ],
              ),
              NewRow(
                icon: Icons.cancel,
                title: 'Logout',
                onTap: () async {
                  context.read<MyAppBLoc>().add(const LogoutEnvent());
                  debugPrint('sign out');
                  // await auth.signOut();
                },
                isColor: true,
              )
            ],
          ),
        ));
  }
}
