part of 'src.dart';

class ColumnInfoDetail extends StatelessWidget {
  const ColumnInfoDetail({
    super.key,
    required this.label,
    required this.content,
    this.currencyName,
  });

  final String label;
  final String content;
  final String? currencyName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextTheme.of(context).labelSmall,
        ),
        Row(
          children: [
            if (currencyName != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  currencyName!,
                  style: TextTheme.of(context).titleLarge,
                ),
              ),
            Text(
              content,
              style: TextTheme.of(context).titleLarge,
            ),
          ],
        ),
      ],
    );
  }
}
