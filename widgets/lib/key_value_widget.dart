import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

class KeyValueWidget extends StatelessWidget {
  final String leading;
  final String trailing;
  final String? qty;
  final TextStyle? leadingStyle;
  final TextStyle? trailingStyle;

  const KeyValueWidget({
    super.key,
    required this.leading,
    required this.trailing,
    this.qty,
    this.leadingStyle,
    this.trailingStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: context.width * 0.4,
          child: Row(
            children: [
              Flexible(
                child: Text(
                  "$leading ",
                  style: leadingStyle ??
                      context.labelLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
              ),
              if (qty != null)
                Text(
                  " x $qty",
                  style: context.bodySmall?.copyWith(
                    color: kClrAqua,
                  ),
                ),
            ],
          ),
        ),
        4.widthBox,
        Text(
          trailing,
          style: trailingStyle ?? context.labelLarge,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
