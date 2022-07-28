import 'package:flutter/material.dart';

class UnCompletedTasksScreen extends StatelessWidget {
  const UnCompletedTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          'UnCompleted Tasks',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
