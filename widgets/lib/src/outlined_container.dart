part of 'src.dart';

class OutlinedContainer extends StatelessWidget {
  const OutlinedContainer({
    required this.title,
    required this.child,
    super.key,
    this.trailingWidget,
  });

  final String title;
  final Widget child;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withValues(alpha: .25),
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        spacing: 16,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextTheme.of(context).titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              trailingWidget ?? const SizedBox.shrink(),
            ],
          ),
          child,
        ],
      ),
    );
  }
}
