import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';

class InputText extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String label;
  final String? helperText;
  final String? Function(String? value) validator;
  final ValueChanged<String> onChanged;
  final bool obscureText;
  final FocusNode? focusNode;

  const InputText({
    Key? key,
    this.controller,
    this.textInputType = TextInputType.text,
    this.helperText,
    required this.textInputAction,
    required this.label,
    required this.validator,
    required this.onChanged,
    this.obscureText = false,
    this.focusNode,
  }) : super(key: key);

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  Color _colorText = AppColors.black54;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: widget.textInputAction,
      focusNode: widget.focusNode,
      obscureText: widget.obscureText,
      controller: widget.controller,
      keyboardType: widget.textInputType,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(color: _colorText),
        helperText: widget.helperText,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.black54, width: 2.0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.minsk, width: 2.0),
        ),
      ),
    );
  }
}
