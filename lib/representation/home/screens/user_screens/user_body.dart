import 'package:flutter/material.dart';
import 'package:football_field_management_demo/core/constants/size_constant.dart';
import 'package:football_field_management_demo/http/network/football_field_network.dart';
import 'package:football_field_management_demo/representation/home/screens/manage_screens/manage_body.dart';
import 'package:football_field_management_demo/representation/widgets/loading.dart';

class UserBody extends StatefulWidget {
  const UserBody({super.key});

  @override
  State<UserBody> createState() => _UserBodyState();
}

class _UserBodyState extends State<UserBody> {
  @override
  Widget build(BuildContext context) {
    debugPrint('hehe');
    return FutureBuilder(
      future: FootballFieldNetwork.getFootballField(),
      builder: (context, snapshot) {
        var data = snapshot.data;
        if (data == null) {
          return Center(
            child: loading(),
          );
        }
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConstant.sizeWidthScreen(context) * 0.05),
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: GestureDetector(
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
                              child: Scaffold(
                                appBar: AppBar(
                                  title: Text(data[index].nameFootballField),
                                  centerTitle: true,
                                ),
                                body: ManageBody(
                                  nameField: data[index].nameFootballField,
                                  totalYards: data[index].totalYards,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 3),
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                          '${data[index].nameFootballField} ( ${data[index].totalYards} )'),
                      subtitle: Text(data[index].nameManage),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
