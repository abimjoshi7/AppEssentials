part of 'src.dart';

class ValueBox extends StatelessWidget {
  const ValueBox({
    super.key,
    required this.leading,
    required this.amount,
    required this.label,
    required this.color,
    this.height,
    this.width,
    this.onTap,
  });

  final Widget leading;
  final String amount;
  final String label;
  final Color color;
  final double? height;
  final double? width;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        surfaceTintColor: Theme.of(context).colorScheme.primaryContainer,
        child: Padding(
          padding: const EdgeInsets.all(
            16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leading,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    label,
                    style: TextTheme.of(context).labelLarge,
                  ),
                  Text(
                    amount,
                    style: TextTheme.of(context).titleMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
