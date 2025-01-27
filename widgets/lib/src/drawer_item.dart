part of 'src.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    required this.label,
    required this.trailingIcon,
    required this.leadingIcon,
    required this.voidCallback,
    required this.isExpanded,
    super.key,
    this.style,
  });

  final String label;
  final Icon trailingIcon;
  final Icon leadingIcon;
  final VoidCallback voidCallback;
  final TextStyle? style;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return isExpanded
        ? ListTile(
            onTap: voidCallback,
            leading: leadingIcon,
            title: Text(
              label,
              style: style,
            ),
            trailing: trailingIcon,
          )
        : Card(
            child: IconButton(
              onPressed: voidCallback,
              icon: leadingIcon,
            ),
          );
  }
}
