import 'package:flutter/material.dart';

class CustomTabWidget extends StatelessWidget {
  final String? tLabel;

  CustomTabWidget({
    this.tLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: Text(
        tLabel!,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
