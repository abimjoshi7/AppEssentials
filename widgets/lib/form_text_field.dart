import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final ValueChanged<String?>? onSaved;

  const FormTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        onSaved: onSaved,
        decoration: InputDecoration(labelText: labelText),
      ),
    );
  }
}
