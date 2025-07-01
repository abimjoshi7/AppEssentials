part of 'src.dart';

class CustomAChip extends StatelessWidget {
  const CustomAChip({
    super.key,
    required this.label,
    this.leadingIcon,
    this.iconSize = 20,
    this.onPressed,
    this.isTrailingDisabled = false,
  });

  final String label;
  final IconData? leadingIcon;
  final double? iconSize;
  final VoidCallback? onPressed;
  final bool isTrailingDisabled;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: onPressed,
      label: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (isTrailingDisabled) SizedBox(width: 4),
          if (leadingIcon != null)
            Icon(
              leadingIcon,
              size: iconSize,
            ),
          SizedBox(width: 4),
          ConstrainedBox(
            constraints: BoxConstraints.loose(
              Size(
                context.size!.width * 0.25,
                context.size!.height * 0.05,
              ),
            ),
            child: Text(
              label,
              style: TextTheme.of(context).labelLarge,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Visibility(
            visible: !isTrailingDisabled,
            child: Icon(
              Icons.arrow_drop_down,
              size: iconSize,
            ),
          ),
        ],
      ),
    );
  }
}
