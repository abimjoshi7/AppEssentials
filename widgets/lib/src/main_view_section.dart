part of 'src.dart';

class MainViewSection extends StatelessWidget {
  const MainViewSection({
    required this.title,
    required this.child,
    this.trailingCallback,
    this.trailingTitle,
    super.key,
  });

  final String title;
  final String? trailingTitle;
  final VoidCallback? trailingCallback;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextTheme.of(context).titleMedium,
              ),
              if (trailingTitle != null)
                TextButton(
                  onPressed: trailingCallback,
                  child: Text(
                    trailingTitle!,
                    style: TextTheme.of(context).labelSmall,
                  ),
                ),
            ],
          ),
        ),
        child,
      ],
    );
  }
}
