import 'package:flutter/material.dart';

class AttachmentWithBadge extends StatelessWidget {
  const AttachmentWithBadge({
    super.key,
    required this.count,
    required this.onPressed,
  });

  final int count;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Badge.count(
      count: count,
      isLabelVisible: count > 0,
      child: IconButton.filledTonal(
        onPressed: onPressed,
        icon: const Icon(
          Icons.attachment_rounded,
        ),
      ),
    );
  }
}
