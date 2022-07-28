import 'package:flutter/material.dart';

class ColorWidget extends StatelessWidget {
  Color? color;
  final VoidCallback? onTap;
  bool? hasFocus ;

  ColorWidget({Key? key, this.color, this.onTap, this.hasFocus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: hasFocus! ? 40 : 30,
        height: hasFocus! ? 40 : 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: hasFocus! ? 3 : 1,
            color: hasFocus! ? Colors.orange : Colors.black,
          ),
          color: color
        ),

      ),
    );
  }
}
