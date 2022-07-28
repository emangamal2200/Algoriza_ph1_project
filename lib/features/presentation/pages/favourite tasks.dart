import 'package:flutter/material.dart';

class FavouriteTasksScreen extends StatelessWidget {
  const FavouriteTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          'Favourite Tasks',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
