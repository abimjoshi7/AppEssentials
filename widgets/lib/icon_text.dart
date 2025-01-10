import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData iconData;
  final String text;

  const IconText({
    super.key,
    required this.iconData,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconData),
        Text(text),
      ],
    );
  }
}
