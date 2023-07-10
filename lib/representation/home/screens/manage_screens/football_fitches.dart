import 'dart:async';

import 'package:flutter/material.dart';
import 'package:football_field_management_demo/http/network/network_model.dart';
import 'package:football_field_management_demo/representation/widgets/loading.dart';

class FootballPitches extends StatefulWidget {
  FootballPitches({super.key, required this.number, required this.nameField});

  String nameField;
  int number;
  bool isLoading = true;

  @override
  State<FootballPitches> createState() => _FootballPitchesState();
}

class _FootballPitchesState extends State<FootballPitches> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        setState(() {
          widget.isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('hehe');
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.nameField} ( Sân ${widget.number} )'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: NetworkRequest.getUserDataByNumberYard(
            widget.nameField, widget.number),
        builder: (context, snapshot) {
          debugPrint('${snapshot.data}');
          return widget.isLoading
              ? Center(
                  child: loading(),
                )
              : (snapshot.data == null)
                  ? const Center(child: Text('List Emty'))
                  : ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 24, horizontal: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${snapshot.data![index].nameUser} ( ${snapshot.data![index].phoneNumber} )',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${snapshot.data![index].timeSlot} ( ${snapshot.data![index].dataToday} )',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
        },
      ),
    );
  }
}
