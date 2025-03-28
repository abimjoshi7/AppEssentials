part of 'src.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.primaryColorLight.withValues(alpha: 0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              Icons.info_outline_rounded,
              color: context.disabledColor,
              size: 15,
            ),
            8.widthBox,
            Flexible(
              child: Text(
                text,
                style: context.labelSmallDisabled,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
