import 'package:flutter/material.dart';

Widget DefaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  String? hint,
  Function? validate,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  IconData? prefix,
  IconData? suffix,
  bool isPassword = false,
  bool isClickable = true,
  double width = 400,
  double suffixSize = 30,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          width: width,
          child: TextFormField(
            controller: controller,
            keyboardType: type,
            obscureText: isPassword,
            validator: (String? value) {
              return validate!(value);
            },
            onFieldSubmitted: (String? value) {
              return onSubmit!(value!);
            },
            onChanged: (String? value) {
              return onChange!(value!);
            },
            onTap: () {
              onTap!();
            },
            enabled: isClickable,
            decoration: InputDecoration(
              hintText: hint != null ? hint : null,
              hintStyle: TextStyle(
                fontSize: 13,
                color: Color(0xffc5c5c5),
                fontWeight: FontWeight.bold,
              ),
              prefixIcon: prefix != null
                  ? Icon(
                      prefix,
                      color: Color(0xffc5c5c5),
                    )
                  : null,
              suffixIcon: suffix != null
                  ? Icon(
                      suffix,
                      color: Color(0xffc5c5c5),
                      size: suffixSize,
                    )
                  : null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color(0xfff9f9f9),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.red),
              ),
              fillColor: Color(0xfff9f9f9),
              filled: true,
            ),
          ),
        ),
      ],
    );
