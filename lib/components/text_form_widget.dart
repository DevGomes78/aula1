import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  String? labelText;
  String? hintText;
  Widget? prefixIcon;
  TextEditingController? controller;
  FormFieldValidator<String>? validator;
  bool obscureText;

  TextFormWidget(
    this.labelText,
    this.hintText,
    this.prefixIcon,{
    this.controller,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )),
      obscureText: obscureText,
      validator: validator,
    );
  }
}
