import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:utils/utils.dart';
import 'package:widgets/widgets.dart';

class AppSorter<T> extends HookWidget {
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
  Widget build(BuildContext context) {
    final toSelectString = useState<String>(initialValue);
    final isAscending = useState<bool>(initialSortType);
    final selectedValue = useState<T?>(null);

    void onSelect({
      required String selectedString,
      required T value,
    }) {
      selectedValue.value = value;
      if (toSelectString.value == selectedString) {
        isAscending.value = !isAscending.value;
      } else {
        toSelectString.value = selectedString;
      }
    }

    void onCancel() {
      toSelectString.value = initialValue;
      isAscending.value = true;

      Navigator.pop(context);
    }

    void onApply() {
      if (selectedValue.value == null) return;
      final sortedRecord = (selectedValue.value!, isAscending.value);
      onSelected(sortedRecord);
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
            itemCount: getStringList(list).length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.all(4),
              decoration: toSelectString.value == getStringList(list)[index]
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
                  selectedString: getStringList(list)[index],
                  value: list[index],
                ),
                leading: Icon(
                  toSelectString.value == getStringList(list)[index]
                      ? Icons.circle
                      : Icons.circle_outlined,
                  color: context.primary,
                ),
                title: Text(
                  getStringList(list)[index],
                ),
                trailing: toSelectString.value == getStringList(list)[index]
                    ? _BoolWidget(
                        isAscending: isAscending.value,
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
              "${toSelectString.value} ${isAscending.value ? "(Ascending)" : "(Descending)"}"),
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
