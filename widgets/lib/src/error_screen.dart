part of 'src.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    super.key,
    this.errorMessage,
  });

  final String? errorMessage;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  errorMessage ?? 'Unknown Error.',
                  style: TextTheme.of(context).titleLarge,
                ),
              ),
              OutlinedButton(
                onPressed: () => Navigator.of(context).pop(context),
                child: const Text(
                  "Go Back",
                ),
              ),
            ],
          ),
        ),
      );
}
