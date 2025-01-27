part of 'src.dart';

class AppFilter<T> extends StatefulWidget {
  const AppFilter({
    super.key,
    required this.initialValue,
    required this.list,
    required this.getStringList,
    required this.onSelected,
  });

  final List<T> list;
  final List<String> Function(List<T> list) getStringList;
  final ValueChanged<T> onSelected;
  final String initialValue;

  @override
  State<AppFilter<T>> createState() => _AppFilterState<T>();
}

class _AppFilterState<T> extends State<AppFilter<T>> {
  late String toSelectString;

  @override
  void initState() {
    super.initState();
    toSelectString = widget.initialValue;
  }

  void onSelect(
      {required BuildContext context,
      required ValueNotifier<String?> toSelect,
      required String selectedString,
      required T value}) {
    toSelect.value = selectedString;
    widget.onSelected(value);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            16.widthBox,
            Expanded(
              child: Text(
                "Filter",
                style: context.headlineSmall,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: context.burn,
            )
          ],
        ),
        16.heightBox,
        Row(
          children: [
            Text(
              "Default Filter",
              style: context.labelSmallDisabled,
            ),
            8.widthBox,
            const Expanded(
              child: Divider(),
            ),
          ],
        ),
        Flexible(
            child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.getStringList(widget.list).length,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.all(4),
            decoration:
                toSelectString == widget.getStringList(widget.list)[index]
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          24,
                        ),
                        border: Border.all(
                          color: context.primary,
                        ),
                      )
                    : null,
            child: ListTile(
              splashColor: kClrTrns,
              onTap: () => onSelect(
                context: context,
                selectedString: widget.getStringList(widget.list)[index],
                toSelect: ValueNotifier(toSelectString),
                value: widget.list[index],
              ),
              title: Text(
                widget.getStringList(widget.list)[index],
              ),
              trailing:
                  toSelectString == widget.getStringList(widget.list)[index]
                      ? const Icon(
                          Icons.check_circle_rounded,
                          color: kClrGreen,
                        )
                      : null,
            ),
          ),
        )),
      ],
    );
  }
}
