import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:localization/l10n/l10n.dart';
import 'package:utils/utils.dart';

class MasterPicker<T> extends HookWidget {
  const MasterPicker({super.key, 
    required this.list,
    required this.onSelected,
    required this.label,
    required this.getName,
    this.onCreate,
    this.hasCreate = false,
  });

  final List<T> list;
  final ValueChanged<T> onSelected;
  final String label;
  final VoidCallback? onCreate;
  final String Function(T) getName;
  final bool hasCreate;

  @override
  Widget build(BuildContext context) {
    var selectedValue = useValueNotifier<T?>(null);

    return ConstrainedBox(
      constraints: BoxConstraints.loose(
        Size(
          context.width,
          context.height * .5,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: context.bodyLarge,
                ),
                Visibility(
                  visible: hasCreate,
                  child: TextButton.icon(
                    onPressed: onCreate,
                    icon: const Icon(Icons.add),
                    label: const Text(
                      "Create new",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: list.isEmpty
                ? Center(
                    child: Text(context.l10n.kNoData),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, index) => Card(
                      child: ValueListenableBuilder<T?>(
                        valueListenable: selectedValue,
                        builder: (context, selected, _) {
                          return RadioListTile<T?>(
                            value: list[index],
                            groupValue: selected,
                            onChanged: (newValue) {
                              selectedValue.value = newValue as T;
                            },
                            title: Text(
                              getName(list[index]),
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  if (selectedValue.value == null) return;
                  onSelected(selectedValue.value as T);
                  context.burn();
                },
                child: Text(
                  context.l10n.kSave,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
