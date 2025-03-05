part of 'src.dart';

class CustomSearch<T> extends SearchDelegate<T> {
  final List<T> list;
  final String Function(T t) getTitle;
  final ValueChanged<String?>? onQuery;
  final ValueChanged<T>? onResult;
  final bool hasScanner;

  CustomSearch({
    required this.getTitle,
    this.onQuery,
    this.onResult,
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
    return ListView(
      shrinkWrap: true,
      children: list
          .map(
            (e) => Card(
              child: ListTile(
                title: Text(
                  getTitle(e),
                ),
                onTap: () {
                  onQuery?.call(query);
                  onResult?.call(e);
                  close(context, e);
                },
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      shrinkWrap: true,
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
                  onQuery?.call(query);
                  onResult?.call(e);
                  close(context, e);
                },
              ),
            ),
          )
          .toList(),
    );
  }
}
