import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  // ignore: non_constant_identifier_names
  final TextInputType? KeyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FocusNode?focusNode;
  final String? Function(String?)? validator;
  const CustomTextField({
    super.key,
     // ignore: non_constant_identifier_names
     this.KeyboardType,
    required this.controller,
    this.focusNode,
    required this.hintText,
     this.obscureText=false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: KeyboardType,
      focusNode: focusNode,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon
      ),

    );
  }
}
