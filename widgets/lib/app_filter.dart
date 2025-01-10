import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:localization/l10n/l10n.dart';
import 'package:utils/utils.dart';

class AppFilter<T> extends HookWidget {
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

  void onSelect(
      {required BuildContext context,
      required ValueNotifier<String?> toSelect,
      required String selectedString,
      required T value}) {
    toSelect.value = selectedString;
    onSelected(value);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final toSelectString = useState<String>(initialValue);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            16.widthBox,
            Expanded(
              child: Text(
                context.l10n.kFilter,
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
              context.l10n.kDefaultFilter,
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
                context: context,
                selectedString: getStringList(list)[index],
                toSelect: toSelectString,
                value: list[index],
              ),
              title: Text(
                getStringList(list)[index],
              ),
              trailing: toSelectString.value == getStringList(list)[index]
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
