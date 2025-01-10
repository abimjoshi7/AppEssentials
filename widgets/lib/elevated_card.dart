import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

class ElevatedCard extends StatelessWidget {
  const ElevatedCard({
    super.key,
    required this.child,
    this.title,
    this.trailing,
    this.color,
    this.cardElevation,
  });

  final Widget child;
  final String? title;
  final Widget? trailing;
  final Color? color;
  final double? cardElevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: cardElevation,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            if (title != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title!,
                    style: context.titleMedium,
                  ),
                  if (trailing != null) trailing!,
                ],
              ),
            child,
          ],
        ),
      ),
    );
  }
}
