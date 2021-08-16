import 'package:flutter/material.dart';

class CheckBoxForm extends TextFormField {
  final String? Function(String? value) validator;
  final String title;
  final bool Function(bool vaue) value;
  final bool Function(bool?)? onChanged;



  CheckBoxForm(
    this.validator,
    this.title,
    this.value,
    this.onChanged,
  ) : super();

}
