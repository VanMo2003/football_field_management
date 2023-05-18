import 'package:flutter/material.dart';
import 'package:football_field_management_demo/models/https/result_by_number_yard.dart';
import 'package:football_field_management_demo/network/network_request.dart';

class FootballPitches extends StatefulWidget {
  FootballPitches(
      {super.key, required this.nameFootballField, required this.number});

  String nameFootballField;
  int number;

  @override
  State<FootballPitches> createState() => _FootballPitchesState();
}

class _FootballPitchesState extends State<FootballPitches> {
  List<ResultByNumberYard>? resultList = [];
  List<UserInformation>? userInformationList = [];

  @override
  void initState() {
    super.initState();

    NetworkRequest().fetchPost(widget.nameFootballField, widget.number)
        .then((value) {
      debugPrint('loading data number yard 1');
      setState(() {
        resultList?.addAll(value!);
        debugPrint('result : $resultList');
        resultList?.map((e) {
          userInformationList = e.data;
          debugPrint('user : $userInformationList');
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sân Số ${widget.number}'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Sân số ${widget.number}'),
      ),
    );
  }
}
