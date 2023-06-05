import 'package:flutter/material.dart';
import 'package:football_field_management_demo/http/network/network_model.dart';

class FootballPitches extends StatefulWidget {
  FootballPitches({super.key, required this.number, required this.nameField});

  String nameField;
  int number;

  @override
  State<FootballPitches> createState() => _FootballPitchesState();
}

class _FootballPitchesState extends State<FootballPitches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sân Số ${widget.number}'),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: NetworkRequest.getUserDataByNumberYard(
              widget.nameField, widget.number),
          builder: (context, snapshot) {
            var data = snapshot.data;
            if (data == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: data.length,
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
                            '${data[index].nameUser}(${data[index].phoneNumber})',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${data[index].timeSlot}(${data[index].dataToday})',
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
        ));
  }
}
