import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

class StatusIndicator extends StatelessWidget {
  const StatusIndicator({
    super.key,
    required this.color,
    required this.text,
  });

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 4.paddingAll,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: color.withValues(alpha: 0.2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: color,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
