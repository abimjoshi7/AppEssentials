import 'package:flutter/material.dart';
import 'package:utils/utils.dart';
import 'package:widgets/widgets.dart';

class AppSorter<T> extends StatefulWidget {
  const AppSorter({
    super.key,
    required this.list,
    required this.getStringList,
    required this.onSelected,
    required this.initialValue,
    required this.initialSortType,
  });

  final List<T> list;
  final List<String> Function(List<T> list) getStringList;
  final ValueChanged<(T t, bool isAscending)> onSelected;
  final String initialValue;
  final bool initialSortType;

  @override
  State<AppSorter<T>> createState() => _AppSorterState<T>();
}

class _AppSorterState<T> extends State<AppSorter<T>> {
  late String toSelectString;
  late bool isAscending;
  T? selectedValue;

  @override
  void initState() {
    super.initState();
    toSelectString = widget.initialValue;
    isAscending = widget.initialSortType;
  }

  @override
  Widget build(BuildContext context) {
    void onSelect({
      required String selectedString,
      required T value,
    }) {
      setState(() {
        selectedValue = value;
        if (toSelectString == selectedString) {
          isAscending = !isAscending;
        } else {
          toSelectString = selectedString;
        }
      });
    }

    void onCancel() {
      setState(() {
        toSelectString = widget.initialValue;
        isAscending = true;
      });
      Navigator.pop(context);
    }

    void onApply() {
      if (selectedValue == null) return;
      final sortedRecord = (selectedValue!, isAscending);
      widget.onSelected(sortedRecord);
      Navigator.pop(context);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            16.widthBox,
            Expanded(
              child: Text(
                "Sort",
                style: context.headlineSmall,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: onCancel,
            ),
          ],
        ),
        16.heightBox,
        Row(
          children: [
            Text(
              "Sort by",
              style: context.labelSmallDisabled,
            ),
            8.widthBox,
            const Expanded(
              child: Divider(),
            )
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
                  selectedString: widget.getStringList(widget.list)[index],
                  value: widget.list[index],
                ),
                leading: Icon(
                  toSelectString == widget.getStringList(widget.list)[index]
                      ? Icons.circle
                      : Icons.circle_outlined,
                  color: context.primary,
                ),
                title: Text(
                  widget.getStringList(widget.list)[index],
                ),
                trailing:
                    toSelectString == widget.getStringList(widget.list)[index]
                        ? _BoolWidget(
                            isAscending: isAscending,
                          )
                        : null,
              ),
            ),
          ),
        ),
        const InfoCard(
            text:
                "Tap on selection to change from ascending to descending and vice versa"),
        const Divider(),
        ListTile(
          title: Text(
            "Sort Selected",
            style: context.labelSmallDisabled,
          ),
          subtitle: Text(
              "$toSelectString ${isAscending ? "(Ascending)" : "(Descending)"}"),
          trailing: ElevatedButton(
            onPressed: onApply,
            child: const Text(
              "Apply",
            ),
          ),
        )
      ],
    );
  }
}

class _BoolWidget extends StatelessWidget {
  const _BoolWidget({
    required this.isAscending,
  });

  final bool isAscending;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          isAscending ? "Ascending" : "Descending",
          style: context.labelLarge?.copyWith(
            fontWeight: FontWeight.w300,
          ),
        ),
        8.widthBox,
        Icon(
          isAscending ? Icons.arrow_upward : Icons.arrow_downward,
          color: context.primary,
          size: 16,
        )
      ],
    );
  }
}
