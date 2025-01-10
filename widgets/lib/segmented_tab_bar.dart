import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

class SegmentedTabBar extends StatelessWidget {
  const SegmentedTabBar({
    super.key,
    required this.tabController,
    required this.tabs,
    this.borderRadius,
    this.height = 40,
    this.width,
  });

  final TabController tabController;
  final List<Widget> tabs;
  final BorderRadiusGeometry? borderRadius;
  final double height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius ??
            BorderRadius.circular(
              16,
            ),
      ),
      height: height,
      width: width ?? context.width,
      child: TabBar(
        dividerHeight: 0,
        overlayColor: WidgetStatePropertyAll(context.background),
        controller: tabController,
        labelColor: context.indicatorColor,
        indicator: BoxDecoration(
          color: context.primary,
          borderRadius: borderRadius ??
              BorderRadius.circular(
                16,
              ),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: tabs,
      ),
    );
  }
}
