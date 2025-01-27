part of 'src.dart';

class AmountStatus extends StatelessWidget {
  const AmountStatus({
    super.key,
    this.colorStatus = Colors.green,
    this.amount = '0',
    this.description = '',
  });

  final Color colorStatus;
  final String amount;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(
              Icons.circle,
              size: 12,
              color: colorStatus,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rs $amount',
                style: context.titleMedium,
              ),
              Text(
                description,
                style: context.labelLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
