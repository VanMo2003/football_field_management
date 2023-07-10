import 'package:flutter/material.dart';
import 'package:football_field_management_demo/http/network/football_field_network.dart';
import 'package:football_field_management_demo/representation/home/screens/manage_screens/manage_home.dart';
import 'package:football_field_management_demo/representation/home/screens/manage_screens/sidebar_page.dart';
import 'package:football_field_management_demo/representation/widgets/loading.dart';

class ManageScreen extends StatefulWidget {
  ManageScreen({super.key, required this.username});
  String username;

  @override
  State<ManageScreen> createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future:
            FootballFieldNetwork.getFootballFieldByUsername(widget.username),
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (data == null) {
            return Center(
              child: loading(),
            );
          }
          debugPrint('oke');

          return Stack(
            children: [
              SideBarPage(
                username: data.username,
                nameManage: data.nameManage,
              ),
              ManageHomeScreens(
                nameField: data.nameFootballField,
                totalYards: data.totalYards,
              ),
            ],
          );
        },
      ),
    );
  }
}
