import 'package:flutter/material.dart';

mixin CustomExpansionTrailing {
  Widget get defaultWidget => const Icon(
        Icons.arrow_forward_ios,
        size: 10,
        color: Colors.grey,
      );

  Widget getTrailing({
    required BuildContext context,
    required bool isExpanded,
    double size = 10,
    Widget? preExpansion,
    Widget? postExpansion,
    Color? primaryColor,
    Color? disabledColor,
  }) =>
      (preExpansion == null && postExpansion == null)
          ? Icon(
              isExpanded ? Icons.keyboard_arrow_down : Icons.arrow_forward_ios,
              size: isExpanded ? (size + 8) : size,
              color: isExpanded
                  ? primaryColor ?? Colors.black
                  : disabledColor ?? Colors.grey,
            )
          : isExpanded
              ? postExpansion!
              : preExpansion!;
}
