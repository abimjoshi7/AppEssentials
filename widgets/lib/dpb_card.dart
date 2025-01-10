import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:utils/utils.dart';
import 'package:widgets/widgets.dart';

class DPBCard extends StatelessWidget {
  /// Date Particular Balance Card.
  ///
  const DPBCard({
    super.key,
    required this.amount,
    required this.title,
    this.date,
    this.extraAmount,
    this.status,
    this.statusName,
    this.onTap,
    this.onDismiss,
    this.leading,
    this.trailing,
    this.currencyName,
  });

  final DateTime? date;
  final String amount;
  final String? extraAmount;
  final int? status;
  final String? statusName;
  final Widget title;
  final VoidCallback? onDismiss;
  final VoidCallback? onTap;
  final Widget? leading;
  final Widget? trailing;
  final String? currencyName;

  @override
  Widget build(BuildContext context) {
    return CustomDismissible(
      onPressed: onDismiss ?? () {},
      child: Card(
        surfaceTintColor: context.primary,
        child: ListTile(
          contentPadding: 4.paddingAll,
          onTap: onTap,
          leading: leading ??
              (date == null
                  ? null
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            DateFormat("MMM").format(date!),
                          ),
                          Text(
                            DateFormat("dd").format(date!),
                          ),
                        ],
                      ),
                    )),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                title,
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (status != null && statusName != null)
                        StatusIndicator(
                          color: switch (status) {
                            1 => kClrGreenA,
                            _ => context.disabledColor,
                          },
                          text: statusName ?? "Unknown",
                        ),
                      trailing == null
                          ? Flexible(
                              child: Text(
                                "${currencyName ?? 'Rs'} ${amount.formatWithCommas()}",
                                style: context.titleMedium,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          : trailing!,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
