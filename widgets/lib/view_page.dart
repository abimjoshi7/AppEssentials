import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:utils/utils.dart';
import 'package:widgets/widgets.dart';

class ViewPage extends HookWidget {
  const ViewPage({super.key, 
    required this.appTitle,
    required this.onSort,
    required this.onFilter,
    required this.onSearch,
    required this.tabController,
    required this.tabTitles,
    required this.onFabPressed,
    required this.child,
  });

  final String appTitle;
  final VoidCallback onSort;
  final VoidCallback onFilter;
  final VoidCallback onSearch;
  final TabController tabController;
  final Widget child;
  final List<String> tabTitles;
  final VoidCallback onFabPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: child,
      floatingActionButton: FloatingActionButton(
        onPressed: onFabPressed,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        appTitle,
        style: context.titleMedium,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: onSearch,
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(context.height * 0.045),
        child: buildBottomAppBar(context),
      ),
    );
  }

  Widget buildBottomAppBar(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildCustomTabBar(context),
        buildFilterButton(context),
        IconButton(
          icon: const Icon(Icons.sort),
          onPressed: onSort,
        ),
      ],
    );
  }

  Widget buildCustomTabBar(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.loose(
        Size(context.width * 0.5, context.height * 0.045),
      ),
      child: CustomTabBar(
        tabController: tabController,
        labels: tabTitles,
        isScrollable: true,
      ),
    );
  }

  Widget buildFilterButton(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          SizedBox(
            height: context.height * 0.025,
            child: VerticalDivider(
              color: context.disabledColor,
            ),
          ),
          InkWell(
            onTap: onFilter,
            child: const Icon(
              Icons.arrow_drop_down_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
