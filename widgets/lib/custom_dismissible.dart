import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

class CustomDismissible extends StatelessWidget {
  const CustomDismissible({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async => switch (direction) {
        DismissDirection.endToStart => await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Delete Item"),
              content: const Text("Are you sure to delete the selected item?"),
              actions: [
                OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    onPressed();
                    context.burn();
                  },
                  child: const Text("Confirm"),
                ),
              ],
            ),
          ),
        _ => false,
      },
      child: child,
    );
  }
}
