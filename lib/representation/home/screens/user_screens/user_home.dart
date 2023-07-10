import 'package:flutter/material.dart';
import 'package:football_field_management_demo/core/constants/boder_value.dart';
import 'package:football_field_management_demo/core/constants/size_constant.dart';
import 'package:football_field_management_demo/http/network/user_network.dart';
import 'package:football_field_management_demo/representation/home/screens/user_screens/user_body.dart';
import 'package:football_field_management_demo/representation/widgets/loading.dart';

class UserHome extends StatelessWidget {
  UserHome({super.key, required this.username});
  String username;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserNetwork.getUser(username),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: loading());
        }

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: SizeConstant.sizeHeightScreen(context) * 0.1,
            backgroundColor: Colors.white,
            elevation: 0,
            title: TextFormField(
              cursorColor: Colors.black,
              cursorHeight: 20,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                label: Text('Search Football Field'),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BoderValue.borderTextField,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BoderValue.borderTextField,
                ),
                border: OutlineInputBorder(
                  borderRadius: BoderValue.borderTextField,
                ),
              ),
            ),
          ),
          body: const Center(child: UserBody()),
        );
      },
    );
  }
}
