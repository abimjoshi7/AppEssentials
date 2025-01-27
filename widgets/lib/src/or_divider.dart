part of 'src.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: Text(
            "OR",
            style: context.bodySmall?.copyWith(
              fontSize: 16,
            ),
          ),
        ),
        const Expanded(
          child: Divider(),
        ),
      ],
    );
  }
}
