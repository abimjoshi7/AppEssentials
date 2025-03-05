part of 'src.dart';

class CustomSearch<T> extends SearchDelegate<T> {
  final Future<List<T>> Function(String? query)? fetchResults;
  final String Function(T t) getTitle;
  final ValueChanged<String?>? onQuery;
  final ValueChanged<T>? onResult;
  final bool hasScanner;

  Timer? _debounce;
  List<T> _results = [];

  CustomSearch({
    required this.fetchResults,
    required this.getTitle,
    this.onQuery,
    this.onResult,
    this.hasScanner = false,
  });

  void _search(BuildContext context, String query) {
    onQuery?.call(query);

    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      final data = await fetchResults?.call(query);
      if (data == null) return;
      _results = data;
      if (context.mounted) showSuggestions(context); // Refresh UI
    });
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (hasScanner)
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.qr_code_scanner_rounded),
        ),
      if (query.isNotEmpty)
        IconButton(
          onPressed: () {
            query = '';
            _results.clear();
            showSuggestions(context);
          },
          icon: const Icon(Icons.clear),
        )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildList();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _search(context, query);
    return _buildList();
  }

  Widget _buildList() {
    return FutureBuilder<List<T>?>(
      future: fetchResults?.call(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No results found.'));
        }

        final results = snapshot.data!;
        return ListView(
          shrinkWrap: true,
          children: results
              .map(
                (e) => Card(
                  child: ListTile(
                    title: Text(getTitle(e)),
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
      },
    );
  }
}
