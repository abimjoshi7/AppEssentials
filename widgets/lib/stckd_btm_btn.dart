import 'package:flutter/material.dart';

class StckdBtmBtn extends StatelessWidget {
  const StckdBtmBtn({
    super.key,
    required this.onPressed,
    required this.labelText,
  });

  final VoidCallback onPressed;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(labelText),
      ),
    );
  }
}
