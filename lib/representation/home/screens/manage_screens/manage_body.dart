import 'package:flutter/material.dart';
import 'package:football_field_management_demo/models/manage.dart';
import 'package:football_field_management_demo/representation/home/widgets/manage_widget/football_fitches.dart';
import 'package:provider/provider.dart';

class ManageBody extends StatefulWidget {
  const ManageBody({super.key});

  @override
  State<ManageBody> createState() => _ManageBodyState();
}

class _ManageBodyState extends State<ManageBody> {
  @override
  Widget build(BuildContext context) {
    final manage = Provider.of<Manage>(context);

    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        itemCount: manage.numberYard,
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
                    builder: (context) => FootballPitches(number: index + 1),
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
