import 'package:flutter/material.dart';

class CompletedTasksScreen extends StatelessWidget {
  const CompletedTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          'Completed Tasks',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
