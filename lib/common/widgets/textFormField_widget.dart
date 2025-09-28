import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UTextFormField extends StatelessWidget {
  const UTextFormField({
    super.key, required this.controller, required this.labelText, required this.hintText,
  });

  final TextEditingController controller;
  final String labelText, hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
              BorderSide(color: Colors.blue, width: 2))),
    );
  }
}