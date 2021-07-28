import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType textInputType;
  final String label;
  final String? Function(String? value) validator;
  final ValueChanged<String> onChanged;
  final bool obscureText;

  const InputText({
    Key? key,
    this.controller,
    this.textInputType = TextInputType.text,
    required this.label,
    required this.validator,
    required this.onChanged,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      keyboardType: textInputType,
      onChanged: onChanged,
      decoration: InputDecoration(labelText: label),
    );
  }
}
