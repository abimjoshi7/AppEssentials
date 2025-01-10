import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

class CustomAChip extends StatelessWidget {
  const CustomAChip({
    super.key,
    required this.label,
    this.leadingIcon,
    this.iconSize = 20,
    this.onPressed,
    this.isTrailingDisabled = false,
  });

  final String label;
  final IconData? leadingIcon;
  final double? iconSize;
  final VoidCallback? onPressed;
  final bool isTrailingDisabled;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: onPressed,
      label: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (isTrailingDisabled) 4.widthBox,
          if (leadingIcon != null)
            Icon(
              leadingIcon,
              size: iconSize,
            ),
          4.widthBox,
          ConstrainedBox(
            constraints: BoxConstraints.loose(
              Size(
                context.width * 0.25,
                context.height * 0.05,
              ),
            ),
            child: Text(
              label,
              style: context.labelLarge,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Visibility(
            visible: !isTrailingDisabled,
            child: Icon(
              Icons.arrow_drop_down,
              size: iconSize,
              color: kClrBgA,
            ),
          ),
        ],
      ),
    );
  }
}
