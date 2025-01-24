import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

class OutlinedContainer extends StatelessWidget {
  const OutlinedContainer({
    required this.title,
    required this.child,
    super.key,
    this.trailingWidget,
  });

  final String title;
  final Widget child;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 8.paddingAll,
      padding: 16.paddingAll,
      decoration: BoxDecoration(
        border: Border.all(
          color: kClrGrey.withValues(alpha: .25),
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: context.titleLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailingWidget ?? const SizedBox.shrink(),
            ],
          ),
          16.heightBox,
          child,
        ],
      ),
    );
  }
}
