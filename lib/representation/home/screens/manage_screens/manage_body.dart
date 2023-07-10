import 'package:flutter/material.dart';
import 'package:football_field_management_demo/representation/home/screens/manage_screens/football_fitches.dart';

class ManageBody extends StatefulWidget {
  ManageBody({super.key, required this.totalYards, required this.nameField});

  int totalYards;
  String nameField;

  @override
  State<ManageBody> createState() => _ManageBodyState();
}

class _ManageBodyState extends State<ManageBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        itemCount: widget.totalYards,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              debugPrint('you clicked the soccer field number ${index + 1}');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0.5, end: 1),
                      duration: const Duration(milliseconds: 300),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: FootballPitches(
                            nameField: widget.nameField,
                            number: index + 1,
                          ),
                        );
                      },
                    ),
                  ));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.green.withOpacity(0.3),
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
