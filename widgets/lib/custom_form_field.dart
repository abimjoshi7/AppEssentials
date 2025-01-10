import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.child,
    this.labelText,
    this.isRequired = false,
  });

  final String? labelText;
  final bool isRequired;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (labelText != null)
          Flexible(
            child: Row(
              children: [
                Text(
                  labelText!,
                  style: context.labelLarge,
                ),
                Visibility(
                  visible: isRequired,
                  child: Text(
                    " *",
                    style: context.labelLarge?.copyWith(
                      color: kClrRed,
                    ),
                  ),
                ),
              ],
            ),
          ),
        Flexible(
          child: child,
        ),
      ],
    );
  }
}
