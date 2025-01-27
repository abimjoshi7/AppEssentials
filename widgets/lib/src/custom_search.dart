part of 'src.dart';

class CustomSearch<T> extends SearchDelegate<T> {
  final List<T> list;
  final String Function(T t) getTitle;
  final bool hasScanner;

  CustomSearch({
    required this.getTitle,
    this.list = const [],
    this.hasScanner = false,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (hasScanner)
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.qr_code_scanner_rounded,
          ),
        )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: list
            .map(
              (e) => Card(
                child: ListTile(
                  title: Text(
                    getTitle(e),
                  ),
                  onTap: () {
                    close(context, e);
                  },
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: list
            .where(
              (element) => getTitle(element).toLowerCase().contains(
                    query.toLowerCase(),
                  ),
            )
            .map(
              (e) => Card(
                child: ListTile(
                  title: Text(
                    getTitle(e),
                  ),
                  onTap: () {
                    close(context, e);
                  },
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
