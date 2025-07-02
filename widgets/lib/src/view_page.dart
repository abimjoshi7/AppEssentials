part of 'src.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({
    super.key,
    this.appTitle,
    this.child,
    this.tabController,
    this.tabTitles,
    this.onSort,
    this.onFilter,
    this.onSearch,
    this.onFabPressed,
  });

  final String? appTitle;
  final Widget? child;
  final List<String>? tabTitles;
  final VoidCallback? onSort;
  final VoidCallback? onFilter;
  final VoidCallback? onSearch;
  final TabController? tabController;
  final VoidCallback? onFabPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: child,
      floatingActionButton: onFabPressed == null
          ? null
          : FloatingActionButton(
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
        appTitle ?? '',
        style: TextTheme.of(context).titleMedium,
      ),
      actions: [
        if (onSearch != null)
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: onSearch,
          ),
      ],
      bottom: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.sizeOf(context).height * 0.045),
        child: buildBottomAppBar(context),
      ),
    );
  }

  Widget buildBottomAppBar(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildCustomTabBar(context),
        if (onFilter != null) buildFilterButton(context),
        if (onSort != null)
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
        Size(MediaQuery.sizeOf(context).width * 0.5,
            MediaQuery.sizeOf(context).height * 0.045),
      ),
      child: tabController == null
          ? const SizedBox.shrink()
          : CustomTabBar(
              tabController: tabController!,
              labels: tabTitles ?? [],
              isScrollable: true,
            ),
    );
  }

  Widget buildFilterButton(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.025,
            child: VerticalDivider(
              color: Theme.of(context).colorScheme.tertiary,
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
