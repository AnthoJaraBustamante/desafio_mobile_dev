import 'package:flutter/material.dart';

class GlobalTextFormField extends StatelessWidget {
  const GlobalTextFormField({
    Key? key,
    required this.prefixIcon,
    required this.labelText,
    this.obscureText = false,
    this.suffix,
    this.controller,
    this.validator,
  }) : super(key: key);
  final TextEditingController? controller;
  final IconData prefixIcon;
  final String labelText;
  final bool obscureText;
  final Widget? suffix;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      //give a rounded aspect
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        prefixIcon: Icon(prefixIcon),
        labelText: labelText,
        suffixIcon: suffix,
      ),
    );
  }
}
