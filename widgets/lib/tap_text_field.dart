import 'package:flutter/material.dart';

class TapTextField extends StatelessWidget {
  const TapTextField({super.key, 
    required this.callback,
    required this.controller,
    required this.title,
  });

  final VoidCallback callback;
  final TextEditingController controller;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: title,
        ),
        controller: controller,
        readOnly: true,
        onTap: callback,
      ),
    );
  }
}
