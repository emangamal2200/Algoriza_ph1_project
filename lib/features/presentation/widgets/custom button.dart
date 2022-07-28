import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String? bLabel;
  final VoidCallback? myFunc;

  CustomButtonWidget({
    this.bLabel,
    required this.myFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 15, end: 13, bottom: 10),
      child: Container(
        width: 335,
        height: 45,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Color(0xff25c06d),
          borderRadius: BorderRadius.circular(13),
        ),
        child: OutlinedButton(
          onPressed: myFunc,
          child: Text(
            bLabel!,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
