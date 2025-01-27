part of 'src.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.tabController,
    required this.labels,
    this.tabBarIndicatorSize = TabBarIndicatorSize.label,
    this.dividerColor = Colors.transparent,
    this.isScrollable = false,
    this.backgroundColor = const Color(0xFFF3F3F3),
    this.selectedBackgroundColor = Colors.white,
    this.labelColor = Colors.grey,
    this.selectedLabelColor = Colors.black,
    this.borderRadius = 25.0,
  });

  final TabController tabController;
  final List<String> labels;
  final TabBarIndicatorSize? tabBarIndicatorSize;
  final Color? dividerColor;
  final bool isScrollable;
  final Color backgroundColor;
  final Color selectedBackgroundColor;
  final Color labelColor;
  final Color selectedLabelColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: TabBar(
        dividerColor: dividerColor,
        indicatorSize: TabBarIndicatorSize.tab,
        isScrollable: isScrollable,
        tabAlignment: isScrollable ? TabAlignment.start : null,
        // Custom indicator
        indicator: BoxDecoration(
          color: selectedBackgroundColor,
          borderRadius: BorderRadius.circular(borderRadius - 4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        dividerHeight: 0,
        labelPadding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        labelColor: selectedLabelColor,
        unselectedLabelColor: labelColor,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        // Tabs
        tabs: labels
            .map((label) => Tab(
                  height: 36,
                  text: label,
                ))
            .toList(),
        controller: tabController,
      ),
    );
  }
}
