import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String labelText, hintText;
  final TextEditingController controller;
  final IconData prefixIcon;
  final bool obscureText;

  const LoginTextField({
    Key key,
    this.controller,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller ?? null,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
      obscureText: obscureText,
    );
  }
}
