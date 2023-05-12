import 'package:flutter/material.dart';
import 'package:football_field_management_demo/models/account.dart';
import 'package:football_field_management_demo/models/manage.dart';
import 'package:football_field_management_demo/models/user.dart';
import 'package:football_field_management_demo/representation/home/screens/manage_screens/manage_screens.dart';
import 'package:football_field_management_demo/representation/home/screens/user_screens/user_screens.dart';
import 'package:football_field_management_demo/representation/home/widgets/manage_widget/sidebar_page.dart';
import 'package:football_field_management_demo/services/auth_service.dart';
import 'package:football_field_management_demo/services/manage_database_services.dart';
import 'package:football_field_management_demo/services/user_database_services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreens extends StatefulWidget {
  HomeScreens({super.key, required this.uid});

  String? uid;

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  final AuthServices auth = AuthServices();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool permission = false;
  @override
  void initState() {
    super.initState();
    getPermission(widget.uid);
    debugPrint(widget.uid);
  }

  void getPermission(String? uid) async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      permission = prefs.getBool(uid ?? '') ?? false;
    });
    debugPrint('$permission');
  }

  @override
  Widget build(BuildContext context) {
    if (permission) {
      return StreamProvider<Manage?>.value(
        value: ManageDatabaseServices(uid: widget.uid).manage,
        initialData: Manage(),
        child: Scaffold(
          body: Stack(
            children: const [
              SideBarPage(),
              ManageHomeScreens(),
            ],
          ),
        ),
      );
    } else {
      return StreamProvider<User>.value(
        value: UserDatabaseServices(uid: widget.uid).user,
        initialData: User(),
        child: UserHomeScreens(),
      );
    }
  }
}
