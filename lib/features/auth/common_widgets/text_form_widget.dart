import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    super.key,
    required this.iconName,
    this.iconNameOptional,
    required this.label,
    this.controller,
    this.obscureText = false,
  });

  final IconData iconName;
  final IconData? iconNameOptional;
  final String label;
  final TextEditingController? controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(
          iconName,
          color: Colors.white70,
        ),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        suffixIcon: iconNameOptional != null
            ? Icon(
                iconNameOptional,
                color: Colors.white70,
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
