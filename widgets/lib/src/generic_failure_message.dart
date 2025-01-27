part of 'src.dart';

class GenericFailureMessage extends StatelessWidget {
  const GenericFailureMessage({
    super.key,
    this.message = "Something went wrong. Please try again.",
    this.onPress,
  });

  final String? message;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          if (message != null)
            Text(
              message!,
              style: context.headlineSmall,
              textAlign: TextAlign.center,
            ),
          OutlinedButton(
            onPressed: onPress,
            child: Text(
              "Retry",
              style: context.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
