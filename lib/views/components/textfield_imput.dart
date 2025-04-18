import 'package:flutter/material.dart';

class TextFieldImput extends StatelessWidget {
  final String label;
  final Icon icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const TextFieldImput({
    super.key,
    required this.label,
    required this.icon,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
