part of 'src.dart';

class PopupBox extends StatelessWidget {
  const PopupBox({
    required this.child,
    required this.popupList,
    super.key,
  });

  final Widget child;
  final List<PopupMenuItem<String>> popupList;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: context.size!.height * 0.25,
        maxWidth: context.size!.width * 0.6,
      ),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: PopupMenuButton(
                itemBuilder: (context) => popupList,
              ),
            ),
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
