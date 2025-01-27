part of 'src.dart';

class SearchAndQr extends StatelessWidget {
  const SearchAndQr({
    super.key,
    required VoidCallback filterCallback,
    required VoidCallback searchCallback,
  })  : _qrCallback = filterCallback,
        _searchCallback = searchCallback;

  final VoidCallback _qrCallback;
  final VoidCallback _searchCallback;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: _searchCallback,
        leading: const Icon(Icons.search),
        title: const Text("Search..."),
        trailing: IconButton(
          onPressed: _qrCallback,
          icon: const Icon(
            Icons.qr_code_2_rounded,
          ),
        ),
      ),
    );
  }
}
