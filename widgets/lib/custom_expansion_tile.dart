import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

class CustomExpansionTile<T> extends StatelessWidget {
  const CustomExpansionTile({
    super.key,
    required this.getTitle,
    required this.getChildren,
    this.t,
    this.shapeOrder = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    this.leading,
    this.trailing,
    this.onExpansionChanged,
    this.isExpanded = false,
    this.expansionTileController,
  });

  final T? t;
  final String Function(T?) getTitle;
  final List<Widget> Function(T?) getChildren;
  final ShapeBorder? shapeOrder;
  final Widget? leading;
  final Widget? trailing;
  final ValueChanged<bool>? onExpansionChanged;
  final bool isExpanded;
  final ExpansionTileController? expansionTileController;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        highlightColor: kClrTrns,
        splashColor: kClrTrns,
      ),
      child: ExpansionTileTheme(
        data: ExpansionTileThemeData(
          shape: shapeOrder,
        ),
        child: ExpansionTile(
          controller: expansionTileController,
          leading: leading,
          initiallyExpanded: isExpanded,
          onExpansionChanged: onExpansionChanged,
          backgroundColor: kClrTrns,
          title: Text(
            getTitle(t),
            style: context.titleMedium,
          ),
          trailing: trailing,
          children: getChildren(t),
        ),
      ),
    );
  }
}
