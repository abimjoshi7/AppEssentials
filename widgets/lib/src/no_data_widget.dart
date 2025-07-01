part of 'src.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    super.key,
    this.errorMessage,
  });

  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: SvgPicture.asset(
                "assets/empty.svg",
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  errorMessage ?? "No Data Found",
                  style: TextTheme.of(context).labelSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
