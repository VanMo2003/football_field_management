import 'package:flutter/material.dart';

class FootballPitches extends StatefulWidget {
  FootballPitches({super.key, required this.number});

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
      body: Center(
        child: Text('Sân số ${widget.number}'),
      ),
    );
  }
}
