part of 'src.dart';

class EmptyAddCard extends StatelessWidget {
  const EmptyAddCard({
    super.key,
    required this.onPressed,
    required this.title,
    required this.hintText,
    required this.widgetList,
  });

  final VoidCallback onPressed;
  final String title;
  final String hintText;
  final List<Widget>? widgetList;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: TextTheme.of(context).labelLarge,
              ),
            ),
            Expanded(
              child: widgetList == null || (widgetList ?? []).isEmpty
                  ? Align(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton.filledTonal(
                            onPressed: onPressed,
                            icon: const Icon(
                              Icons.add,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              hintText,
                              style: TextTheme.of(context).labelSmall?.copyWith(
                                    color: Colors.grey,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: widgetList ?? [],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
