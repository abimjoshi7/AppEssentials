import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

class RoutingCard extends StatelessWidget {
  const RoutingCard({
    super.key,
    required this.label,
    required this.callback,
    this.trailing,
  });

  final String label;
  final VoidCallback callback;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Card(
        child: Padding(
          padding: 8.paddingAll,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  label,
                  style: context.labelLarge,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              trailing ??
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 8,
                  )
            ],
          ),
        ),
      ),
    );
  }
}
