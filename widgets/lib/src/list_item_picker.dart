part of 'src.dart';

class ListItemPicker<T> extends StatelessWidget {
  final List<T>? itemList;
  final ValueChanged<T>? onItemSelected;
  final String Function(T)? itemLabel;

  const ListItemPicker({
    super.key,
    required this.itemList,
    required this.onItemSelected,
    this.itemLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Choose item",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.5,
            ),
            child: itemList != null && itemList!.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: itemList!.length,
                    itemBuilder: (context, index) {
                      T item = itemList![index];
                      return Card(
                        child: ListTile(
                          onTap: () {
                            onItemSelected?.call(item);
                          },
                          title: Text(
                            itemLabel?.call(item) ?? item.toString(),
                          ),
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text("No items available"),
                  ),
          ),
        ],
      ),
    );
  }
}
